{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      dracula-theme.theme-dracula
      ms-toolsai.jupyter
      ms-python.python
      mkhl.direnv
      github.copilot
    ];
  };
}
