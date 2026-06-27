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

  xdg.configFile."xfce4/terminal/accels.scm" = {
    force = true;
    text = ''
      ; xfce4-terminal GtkAccelMap rc-file         -*- scheme -*-
      ; this file is an automated accelerator map dump
      (gtk_accel_path "<Actions>/terminal-window/copy-html" "")
      (gtk_accel_path "<Actions>/terminal-window/new-tab" "")
      (gtk_accel_path "<Actions>/terminal-window/reset" "")
      (gtk_accel_path "<Actions>/terminal-window/next-tab" "")
      (gtk_accel_path "<Actions>/terminal-window/search-prev" "")
      (gtk_accel_path "<Actions>/terminal-window/close-tab" "")
      (gtk_accel_path "<Actions>/terminal-window/help-menu" "")
      (gtk_accel_path "<Actions>/terminal-window/tabs-menu" "")
      (gtk_accel_path "<Actions>/terminal-window/zoom-in-alt" "")
      (gtk_accel_path "<Actions>/terminal-widget/shift-pagedown" "")
      (gtk_accel_path "<Actions>/terminal-window/show-toolbar" "")
      (gtk_accel_path "<Actions>/terminal-window/move-tab-right" "")
      (gtk_accel_path "<Actions>/terminal-window/zoom-in" "")
      (gtk_accel_path "<Actions>/terminal-window/fullscreen" "")
      (gtk_accel_path "<Actions>/terminal-window/about" "")
      (gtk_accel_path "<Actions>/terminal-window/paste-selection" "")
      (gtk_accel_path "<Actions>/terminal-window/paste" "<Primary><Shift>v")
      (gtk_accel_path "<Actions>/terminal-widget/shift-down" "")
      (gtk_accel_path "<Actions>/terminal-window/new-window" "")
      (gtk_accel_path "<Actions>/terminal-window/edit-menu" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-9" "")
      (gtk_accel_path "<Actions>/terminal-window/reset-and-clear" "")
      (gtk_accel_path "<Actions>/terminal-window/toggle-menubar" "")
      (gtk_accel_path "<Actions>/terminal-window/paste-selection-alt" "")
      (gtk_accel_path "<Actions>/terminal-window/set-title-color" "")
      (gtk_accel_path "<Actions>/terminal-window/zoom-reset" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-8" "")
      (gtk_accel_path "<Actions>/terminal-window/detach-tab" "")
      (gtk_accel_path "<Actions>/terminal-window/copy" "<Primary><Shift>c")
      (gtk_accel_path "<Actions>/terminal-window/show-borders" "")
      (gtk_accel_path "<Actions>/terminal-window/undo-close-tab" "")
      (gtk_accel_path "<Actions>/terminal-window/open-folder" "")
      (gtk_accel_path "<Actions>/terminal-window/select-all" "")
      (gtk_accel_path "<Actions>/terminal-window/search-next" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-7" "")
      (gtk_accel_path "<Actions>/terminal-window/show-menubar" "")
      (gtk_accel_path "<Actions>/terminal-window/move-tab-left" "")
      (gtk_accel_path "<Actions>/terminal-window/zoom-reset-alt" "")
      (gtk_accel_path "<Actions>/terminal-window/read-only" "")
      (gtk_accel_path "<Actions>/terminal-window/file-menu" "")
      (gtk_accel_path "<Actions>/terminal-window/zoom-out-alt" "")
      (gtk_accel_path "<Actions>/terminal-window/search" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-6" "")
      (gtk_accel_path "<Actions>/terminal-window/preferences" "")
      (gtk_accel_path "<Actions>/terminal-window/prev-tab" "")
      (gtk_accel_path "<Actions>/terminal-window/set-title" "")
      (gtk_accel_path "<Actions>/terminal-window/terminal-menu" "")
      (gtk_accel_path "<Actions>/terminal-window/copy-input" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-5" "")
      (gtk_accel_path "<Actions>/terminal-window/contents" "")
      (gtk_accel_path "<Actions>/terminal-window/paste-alt" "")
      (gtk_accel_path "<Actions>/terminal-widget/shift-up" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-4" "")
      (gtk_accel_path "<Actions>/terminal-window/scroll-on-output" "")
      (gtk_accel_path "<Actions>/terminal-window/zoom-out" "")
      (gtk_accel_path "<Actions>/terminal-widget/shift-pageup" "")
      (gtk_accel_path "<Actions>/terminal-window/zoom-menu" "")
      (gtk_accel_path "<Actions>/terminal-window/close-window" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-3" "")
      (gtk_accel_path "<Actions>/terminal-window/last-active-tab" "")
      (gtk_accel_path "<Actions>/terminal-window/save-contents" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-2" "")
      (gtk_accel_path "<Actions>/terminal-window/close-other-tabs" "")
      (gtk_accel_path "<Actions>/terminal-window/view-menu" "")
      (gtk_accel_path "<Actions>/terminal-window/goto-tab-1" "")
    '';
  };
}
