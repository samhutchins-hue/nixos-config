#!/usr/bin/env bash
# syncthing.sh — waybar custom module.
# One job: turn Syncthing's REST state into one line of waybar JSON.
# waybar runs this every N seconds and reads stdout. That's the entire interface.

API="http://localhost:8384/rest"

# Helper: print one waybar-shaped JSON line and stop.
# jq -n builds JSON from scratch with proper escaping — never assemble
# JSON by hand with printf/string interpolation.
emit() { # emit <text> <class> <tooltip>
  jq -cn --arg text "$1" --arg class "$2" --arg tooltip "$3" \
    '{text: $text, class: $class, tooltip: $tooltip}'
  exit 0
}

# Stage 0 — credential. Ask syncthing for its own API key at runtime
# instead of hardcoding a secret into a dotfile / the nix store.
# (Override with SYNCTHING_API_KEY in waybar's environment if you prefer.)
KEY="${SYNCTHING_API_KEY:-$(syncthing cli config gui apikey get 2>/dev/null)}"

# Stage 1 — liveness. /noauth/* endpoints skip auth on purpose:
# health checks shouldn't require secrets.
curl -sf --max-time 2 "$API/noauth/health" >/dev/null ||
  emit "" "offline" "syncthing: daemon not running"

[ -n "$KEY" ] || emit "" "error" "syncthing: couldn't read API key"

# Stage 2 — pull state. Two GETs over loopback TCP.
# The X-API-Key header is the entire auth handshake.
completion=$(curl -sf --max-time 2 -H "X-API-Key: $KEY" "$API/db/completion") ||
  emit "" "error" "syncthing: /db/completion failed"
connections=$(curl -sf --max-time 2 -H "X-API-Key: $KEY" "$API/system/connections") ||
  emit "" "error" "syncthing: /system/connections failed"

# Stage 3 — reshape. Upstream JSON in, the three fields waybar cares
# about out. No device param on /db/completion means "the local device,
# aggregated over all folders" — i.e. "how up to date am I?"
pct=$(jq -r '.completion' <<<"$completion")
need=$(jq -r '.needBytes' <<<"$completion")
online=$(jq -r '[.connections[] | select(.connected)] | length' <<<"$connections")

need_h=$(numfmt --to=iec "$need" 2>/dev/null || echo "$need")
tooltip=$(printf 'syncthing: %.1f%% in sync\nneed %sB · %s peer(s) connected' \
  "$pct" "$need_h" "$online")

# The glyph is Nerd Font U+F021 (refresh). Swap for plain "ST" if you
# don't run a patched font in waybar.
if [ "$need" = "0" ]; then
  emit "" "idle" "$tooltip"
else
  emit "$(printf ' %.0f%%' "$pct")" "syncing" "$tooltip"
fi
