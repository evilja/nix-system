{ config, lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  environment.etc."wireplumber/main.lua.d/51-bluetooth-default.lua".text = ''
    local default_nodes = require("default-nodes")
    default_nodes.enable()
    default_nodes.set_default_audio_sink("bluez_output.2C_FD_B4_E4_20_C9.a2dp-sink")
  '';
  hardware.bluetooth = {
    enable = true;
    settings.General.Enable = "Source,Sink,Media,Socket";
  };

}
