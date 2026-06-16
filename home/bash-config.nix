{ config, lib, pkgs, ... }:

{
  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    open = "xdg-open";
  };

  programs = {
    readline = {
      enable = true;
      bindings = {
        "\\e[A" = "history-search-backward";
        "\\e[B" = "history-search-forward";
      };
    };

    bash = {
      enable = true;
      historySize = 50000;
      historyControl = [ "ignoreboth" ];
      initExtra = ''
        red='\[\e[0;31m\]'
        RED='\[\e[1;31m\]'
        blue='\[\e[0;34m\]'
        BLUE='\[\e[1;34m\]'
        cyan='\[\e[0;36m\]'
        CYAN='\[\e[1;36m\]'
        green='\[\e[0;32m\]'
        GREEN='\[\e[1;32m\]'
        yellow='\[\e[0;33m\]'
        YELLOW='\[\e[1;33m\]'
        PURPLE='\[\e[1;35m\]'
        purple='\[\e[0;35m\]'
        nc='\[\e[0m\]'
        
        function parse_git_dirty {
          [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && printf "*\n"
        }
        function parse_git_branch {
          git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
        }
        function git_prompt {
          local git_prefix=""
          local git_suffix=""
          [[ $(git branch 2> /dev/null) ]] && git_prefix='(' && git_suffix=')'
          echo "$git_prefix$(parse_git_branch)$git_suffix"
        }
        
        PS1="$RED\u$nc@$YELLOW\H$nc:$GREEN\w$YELLOW\$(git_prompt)$nc$YELLOW\$$nc "
        
        export PATH=$HOME/.npm/bin:$PATH

        [ -z "$TMUX"  ] && { exec tmux new-session && exit; }
      '';

      shellOptions = [
  	    "histappend"
  	    "extglob"
  	    "globstar"
  	    "checkjobs"
  	    "checkwinsize"
	    ];
    };

    tmux = {
      enable = true;
      clock24 = true;
      prefix = "C-a";
      extraConfig = ''
        unbind-key -n S-Up
        unbind-key -n S-Down
        unbind-key -n S-Left
        unbind-key -n S-Right
        unbind-key -n M-S-Up
        unbind-key -n M-S-Down
        unbind-key -n M-S-Left
        unbind-key -n M-S-Right
        unbind-key -n C-Up
        unbind-key -n C-Down
        unbind-key -n C-Left
        unbind-key -n C-Right
        unbind s

        bind-key -n S-Up select-pane -U
        bind-key -n S-Down select-pane -D
        bind-key -n S-Left select-pane -L
        bind-key -n S-Right select-pane -R
        bind-key -n M-S-Up resize-pane -U
        bind-key -n M-S-Down resize-pane -D
        bind-key -n M-S-Left resize-pane -L
        bind-key -n M-S-Right resize-pane -R
        bind-key -n C-Left previous-window
        bind-key -n C-Right next-window
        bind-key -n C-Up switch-client -p
        bind-key -n C-Down switch-client -n
        bind-key s copy-mode
      '';
    };
  };
}
