{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    input = {
      accel_profile = "flat";
      force_no_accel = "1";
      kb_layout = "us";
      kb_options = "grp:alt_caps_toggle";
      numlock_by_default = true;
      follow_mouse = 1;
      float_switch_override_focus = 0;
      mouse_refocus = 0;
      sensitivity = 0.000000000;
      touchpad = {
        natural_scroll = true;
      };
    };

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgb(A89984)";
      "col.inactive_border" = "0x00000000";
      layout = "dwindle";
    };

    misc = {
      disable_autoreload = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = false;
      always_follow_on_dnd = true;
      layers_hog_keyboard_focus = true;
      animate_manual_resizes = false;
      enable_swallow = true;
      focus_on_activate = true;
      middle_click_paste = false;
      vrr = 2; # 0=off, 1=on, 2=fullscreen only
    };

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
      force_split = 2;
      use_active_for_splits = true;
    };

    master = {
      new_status = "master";
      special_scale_factor = 1;
    };

    decoration = {
      rounding = 10;

      blur = {
        enabled = true;
        size = 4;
        passes = 2;
        brightness = 1;
        contrast = 1.400;
        ignore_opacity = true;
        noise = 0;
        new_optimizations = true;
        xray = true;
      };

      shadow = {
        enabled = true;
        ignore_window = true;
        offset = "0 2";
        range = 20;
        render_power = 3;
        color = "rgba(00000055)";
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "fluent_decel, 0, 0.2, 0.4, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutCubic, 0.33, 1, 0.68, 1"
        "fade_curve, 0, 0.55, 0.45, 1"
      ];

      animation = [
        "windowsIn,   0, 4, easeOutCubic,  popin 20%"
        "windowsOut,  0, 4, fluent_decel,  popin 80%"
        "windowsMove, 1, 2, fluent_decel, slide"
        "fadeIn,      1, 3,   fade_curve"
        "fadeOut,     1, 3,   fade_curve"
        "fadeSwitch,  0, 1,   easeOutCirc"
        "fadeShadow,  1, 10,  easeOutCirc"
        "fadeDim,     1, 4,   fluent_decel"
        "workspaces,  1, 4,   easeOutCubic, fade"
      ];
    };

    xwayland = {
      force_zero_scaling = true;
    };
  };
}
