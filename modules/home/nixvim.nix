{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.my-nvim.packages.${pkgs.system}.default ];
}
