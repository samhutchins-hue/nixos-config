{ ... }:
{
  # wayland.windowManager.hyprland.extraConfig = ''
  #   # DP-1 = AOC Q27G3XMN, DP-2 = ASUS VG27A (rotated to reverse portrait)
  #   # transform 3 = reverse portrait; DP-2's logical size becomes 1440x2560, so it
  #   # occupies x 0-1440 and DP-1 starts at x=1440. Hyprland only recomputes that box
  #   # when the monitor is (re)created -- a plain `hyprctl reload` leaves a stale
  #   # 2560x1440 layout box, which puts windows off-screen with a black bottom bar.
  #   # monitorv2 {
  #   #   output = DP-2
  #   #   mode = 2560x1440@165
  #   #   position = 0x0
  #   #   scale = 1
  #   #   # transform = 3
  #   # }
  #   # monitor=DP-1, 2560x1440@170, 1440x0, 1
  # '';

  wayland.windowManager.hyprland.extraConfig = ''
      monitor=DP-3, 2560x1440@165, 0x0, 1
      monitor=DP-2, 2560x1440@170, 2560x0, 1, vrr, 0, bitdepth, 10

    # render {
    #    direct_scanout = 0
    #    cm_fs_passthrough = 2
    #  }
    #'';
}

# vrr = 2
# bitdepth = 10
# cm = hdr
# sdrbrightness = 1.1
# sdrsaturation = 0.98
# sdr_max_luminance = 250
# min_luminance = 0
# max_luminance = 1000
# max_avg_luminance = 300
# supports_wide_color = 1
# supports_hdr = 1
