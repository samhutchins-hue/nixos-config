{ pkgs, config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  hardware.bluetooth.enable = true;

  # fingerprint reader
  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = true;
  security.pam.services.sudo.fprintAuth = true;
  security.pam.services.polkit-1.fprintAuth = true; # For GUI privilege prompts

  # 4. AMD-Specific Power Management (TLP)
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Use the built-in platform profiles
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      # Disable CPU boost on battery to save power
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      # Power-saving for your NVMe SSD
      PCIE_ASPM_ON_BAT = "powersupersave";
    };
  };

  # make sure the conflicting daemon is disabled?
  services.power-profiles-daemon.enable = false;
  powerManagement.cpuFreqGovernor = null;
}
