{ pkgs, lib, ... }:
{
  programs.dconf.enable = true;
  #programs.zsh.enable = true;
  programs.fish.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
}
