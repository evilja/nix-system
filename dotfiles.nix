{ config, lib, pkgs, ... }:

{
  home.username = "myisha";
  home.homeDirectory = "/home/myisha";
  programs.neovim = {
    enable = true;

    extraConfig = ''
      set background=dark
      colorscheme gruvbox
    '';

    plugins = with pkgs.vimPlugins; [
      gruvbox
    ];
  };
  xdg.configFile = {
    "alacritty/alacritty.toml".source = ./nix-dot/alacritty/alacritty.toml;
    "dunst/dunstrc".source = ./nix-dot/dunst/dunstrc;
    "fastfetch/config.jsonc".source = ./nix-dot/fastfetch/config.jsonc;
    "i3/config".source = ./nix-dot/i3/config;
    "polybar/config.ini".source = ./nix-dot/polybar/config.ini;
    "polybar/launch.sh".source = ./nix-dot/polybar/launch.sh;
    "rofi/config.rasi".source = ./nix-dot/rofi/config.rasi;
    "rofi/launch.sh".source = ./nix-dot/rofi/launch.sh;
    "wallpaper/alohaii.png".source = ./nix-dot/wallpaper/alohaii.png;
    "wallpaper/default.jpg".source = ./nix-dot/wallpaper/default.jpg;
  };
  home.packages = with pkgs; [
    discord
    rofi
    alacritty
    fastfetch
    dunst
    librewolf-bin
    scrot
    polybar
    feh
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

}

