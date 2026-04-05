{ lib, ... }:
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    gnome.gcr-ssh-agent.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    tailscale.enable = true;
    blueman.enable = true;
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = lib.mkDefault "no";
      };
    };
  };
}
