{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  users.users.myisha = {
    isNormalUser = true;
    extraGroups = [ "wheel" "lp" "audio" "video" ];
  };
  environment.systemPackages = with pkgs; [
    wget
    curl
    rustc
    pulseaudio
    cargo
    killall
    gcc
    gnumake
    bluez
    nftables
    git
    opentabletdriver
    (wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
	obs-backgroundremoval
	obs-pipewire-audio-capture
      ];
    })
  ];
  

}
