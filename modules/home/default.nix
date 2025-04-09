{
  inputs,
  username,
  host,
  ...
}: {
  imports = [
    ./bat.nix # better cat command
    ./browser.nix # firefox based browser
    ./btop.nix # resouces monitor
    ./bottom.nix # resouces monitor
    ./cava.nix # audio visualizer
    ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./gaming.nix # packages related to gaming
    ./git.nix # version control
    ./gnome.nix # gnome apps
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./kitty.nix # terminal
    ./swayosd.nix # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    ./nemo.nix # file manager
    #./nixvim.nix
    ./zathura.nix
    ./typst.nix # 
    ./obsidian.nix # note taking
    ./p10k/p10k.nix # terminal status line
    ./packages.nix # other packages
    ./rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./spicetify.nix # spotify client
    ./starship.nix # shell prompt
    ./swaylock.nix # lock screen
    ./viewnior.nix # image viewer
    ./waybar # status bar
    ./waypaper.nix # GUI wallpaper picker
    ./xdg-mimes.nix # xdg config
    ./yazi.nix # terminal file manager
    ./zsh # shell

    ./emacs.nix
    ./neovim
    #./neovim.nix
    #./nvf-configuration.nix

    ./ghostty.nix
  ];
}
