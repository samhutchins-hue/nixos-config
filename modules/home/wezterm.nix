{ pkgs, host, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
  };
}
