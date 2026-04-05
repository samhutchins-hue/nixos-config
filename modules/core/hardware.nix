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
      extraPackages32 = with pkgs.driversi686Linux; [
        mesa
      ];
    };
    bluetooth.enable = true;

    opentabletdriver = {
      enable = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
}
