{ config, pkgs, ... }:

{
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
    xfce.thunar
    ffmpeg_7
    nodejs_24
    prismlauncher
    discord
    melonds
    jdk21
    bat
  ];    

  programs.git.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Funciones
    initContent = ''
      if [[ -r "$${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-\$${(%):-%n}.zsh" ]]; then
        source "$${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-\$${(%):-%n}.zsh"
      fi

      plugins=(git)
      ZSH_CUSTOM="/home/antonio/.oh-my-zsh/custom/themes/powerlevel10k"
      ZSH_THEME="powerlevel10k"
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

      cdr() {
          cd /run/media/antonio/"$1"
      }

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    '';

    # Aliases
    shellAliases = {
      ll = "ls -latr";
    };
  };
  # Wallpaper service (user-level)
  systemd.user.services.wallpaper = {
    Unit = {
      Description = "Set wallpaper for niri";
      After = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = ''
        ${pkgs.swww}/bin/swww-daemon &
      '';
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.services.wallpaper-set = {
    Unit = {
      Description = "Set wallpaper once";
      After = [ "wallpaper.service" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.swww}/bin/swww img -o eDP-1 /home/antonio/Images/Wallpapers/stars.jpg";
      RemainAfterExit = true;
    };
    
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}

