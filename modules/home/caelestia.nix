{ inputs, ... }:
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  # Caelestia is the desktop shell: it provides the bar, notifications and OSD
  # that waybar + swaync used to, so hyprland/exec-once.nix no longer starts
  # those two. The modules are still imported, so reverting is just restoring
  # those two exec-once lines and setting systemd.enable back to false.
  #
  # Note this pulls in its own quickshell build -- the one pinned by the
  # caelestia flake, not the nixpkgs quickshell 0.3.0 that ./quickshell
  # installs. Both coexist; `qs` is the nixpkgs one.
  programs.caelestia = {
    enable = true;

    systemd = {
      enable = true;

      # Must be pinned. The option defaults to `config.wayland.systemd.target`,
      # which here is graphical-session.target -- and that target is also
      # reached by the X11 oxwm session (modules/core/oxwm.nix makes oxwm the
      # displayManager defaultSession). Caelestia is Wayland-only and its unit
      # hardcodes QT_QPA_PLATFORM=wayland, so starting it under oxwm would just
      # crash-loop it on Restart=on-failure. hyprland-session.target exists
      # because hyprland/hyprland.nix sets systemd.enable = true.
      target = "hyprland-session.target";
    };

    cli.enable = true;

    # Intentionally left unset: setting `settings` or `extraConfig` makes
    # home-manager own ~/.config/caelestia/shell.json as a read-only store
    # symlink, which stops caelestia from saving changes made in its own
    # settings UI. Leaving it empty keeps that file runtime-writable, which is
    # what you want while trying it out. Move settings here once they settle.
  };

  # Caelestia looks for wallpapers in ~/Pictures/Wallpapers (capital W); ours
  # live in ~/Pictures/wallpapers. Both the shell (utils/Paths.qml) and the CLI
  # (caelestia/utils/paths.py) check CAELESTIA_WALLPAPERS_DIR first, so point
  # that at the real folder instead of setting paths.wallpaperDir in shell.json
  # (which would make HM own that file -- see the note above). The shell scans
  # it recursively, so subfolders like others/ show up as categories.
  # The service gets it directly; sessionVariables covers `caelestia wallpaper`
  # run from a terminal.
  home.sessionVariables.CAELESTIA_WALLPAPERS_DIR = "$HOME/Pictures/wallpapers";
  systemd.user.services.caelestia.Service.Environment = [
    "CAELESTIA_WALLPAPERS_DIR=%h/Pictures/wallpapers"
  ];
}
