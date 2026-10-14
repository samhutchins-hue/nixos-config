{ pkgs, lib, ... }: # Added pkgs here
{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };

  services = {
    gvfs.enable = true;
    dbus.enable = true;

    # Caelestia (modules/home/caelestia.nix) talks to org.freedesktop.UPower for
    # its battery/power widgets and warns that the service "will not work"
    # without it. Lives in core rather than hosts/desktop because the home
    # modules are shared across hosts, so the laptop installs caelestia too --
    # and that is where battery data actually matters. Conflicts with nothing.
    upower.enable = true;
    fstrim.enable = true;
    tailscale.enable = true;
    blueman.enable = true;

    syncthing = {
      enable = true;
      user = "samh";
      dataDir = "/home/samh/Sync";
      configDir = "/home/samh/.config/syncthing";
      openDefaultPorts = true;
    };

    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = lib.mkDefault "no";
      };
    };

    ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      # Note: Consider matching the "11.0.2" from your reference config
      # if you experience any stability issues with "11.0.0".
      rocmOverrideGfx = "11.0.2";

      environmentVariables = {
        # Hermes Agent (modules/home/hermes.nix) needs >=64k context for
        # agentic tool use. ollama 0.40 otherwise picks 4k/32k/256k from
        # available VRAM, and 32k would silently truncate long tool loops.
        # This is a KV-cache cost on top of the ~18.5 GiB model: if the card
        # runs out, ollama offloads layers to CPU and generation gets slow
        # rather than failing, so drop this back to 32768 if that happens.
        OLLAMA_CONTEXT_LENGTH = "65536";
      };
    };
  };

  users.users.samh.extraGroups = [
    "video"
    "render"
  ];

  hardware.graphics.enable = true;
}
