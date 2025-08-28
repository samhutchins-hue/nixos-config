{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs.vimPlugins; [
    LazyVim
  ];

  # Relevant issue: https://github.com/nix-community/home-manager/issues/3514
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/modules/home/nvim/starter";
}
