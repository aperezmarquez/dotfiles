{ config, pkgs, ... }:

{
  systemd.user.services.wallpaper = {
    Unit = { 
      Description = "Start wallpaper daemon";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = ''
        ${pkgs.swww}/bin/swww-daemon
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
      ExecStart = "${pkgs.swww}/bin/swww img -o eDP-1 /home/antonio/Images/Wallpapers/silent.jpg";
      RemainAfterExit = true;
    };
    
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
