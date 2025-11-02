{ config, lib, pkgs, inputs, ... }:


{
  imports =
    [
      ./hardware-configuration.nix
      ./dpispoof.nix
      ./fonts.nix
      ./packages.nix
      ./xserver.nix
      ./audio.nix
      inputs.home-manager.nixosModules.default
    ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "betty"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Istanbul";


  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;

  programs.bash.shellAliases = {
    nixconf = "sudo nvim /etc/nixos/configuration.nix";
    nixrebl = "sudo nixos-rebuild switch --flake /etc/nixos";
    nixfont = "sudo nvim /etc/nixos/fonts.nix";
    nixaudc = "sudo nvim /etc/nixos/audio.nix";
    nixpkgs = "sudo nvim /etc/nixos/packages.nix";
    nixgdpi = "sudo nvim /etc/nixos/dpispoof.nix";
    nixserv = "sudo nvim /etc/nixos/xserver.nix";
    nixdotf = "sudo nvim /etc/nixos/dotfiles.nix";
    nixharw = "sudo nvim /etc/nixos/hardware-configuration.nix";
  };

  security.sudo.wheelNeedsPassword = false;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "myisha" = import ./dotfiles.nix;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  system.stateVersion = "25.11"; 
}

