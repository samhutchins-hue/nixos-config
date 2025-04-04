{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  # Configure NVF
  programs.nvf = {
    enable = true;
    languages = {enableLSP = true;};
  };
}
