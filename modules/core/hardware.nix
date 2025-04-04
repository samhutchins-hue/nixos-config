{ pkgs, ... }:
{  
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };

    opentabletdriver = {
      enable = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
}
