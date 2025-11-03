{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    # Settings from caelestia-dots/caelestia/btop/btop.conf
    settings = {
      theme_background = false;
      color_theme = "catppuccin-mocha";
      update_ms = 1000;
      proc_sorting = "cpu lazy";
      proc_reversed = true;
      proc_filter_kernel = true;
      cpu_graph_upper = "auto";
      cpu_graph_lower = "auto";
      mem_graphs_cpu = false;
      swap_disk = true;
      net_auto_scale = true;
    };
  };
  home.packages = (with pkgs; [ nvtopPackages.intel ]);
}
