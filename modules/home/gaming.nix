{ pkgs, config, inputs, ... }:
{
  home.packages = with pkgs;[
    ## Utils
    protonup-qt
    gamemode
    mangohud
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin

    ## Minecraft
    prismlauncher
  ];
}
