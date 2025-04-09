{ pkgs, ... }:
{
  programs.steam = {
    enable = true;

    # Steam-specific options
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;

    # Extra compatibility packages for Steam
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];

    # Override the default Steam package by adding extra dependencies
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };
}

