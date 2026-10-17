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

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        add_newline = true;
        format = lib.concatStrings [
          "┌─"
          "$username"
          "$hostname"
          "$python"
          "$git_branch"
          "$git_commit"
          "$git_metrics"
          "$git_status"
          "$git_state"
          "$rust"
          "$c"
          "$cpp"
          "$cmake"
          "$dart"
          "$java"
          "$php"
          "$ocaml"
          "$meson"
          "$nodejs"
          "$docker_context"
          "$container"
          "$nix_shell"
          "$directory"
          "$line_break"
          "└─"
          "$character"
        ];

        character = {
          success_symbol = "[■](green)";
          error_symbol = "[■](red)";
        };
        username = {
          show_always = true;
          style_user = "bold green";
          style_root = "bold red";
          format = ''\[[$user]($style)\]'';
        };
        directory = {
          format = ''\[[$path]($style)[$read_only]($read_only_style)\]'';
          style = "bold 39";
          truncate_to_repo = false;
          truncation_length = 3;
          truncation_symbol = "…/";
        };
        directory.substitutions = {
          "Desktop" = " ";
          "Documents" = "󱧶 ";
          "Downloads" = "󰉍 ";
          "Music" = "󱍙 ";
          "Pictures" = "󰉏 ";
          "Nextcloud" = "󰉎 ";
        };
        hostname = {
          format = ''\[[$ssh_symbol$hostname]($style)\]'';
          ssh_only = false;
          style = "green";
        };
        c = {
          format = ''\[[$symbol($version(-$name))]($style)\]'';
          symbol = " ";
          style = "149";
        };
        cpp = {
          format = ''\[[$symbol($version(-$name))]($style)\]'';
          symbol = " ";
          style = "149";
          disabled = false;
        };
        cmake = {
          format = ''\[[$symbol($version)]($style)\]'';
          symbol = " ";
          style = "201";
        };
        container = {
          symbol = " ";
          format = ''\[[$symbol \[$name\]]($style)\]'';
          style = "bold 45";
        };
        dart = {
          symbol = " ";
          format = ''\[[$symbol($version)]($style)\]'';
        };
        docker_context = {
          symbol = " ";
          format = ''\[[$symbol$context]($style)\]'';
        };
        git_branch = {
          symbol = " ";
          format = ''\[[$symbol$branch ]($style)'';
          style = "yellow";
        };
        git_commit = {
          format = ''[\($hash$tag\)]($style)\]'';
          only_detached = false;
          tag_disabled = false;
          tag_symbol = " 󰓹 ";
          commit_hash_length = 8;
          style = "yellow";
        };
        git_status = {
          format = ''\[[$all_status$ahead_behind]($style)\]'';
          style = "red";
        };
        git_metrics = {
          format = ''\[[+$added]($added_style)[-$deleted]($deleted_style)\]'';
          added_style = "green";
          deleted_style = "red";
          disabled = false;
          only_nonzero_diffs = true;
        };
        git_state = {
          format = ''\[[$state ($progress_current/$progress_total)]($style)\]'';
          style = "yellow";
        };
        java = {
          symbol = " ";
          format = ''\[[$symbol($version)]($style)\]'';
          style = "red";
        };
        meson = {
          symbol = "⬢ ";
          format = ''\[[$symbol$project]($style)\]'';
          style = "134";
        };
        nix_shell = {
          symbol = " ";
          format = ''\[[$symbol$state( \($name\))]($style)\]'';
          style = "12";
        };
        nodejs = {
          symbol = " ";
          format = ''\[[$symbol($version)]($style)\]'';
          style = "70";
        };
        ocaml = {
          symbol = " ";
          format = ''\[[$symbol($version)(\($switch_indicator$switch_name\))]($style)\]'';
          style = "yellow";
        };
        php = {
          symbol = " ";
          format = ''\[[$symbol($version)]($style)\]'';
          style = "147";
        };
        python = {
          symbol = " ";
          format = ''\[[''${symbol}''${pyenv_prefix}(''${version})(\($virtualenv\))]($style)\]'';
          style = "220";
        };
        rust = {
          symbol = " ";
          format = ''\[[$symbol($version)]($style)\]'';
          style = "130";
        };
      };
    };

    bash = {
      enable = true;
      historySize = 50000;
      historyControl = [ "ignoreboth" ];
      initExtra = ''
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
