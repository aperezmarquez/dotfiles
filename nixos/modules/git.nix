{ config, pkgs, ... }:

{
  programs.git.enable = true;

  programs.git.settings = {
    user.name = "Your Name";
    user.email = "you@example.com";
    init.defaultBranch = "main";
    pull.rebase = true;
    core.editor = "nvim";
    alias = {
      co = "checkout";
      st = "status";
      lg = "log --oneline --graph --decorate";
    };
  };
}
