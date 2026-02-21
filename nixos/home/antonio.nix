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
    # System
    tree
    cacert
    vulkan-loader
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

    # Langs
    nodejs_24
    jdk21

    # Utilities
    gh
    kitty
    waybar
    eww
    ffmpeg_7
    mono
    stow
    btop
    hyprlock
    bat
    jq
    _7zz

    # Apps
    neovim
    swww
    brave
    libreoffice
    kdePackages.okular
    docker
    pkgs.thunar
    prismlauncher
    discord
    melonds
    unityhub
    spotify
  ];    
}

