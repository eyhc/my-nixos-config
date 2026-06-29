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
        black='\[\e[0;30m\]'
        BLACK='\[\e[1;30m\]'
        red='\[\e[0;31m\]'
        RED='\[\e[1;31m\]'
        green='\[\e[0;32m\]'
        GREEN='\[\e[1;32m\]'
        olive='\[\e[0;33m\]'
        OLIVE='\[\e[1;33m\]'
        navy='\[\e[0;34m\]'
        NAVY='\[\e[1;34m\]'
        purple='\[\e[0;35m\]'
        PURPLE='\[\e[1;35m\]'
        teal='\[\e[0;36m\]'
        TEAL='\[\e[1;36m\]'
        silver='\[\e[0;37m\]'
        SILVER='\[\e[1;37m\]'
        nc='\[\e[0m\]'

        bright_fg_prefix=9 bright_bg_prefix=10
        gray='\[\e[0;'"$bright_fg_prefix"'0m\]'
        GRAY='\[\e['"$bright_fg_prefix"'0;1m\]'
        red='\[\e[0;'"$bright_fg_prefix"'1m\]'
        RED='\[\e['"$bright_fg_prefix"'1;1m\]'
        lime='\[\e[0;'"$bright_fg_prefix"'2m\]'
        LIME='\[\e['"$bright_fg_prefix"'2;1m\]'
        yellow='\[\e[0;'"$bright_fg_prefix"'3m\]'
        YELLOW='\[\e['"$bright_fg_prefix"'3;1m\]'
        blue='\[\e[0;'"$bright_fg_prefix"'4m\]'
        BLUE='\[\e['"$bright_fg_prefix"'4;1m\]'
        magenta='\[\e[0;'"$bright_fg_prefix"'5m\]'
        MAGENTA='\[\e['"$bright_fg_prefix"'5;1m\]'
        cyan='\[\e[0;'"$bright_fg_prefix"'6m\]'
        CYAN='\[\e['"$bright_fg_prefix"'6;1m\]'
        white='\[\e[0;'"$bright_fg_prefix"'7m\]'
        WHITE='\[\e['"$bright_fg_prefix"'7;1m\]'

        # show chroot if exist
        function chroot_prefix {
          if [[ $debian_chroot ]]; then echo "("; else echo ""; fi
        }
        function chroot_suffix {
          if [[ $debian_chroot ]]; then echo ")"; else echo ""; fi
        }
        function chroot_name {
          if [[ $debian_chroot ]]; then echo $debian_chroot; else echo ""; fi
        }
        function chroot {
          echo "\$(chroot_prefix)$TEAL\$(chroot_name)$nc\$(chroot_suffix)"
        }

        export VIRTUAL_ENV_DISABLE_PROMPT=1
        function ve_prefix {
          if [[ $VIRTUAL_ENV ]]; then echo "("; else echo ""; fi
        }
        function ve_suffix {
          if [[ $VIRTUAL_ENV ]]; then echo ")"; else echo ""; fi
        }
        function ve_prompt {
          echo $(basename "$VIRTUAL_ENV")
        }
        function my_ve {
            echo "\$(ve_prefix)$PURPLE\$(ve_prompt)$nc\$(ve_suffix)"
        }

        function parse_git_dirty {
          [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && printf "*\n"
        }
        function parse_git_branch {
          git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
        }
        function git_prefix {
          if [[ $(git branch 2> /dev/null) ]]; then echo "["; else echo ""; fi
        }
        function git_suffix {
          if [[ $(git branch 2> /dev/null) ]]; then echo "]"; else echo ""; fi
        }
        function git_prompt {
          echo "\$(git_prefix)$olive\$(parse_git_branch)$nc\$(git_suffix)"
        }

        my_ps_host="$green\h$nc"
        my_ps_host_root="$green\h$nc"
        my_ps_user="$GREEN\u$nc"
        my_ps_root="$BROWN\u$nc"

        case $(id -u) in
        0) PS1="┌─$(my_ve)$(chroot)[$my_ps_root][$my_ps_host_root]$(git_prompt)[$teal\w$nc]
        └─▪ "
          ;;
        *) PS1="┌─$(my_ve)$(chroot)[$my_ps_user][$my_ps_host]$(git_prompt)[$teal\w$nc]
        └─▪ "
          ;;
        esac

        export PATH=$HOME/.npm/bin:$PATH

        eval "$(fzf --bash)"

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
        set -g display-panes-time 1000

        unbind-key -n S-Up
        unbind-key -n S-Down
        unbind-key -n S-Left
        unbind-key -n S-Right
        unbind-key -n C-S-Up
        unbind-key -n C-S-Down
        unbind-key -n C-S-Left
        unbind-key -n C-S-Right
        unbind-key _
        unbind-key !
        unbind-key n
        unbind-key p
        unbind-key N
        unbind-key P
        unbind-key s
        unbind-key r
        unbind-key R
        unbind-key i

        bind-key -n S-Up select-pane -U
        bind-key -n S-Down select-pane -D
        bind-key -n S-Left select-pane -L
        bind-key -n S-Right select-pane -R
        bind-key -n C-S-Up resize-pane -U
        bind-key -n C-S-Down resize-pane -D
        bind-key -n C-S-Left resize-pane -L
        bind-key -n C-S-Right resize-pane -R
        bind-key p previous-window
        bind-key n next-window
        bind-key P switch-client -p
        bind-key N switch-client -n
        bind-key ! split-window -h -c "#{pane_current_path}"
        bind-key _ split-window -v -c "#{pane_current_path}"
        bind-key s copy-mode
        bind-key r command-prompt -p "(rename-window) " "rename-window \"%%\""
        bind-key R command-prompt -p "(rename-session) " "rename-session \"%%\""
        bind-key i display-panes
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
