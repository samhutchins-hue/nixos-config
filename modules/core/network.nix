{ pkgs, host, ... }:
{
  networking = {
    hostName = host;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      wifi.powersave = false; # disable NM's powersave
    };
    wireless.iwd = {
      enable = true;
      settings = {
        General.EnableNetworkConfiguration = false; # NetworkManager owns IP config
        # DisablePeriodicScan stops iwd refreshing its scan cache, which makes it
        # associate with stale BSSes ("Connected BSS not in scan results") until
        # something forces a rescan. DisableRoamingScan is the one that stops the
        # mid-connection roam scans without breaking connecting.
        Scan.DisableRoamingScan = true;
        Rank.BandModifier5Ghz = 2.0;
        Rank.BandModifier2_4Ghz = 0.5;
      };
    };
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };

  # NetworkManager uses iwd as its wifi backend, but nothing orders it after
  # iwd.service — it comes up first and its early D-Bus calls fail with
  # net.connman.iwd.Failed. wants (not requires) so ethernet still works if iwd dies.
  systemd.services.NetworkManager = {
    after = [ "iwd.service" ];
    wants = [ "iwd.service" ];
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
