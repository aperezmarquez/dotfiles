{ config, pkgs, ... }:

{
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
}
