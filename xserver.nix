{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    videoDrivers = [ "amdgpu" ];
    windowManager.i3.enable = true;
  };
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "none+i3";
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.xkb.layout = "tr";

}
