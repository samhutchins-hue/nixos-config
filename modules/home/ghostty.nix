{ inputs, ... }:
let
  ghostty = inputs.ghostty.packages.x86_64-linux.default;
in
{
  home.packages = [ ghostty ];

  xdg.configFile."ghostty/config".text = ''
    # Font
    font-family = "Maple Mono"
    font-size = 16
    font-thicken = true
    font-feature = ss01
    font-feature = ss04
    
    bold-is-bright = false
    adjust-box-thickness = 1
    
    # Theme
    theme = "gruvbox"
    background-opacity = 0.66
    
    cursor-style = bar
    cursor-style-blink = false
    adjust-cursor-thickness = 1
    
    resize-overlay = never
    copy-on-select = false
    confirm-close-surface = false
    mouse-hide-while-typing = true
    
    window-theme = ghostty
    window-padding-x = 4
    window-padding-y = 6
    window-padding-balance = true
    window-padding-color = background
    window-inherit-working-directory = true
    window-inherit-font-size = true
    window-decoration = false
    
    gtk-titlebar = false
    gtk-single-instance = true
    gtk-tabs-location = hidden
    gtk-wide-tabs = false

    clipboard-read = allow
    clipboard-paste-protection = false

    shell-integration = zsh
    
    auto-update = off
  '';
  xdg.configFile."ghostty/themes/gruvbox".text = ''
    background = #151718
    foreground = #fbf1c7
    
    palette = 0=#3c3836
    palette = 1=#cc241d
    palette = 2=#98971a
    palette = 3=#d79921
    palette = 4=#458588
    palette = 5=#b16286
    palette = 6=#689d6a
    palette = 7=#a89984
    palette = 8=#928374
    palette = 9=#fb4934
    palette = 10=#b8bb26
    palette = 11=#fabd2f
    palette = 12=#83a598
    palette = 13=#d3869b
    palette = 14=#8ec07c
    palette = 15=#fbf1c7
    
    cursor-color = #D5C4A1
    
    selection-foreground = #282828
    selection-background = #98971A
  '';
}
