_: {
  programs.mpv = {
    enable = true;
    config = {
      vo = "gpu-next";
      gpu-api = "vulkan";
      target-colorspace-hint = "yes";
      hwdec = "vaapi";
      hwdec-codecs = "all";
      profile = "gpu-hq";
      ytdl-format = "bestvideo[hdr=True]+bestaudio/bestvideo+bestaudio";

      # Audio fixes
      ao = "pipewire";
      audio-buffer = "0.2";
    };
  };
}
