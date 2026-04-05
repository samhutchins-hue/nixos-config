{ ... }:
{
  home.sessionVariables = {
    # AMD/Mesa performance - improves load times and reduces stutters
    RADV_PERFTEST = "gpl";  # Graphics pipeline library for faster shader compilation
    mesa_glthread = "true";  # Enable OpenGL threading
    AMD_VULKAN_ICD = "RADV";  # Explicitly use RADV (best driver for gaming)

    # AMD Anti-Lag and FSR4 for RDNA3
    ENABLE_LAYER_MESA_ANTI_LAG = "1";  # Reduces input latency
    PROTON_FSR4_RDNA3_UPGRADE = "1";  # Use RDNA3-optimized FSR4 in Proton games
    NIXOS_OZONE_WL = "1";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Gruvbox-Green-Dark";
  };
}
