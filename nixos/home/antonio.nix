{ config, pkgs, ... }:

{
  imports = [
    ../modules/zsh.nix
    ../modules/wallpaper.nix
    ../modules/git.nix
  ];

  home.username = "antonio";
  home.homeDirectory = "/home/antonio";

  home.stateVersion = "25.11";

  # All the Pkgs for antonio
  home.packages = with pkgs; [
    tree
    cacert
    vulkan-loader
    neovim
    gh
    kitty
    waybar
    eww
    glibc
    wayland
    wayland-protocols
    libinput
    libdrm
    libxkbcommon
    libxcursor
    libvirt
    libgcc
    pixman
    meson
    ninja
    libdisplay-info
    libliftoff
    hwdata
    seatd
    pcre2
    xwayland-satellite
    swww
    jq
    btop
    stow
    mono
    _7zz
    brave
    libreoffice
    kdePackages.okular
    docker
    hyprlock
    pkgs.thunar
    ffmpeg_7
    nodejs_24
    prismlauncher
    discord
    melonds
    jdk21
    bat
  ];    
}

