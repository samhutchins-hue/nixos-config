{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awww
    grimblast
    hyprpicker
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    tesseract
    translate-shell
    ghostty
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };

  # HM only reloads Hyprland after a switch when `package` is set (lib.nix gates
  # onChange on it), and misc.disable_autoreload stops Hyprland noticing the new
  # file itself -- so without this, config changes wait for the next login.
  # Same script HM would run, pointed at the system hyprctl.
  xdg.configFile."hypr/hyprland.conf".onChange = ''
    (
      XDG_RUNTIME_DIR=''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
      if [[ -d "/tmp/hypr" || -d "$XDG_RUNTIME_DIR/hypr" ]]; then
        for i in $(/run/current-system/sw/bin/hyprctl instances -j | ${pkgs.jq}/bin/jq ".[].instance" -r); do
          /run/current-system/sw/bin/hyprctl -i "$i" reload config-only
        done
      fi
    )
  '';
}
