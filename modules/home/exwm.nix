{ config, lib, pkgs, inputs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
    };
    #windowManager.exwm.enable = true;
  };
}
