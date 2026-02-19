{ config, pkgs, ... }

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
        zsh-powerlevel10k
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
        prismlauncher # Minecraft launcher (open source)
        discord
        melonDS
        jdk21
        bat
    ];    

    programs.git.enable = true;
    programs.zsh = {
        enable = true;
        enableCompletion = true;

        oh-my-zsh = {
            enable = true;
            theme = "powerlevel10k/powerlevel10k";
        };
    };

    # Wallpaper service (user-level)
    systemd.user.services.wallpaper = {
        Unit = {
            Description = "Set wallpaper for niri";
            After = [ "graphical-session.target" ];
        };

        Service = {
            ExecStart = ''
                ${pkgs.swww}/bin/swww-daemon &
                sleep 1
                ${pkgs.swww}/bin/swww img -o eDP-1 /home/antonio/Images/Wallpapers/stars.jpg
            '';
            Restart = "on-failure";
        };

        Install = {
            WantedBy = [ "graphical-session.target" ];
        };
    };
}
