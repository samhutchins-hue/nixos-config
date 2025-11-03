{ ... }:

{
  programs.foot = {
    enable = true;
    # Ported from caelestia-dots/caelestia/foot/foot.ini
    settings = {
      main = {
        term = "xterm-256color";
        font = "CaskaydiaCove NF:size=11";
        pad = "8x8";
        include = "/run/current-system/sw/share/foot/themes/catppuccin-mocha";
      };

      cursor = {
        color = "e5c7a9 c7b8a0";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = "0.85";
      };
    };
  };
}
