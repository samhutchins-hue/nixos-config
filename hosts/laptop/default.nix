{ pkgs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  # 1. Enable the Fingerprint Reader
  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = true;
  security.pam.services.sudo.fprintAuth = true;
  security.pam.services.polkit-1.fprintAuth = true; # For GUI privilege prompts

  # 2. Wi-Fi Fix (Intel AX200)
  # This laptop's Wi-Fi card can have connection drop issues.
  # This option often fixes it.
  boot.kernelModules = [ "iwlwifi" ];
  boot.extraModprobeConfig = ''
    options iwlwifi 11n_disable=8
  '';

  # 4. AMD-Specific Power Management (TLP)
  services.tlp = {
    enable = true;
    settings = {
      # Use the modern, efficient AMD driver
      CPU_SCALING_DRIVER_ON_AC = "amd-pstate";
      CPU_SCALING_DRIVER_ON_BAT = "amd-pstate";

      # Use 'active' mode for best performance/power balance
      CPU_SCALING_GOVERNOR_ON_AC = "performance"; # 'performance' in amd-pstate is efficient
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Use the built-in platform profiles
      PLATFORM_PROFILE_ON_AC = "balanced"; # or "performance"
      PLATFORM_PROFILE_ON_BAT = "low-power";

      # Disable CPU boost on battery to save power
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      
      # Power-saving for your NVMe SSD
      # PCIE_ASPM_ON_BAT = "powersupersave";
    };
  };

  # Make sure the conflicting daemon is disabled
  services.power-profiles-daemon.enable = false;
  powerManagement.cpuFreqGovernor = null;
}
