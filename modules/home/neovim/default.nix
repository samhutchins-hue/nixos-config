{ config, pkgs, inputs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      clang-tools
      tinymist
      tree-sitter
      rust-analyzer
      rustfmt
      lua-language-server
      stylua
      nixd
      taplo
      marksman
      markdownlint-cli2
      nixpkgs-fmt
      shfmt
      #zls
      nodePackages.prettier
      vimPlugins.copilot-vim
      vimPlugins.cmake-tools-nvim
      vimPlugins.codecompanion-nvim
    ];
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${inputs.self}/modules/home/neovim/lazyvim-config";
}
