{ pkgs, lib, ... }:
{
  #programs.ssh.startAgent = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
}
