{ inputs, ... }:

{
  # Import ONLY the shell's Home Manager module.
  # Note: It is "homeManagerModules.default" (plural).
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  # Configure Caelestia using the options from its module,
  # based on the documentation you provided.
  programs.caelestia = {
    enable = true; # Enables the shell

    # We no longer start the shell from the hyprland config,
    # so we enable the module's systemd service.
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    # Enable the CLI companion
    cli = {
      enable = true;
    };

    # Your custom settings
    settings = {
      appearance = {
        font.family = {
          sans = "CaskaydiaCove NF";
          mono = "CaskaydiaCove NF";
        };
      };
      general.apps = {
        terminal = "foot";
      };
      launcher.apps = {
        showIcons = true;
      };
      bar.workspaces = {
        label = " ";
      };
      # Point to your wallpaper directory
      paths = {
        wallpaperDir = "/home/samh/Pictures/Wallpapers";
      };
    };
  };
}
