{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    cores = 8;
    max-jobs = 1;
    # Substituters for cache rocm
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="      
    ];
  };

  imports = [ 
    ./hardware-configuration.nix
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "iommu=pt" ];

  networking.hostName = "magic-33"; # Define your hostname.

  # Network
  networking.networkmanager.enable = true;
  networking.extraHosts = ''
     192.168.122.200 api.multi-llm.local
     192.168.122.200 odoo.multi-llm.local
   '';
  
  # Time zone
  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";
  
  # AMD
  services.xserver.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = ["amdgpu"];

  # ROCm
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    rocmPackages.clr
    rocmPackages.hipblas
    rocmPackages.rocblas
  ];
  systemd.tmpfiles.rules = [
    "L+ /opt/rocm - - - - ${pkgs.rocmPackages.clr}"
  ];

  # RYZEN
  hardware.cpu.amd.updateMicrocode = true;

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

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true; # Sharing clipboard
  networking.firewall = {
    enable = true;
    # Confía plenamente en la interfaz de los puentes de Virt-Manager
    trustedInterfaces = [ "virbr0" ];
  
    # Opcional: Si vas a usar protocolos específicos de Kubernetes desde el host
    # puedes abrir los puertos necesarios (6443 es el API Server)
    allowedTCPPorts = [ 6443 ]; 
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.antonio = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" "video" "render" ]; 
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
    rocmPackages.rocm-smi
    rocmPackages.rocminfo
  ];

  environment.variables = {
    ROC_ENABLE_PRE_RELEASE = "1";
    HSA_OVERRIDE_GFX_VERSION = "12.0.0";

    HIP_VISIBLE_DEVICES = "0";
  };


    
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

