{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        vulkan-loader
      ];
    };
    bluetooth = {
      enable = true;
      settings = {
        LE = {
          MinConnectionInterval = 7;
          MaxConnectionInterval = 9;
          ConnectionLatency = 0;
        };
      };
    };

    opentabletdriver = {
      enable = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
  # TODO
  hardware.enableAllFirmware = true;
  boot.extraModprobeConfig = ''
    options mt7921e disable_aspm=1
    options bluetooth disable_esco=1
  '';
}
