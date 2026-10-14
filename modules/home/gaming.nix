{
  pkgs,
  config,
  osConfig,
  lib,
  inputs,
  ...
}:
{
  # imports = [
  #   inputs.play-nix.homeManagerModules.default
  # ];

  home.packages = with pkgs; [
    protonup-qt
    gamemode
    mangohud
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    prismlauncher
    heroic
    lutris
  ];

}
