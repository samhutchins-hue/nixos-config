{ inputs, pkgs, ... }:
let
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix { };
in
{
  home.packages = (
    with pkgs;
    [
      _2048
      libnotify

      ## system
      bc
      keychain
      vim

      ## CLI utility
      tmux
      unrar
      djvu2pdf
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
      ttyper # cli typing test
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
      claude-code

      ## GUI Apps
      easyeffects
      code-cursor
      stremio
      protonvpn-gui
      gimp
      nix-prefetch-github
      pavucontrol # pulseaudio volume controle (GUI)
      soundwireserver
      winetricks
      wineWowPackages.wayland
      zenity
      vesktop
      lutris

      #sql
      sqlx-cli
      sqlite
      postgresql

      # C / C++
      #gcc
      gdb
      gnumake
      clang
      cmake
      libtool
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
      python3Full
      python3.pkgs.pip
      python312Packages.ipython

      # javascript
      bun
      nodejs_24
      nodePackages.http-server

      vulkan-tools
      vulkan-hdr-layer-kwin6
      inputs.alejandra.defaultPackage.${system}

      firefox
    ]
  );
}
