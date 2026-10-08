{ pkgs, ... }:
{
  programs.cava = {
    enable = true;
  };

  # The cava config is deliberately not managed here. caelestia-cli ships
  # data/templates/cava.conf and renders it to ~/.config/cava/config as part of
  # its wallpaper-driven theming, which clobbered the symlink this module used
  # to create and broke every home-manager activation with "Existing file
  # '/home/samh/.config/cava/config' would be clobbered".
  #
  # `programs.cava.enable` alone only installs the package -- home-manager's
  # cava module writes the config file only when `settings` is non-empty -- so
  # nothing here competes with caelestia for the file.
  #
  # The previous hand-written gruvbox gradient is kept below for reference; the
  # live colours now follow the wallpaper. Restoring it means taking the file
  # back from caelestia, not just uncommenting.
  #
  #   [general]
  #   autosens = 1
  #   overshoot = 0
  #
  #   [color]
  #   gradient = 1
  #   gradient_count = 8
  #   gradient_color_1 = '#99991a'
  #   gradient_color_2 = '#a28e00'
  #   gradient_color_3 = '#ab8200'
  #   gradient_color_4 = '#b37400'
  #   gradient_color_5 = '#bb6600'
  #   gradient_color_6 = '#c25400'
  #   gradient_color_7 = '#c8400d'
  #   gradient_color_8 = '#cd231d'
}
