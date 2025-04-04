{ pkgs, config, inputs, ... }:
{
  home.packages = with pkgs;[
    ## Utils
    protonup-qt
    gamemode
    mangohud
    #gamescope
    winetricks
    #inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    #inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    #inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
    #inputs.nix-gaming.packages.${pkgs.system}.wine

    ## Minecraft
    prismlauncher

    ## Cli games
    #_2048-in-terminal
    #vitetris
    nethack

    ## Celeste
    #celeste-classic
    #celeste-classic-pm

    ## Doom
    # gzdoom
    #crispy-doom

    ## Emulation
    #sameboy
    #snes9x
    # cemu
    # dolphin-emu
  ];
}
