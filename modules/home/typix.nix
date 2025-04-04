{ inputs, pkgs, ...}:
{
imports = [inputs.typix.homeManagerModules.typix];
  programs.typix = {
  enable = true;
  };
}
