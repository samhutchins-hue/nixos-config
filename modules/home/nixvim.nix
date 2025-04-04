{ inputs, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    imports = [inputs.lazyvim-nixvim];
  };
  #inputs.Neve.packages.${pkgs.system}.default
}
