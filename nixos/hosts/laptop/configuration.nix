{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [ 
    ./hardware-configuration.nix
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-inst"; # Define your hostname.

  # Network
  networking.networkmanager.enable = true;
  
  # Time zone
  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";
  
  # NVIDIA
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;

  programs.niri.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "es";

  # Flatpak for stremio
  services.flatpak.enable = true;
  services.tailscale.enable = true;

  # Docker conf
  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.antonio = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; 
    shell = pkgs.zsh;
  };

  # System fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
    meslo-lgs-nf
  ];
  
  # System Pkgs
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gcc
    gnumake
  ];


    
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; 
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  }; 
  
  # Enable pendrives
  services.udisks2.enable = true;
  services.gvfs.enable = true; # Automount

  programs.zsh.enable = true;

  system.stateVersion = "25.11";
}

