{ config, lib, pkgs, ... }:

{
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
          [[ $(git branch 2> /dev/null) ]] && git_prefix=' (' && git_suffix=')'
          echo "$git_prefix$(parse_git_branch)$git_suffix"
        }
        
        current_time='\D{%H:%M:%S}'
        PS1="$YELLOW<$current_time> $RED\u$nc@$PURPLE\H$nc:$GREEN\w$YELLOW\$(git_prompt)$nc $YELLOW\$$nc "
      '';
      shellOptions = [
  	    "histappend"
  	    "extglob"
  	    "globstar"
  	    "checkjobs"
  	    "checkwinsize"
	  ];
    };
    
    terminator = {
      enable = true;
      config = {
        profiles.default.font = "Monospace 10";
        profiles.default.use_system_font = false;
      };
    };
    
    git = {
      enable = true;
      settings = {
        user = {
          name  = "Elie Carrot";
          email = "eyh.carrot@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
