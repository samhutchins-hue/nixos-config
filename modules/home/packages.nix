{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      android-tools
      ## system
      bc
      keychain
      vim
      tailscale
      grim
      dualsensectl # dualsense controller support for linux
      aspell
      aspellDicts.en

      ## CLI utility
      #spotify-tui
      #bottles
      unrar
      djvulibre # djvu2pdf was removed; use `ddjvu -format=pdf in.djvu out.pdf`
      qbittorrent
      leetcode-cli
      ani-cli
      binsider
      bitwise # cli tool for bit / hex manipulation
      caligula # User-friendly, lightweight TUI for disk imaging
      dconf-editor
      docfd # TUI multiline fuzzy document finder
      eza # ls replacement
      entr # perform action when file change
      fd # find replacement
      ffmpeg
      file # Show file information
      gtt # google translate TUI
      gifsicle # gif utility
      gtrash # rm replacement, put deleted files in system trash
      hexdump
      imv # image viewer
      jq # JSON processor
      killall
      lazygit
      #libnotify
      man-pages # extra man pages
      mimeo
      mpv # video player
      # streamlink-twitch-gui-bin was removed from nixpkgs (unmaintained, insecure
      # bundled electron). No replacement upstream; the streamlink CLI plus the
      # ttv.lol plugin in ./streamlink.nix covers playback, chatterino7 the chat.
      chatterino7 # chat
      ncdu # disk space
      nitch # systhem fetch util
      onefetch # fetch utility for git repo
      pamixer # pulseaudio command line mixer
      playerctl # controller for media players
      poweralertd
      programmer-calculator
      ripgrep # grep replacement
      ripgrep-all # ripgrep but for everything
      swappy # snapshot editing tool
      tdf # cli pdf viewer
      tldr
      todo # cli todo list
      toipe # typing test in the terminal
      unzip
      valgrind # c memory analyzer
      wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
      wget
      yt-dlp-light
      xdg-utils
      xxd

      ## Tex
      texliveFull

      ## CLI
      cbonsai # terminal screensaver
      cmatrix
      pipes # terminal screensaver
      tty-clock # cli clock
      porsmo
      leetgo
      kakoune
      helix
      inputs.claude-code.packages.${pkgs.system}.default
      codex

      ## GUI Apps
      blender
      vencord
      #oterm

      (zoom-us.override {
        targetPkgs = pkgs: [
          pkgs.gsettings-desktop-schemas
        ];
      })

      easyeffects
      xournalpp
      code-cursor
      proton-vpn
      audacity
      #bleachbit                         # cache cleaner
      gimp
      #libreoffice
      nix-prefetch-github
      #obs-studio
      pavucontrol # pulseaudio volume controle (GUI)
      qalculate-gtk # calculator
      soundwireserver
      thunderbird
      vlc
      winetricks
      zenity
      vesktop
      #lutris
      zed-editor

      #sql
      sqlx-cli
      sqlite
      postgresql

      # C / C++
      gcc
      gdb
      #gnumake
      #clang
      #cmake
      #libtool
      #simgrid
      devenv

      # haskell
      cabal-install
      ghc

      # rust
      rustc
      cargo
      rust-analyzer
      clippy
      rustfmt
      rustlings
      openssl
      workshop-runner
      zola
      doctl

      # Python
      python3.pkgs.pip
      python312Packages.ipython

      # javascript
      bun
      nodejs_24
      miniserve

      vulkan-tools
      inputs.alejandra.packages.${pkgs.system}.default

      brave
      firefox

      ## X11 / oxwm session
      # Replacements for the Wayland-only tools the Hyprland session uses.
      # These sit inert under Hyprland -- nothing starts them automatically,
      # so they only do anything when oxwm's autostart or a keybind invokes
      # them. The one exception is dunst; see the note below.
      maim # screenshots (grim is Wayland-only)
      xclip # clipboard (wl-copy is Wayland-only)
      feh # wallpaper (awww/waypaper are Wayland-only)
      picom # compositor: transparency/vsync on the X11 desktop
      # dunst ships share/dbus-1/services/org.knopwob.dunst.service, which
      # claims Name=org.freedesktop.Notifications -- the same bus name swaync
      # claims. Under Hyprland, exec-once.nix:14 starts `swaync &` at compositor
      # launch so swaync takes the name first and dunst never activates. If
      # notifications ever break under Hyprland, that race is the reason:
      # `systemctl --user mask dunst.service` stops D-Bus from autostarting it,
      # and oxwm can still launch dunst directly from autostart.
      dunst # notifications (swaync is Wayland-only)
    ]
  );
}
