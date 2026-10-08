{ ... }:
{
  # Bare quickshell trial, running alongside waybar rather than replacing it.
  #
  # `configs` symlinks each named directory to ~/.config/quickshell/<name>, so
  # ./bar lands at ~/.config/quickshell/bar and is launched with `qs -c bar`.
  # Nothing starts it automatically: systemd.enable is off and
  # hyprland/exec-once.nix still starts waybar, so the two can run side by side
  # (waybar is anchored bottom, this bar top).
  #
  # Iterating on the QML: the symlink points into the nix store, so quickshell's
  # hot reload sees nothing until a rebuild. For a live edit loop, point it at
  # the file in this repo instead:
  #   qs -p ~/nixos-config/modules/home/quickshell/bar/shell.qml
  # which reloads on every save.
  programs.quickshell = {
    enable = true;

    configs = {
      bar = ./bar;
    };

    # Only consumed by the systemd service (as `qs --config bar`), so it is
    # inert while systemd.enable is false -- it is set so that flipping the
    # service on later needs no other change.
    activeConfig = "bar";
  };
}
