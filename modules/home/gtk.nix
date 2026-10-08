{ pkgs, config, ... }:
let
  monolisa = pkgs.callPackage ../../pkgs/monolisa/monolisa.nix { };
  monolisa-nerd = pkgs.callPackage ../../pkgs/monolisa/monolisa-nerd.nix { inherit monolisa; };
in
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  gtk = {
    enable = true;
    font = {
      name = "Iosevka NFM";
      size = 12;
    };
    theme = {
      name = "Gruvbox-Green-Dark";
      package = pkgs.gruvbox-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "green" ];
        tweakVariants = [ "macos" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    # Must be an explicit null, not just omitted: on home.stateVersion < 26.05
    # home-manager still defaults gtk4.theme to config.gtk.theme, so leaving the
    # line out changes nothing.
    #
    # A non-null gtk4.theme makes home-manager write
    # ~/.config/gtk-4.0/gtk.css (it @imports the theme, because GTK4 ignores
    # gtk-theme-name), and caelestia's theming engine -- caelestia-cli's
    # utils/theme.py -- overwrites that same file with wallpaper-derived
    # Material You colours. The result is a hard home-manager activation
    # failure: "Existing file '/home/samh/.config/gtk-4.0/gtk.css' would be
    # clobbered". Caelestia owns GTK4 colours now; GTK3 apps still get
    # Gruvbox-Green-Dark from gtk.theme and the GTK_THEME variable in
    # hyprland/variables.nix. gtk-4.0/settings.ini is still managed here and
    # does not conflict.
    gtk4.theme = null;
  };

  # home.pointerCursor sets XCURSOR_THEME and ~/.icons/default, which is what
  # libXcursor-linked apps read -- so this covers both the Hyprland and the
  # oxwm session. Keep it in sync with gtk.cursorTheme above and with
  # hyprland/exec-once.nix, which tells the compositor its own cursor.
  #
  # Classic is the black Bibata; Ice is the white one. Note that oxwm's root
  # window does not go through this: oxwm links libX11 but not libXcursor and
  # calls XCreateFontCursor, which falls back to the unthemeable core cursor
  # font (the angular black X11 arrow). oxwm's autostart runs
  # `xsetroot -cursor_name left_ptr` to overwrite it with the theme.
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
