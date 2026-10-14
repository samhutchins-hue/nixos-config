{ pkgs, ... }:
{
  services.xserver.windowManager.oxwm.enable = true;
  services.displayManager.defaultSession = "oxwm";
}
