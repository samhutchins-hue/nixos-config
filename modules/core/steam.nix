{ pkgs, ... }:
{
  # ============================================
  # Steam Launch Options (copy to game properties)
  # ============================================
  # Default (most games):
  #   gamemoderun %command%
  #
  # With performance overlay:
  #   gamemoderun mangohud %command%
  #
  # HDR singleplayer (fullscreen):
  #   gamemoderun gamescope --hdr-enabled -f -- %command%
  #
  # HDR + FSR upscaling (render at 1080p, upscale to 1440p):
  #   gamemoderun gamescope --hdr-enabled -h 1080 -H 1440 -f -F fsr -- %command%
  #
  # FSR upscaling only (no HDR):
  #   gamemoderun gamescope -h 1080 -H 1440 -f -F fsr -- %command%
  # ============================================

  # Gamemode - optimizes system for gaming when activated
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
      cpu = {
        park_cores = "no";
        pin_cores = "yes";
      };
    };
  };

  # LACT - AMD GPU control (power limits, fan curves, undervolting)
  services.lact.enable = true;

  # Gamescope compositor - available for HDR/upscaling when needed
  programs.gamescope = {
    enable = true;
    capSysNice = false;  # Disabled to preserve Steam Overlay compatibility
  };

  programs.steam = {
    enable = true;

    # Steam-specific options
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = false;  # Use Hyprland's native VRR instead

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

