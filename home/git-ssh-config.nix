{ config, pkgs, lib, ... }:

{
  # GIT
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Elie Carrot";
        email = "eyh.carrot@gmail.com";
      };
      alias = {
        s = "status";
        co = "checkout";
        d = "diff";

        # Files
        a = "add";
        aa = "add --all";
        discard = "restore";
        unstage = "restore --staged";

        # Commit
        c = "commit";
        ca = "commit --amend";
        cm = "commit -m";
        uncommit = "reset --soft HEAD^";

        # Branch
        br = "branch";
        brs = "branch -a";
        bc = "switch -c";
        brd = "branch -D";
        sw = "switch";
        rabort = "rebase --abort";
        mabort = "merge --abort";

        # Other
        grepl = "grep -E --line-number --color=always";
        whoami = "!git config user.name && git config user.email";
        find = "!git ls-files | grep -i";

        # Log
        lo = "log --graph --decorate --pretty=oneline --abbrev-commit";
      };
    };
  };

  # PUBLIC KEYS
  home.file.".ssh/github_id_ed25519.pub".source = ../secrets/github_id_ed25519.pub;
  home.file.".ssh/gitlab_id_ed25519.pub".source = ../secrets/gitlab_id_ed25519.pub;
  home.file.".ssh/gricad_id_ed25519.pub".source = ../secrets/gricad_id_ed25519.pub;

  # PRIVATE KEYS (AGENIX)
  age.secrets.githubSSHKey.file = ../secrets/github_id_ed25519.age;
  age.secrets.gitlabSSHKey.file = ../secrets/gitlab_id_ed25519.age;
  age.secrets.gricadSSHKey.file = ../secrets/gricad_id_ed25519.age;

  # SSH
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = { # default values (cf https://mynixos.com/home-manager/option/programs.ssh.enableDefaultConfig)
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };

      "github.com" = {
        host = "github.com";
        user = "git";
        identityFile = config.age.secrets.githubSSHKey.path;
        identitiesOnly = true;
      };
      "gitlab.com" = {
        host = "gitlab.com";
        user = "git";
        identityFile = config.age.secrets.gitlabSSHKey.path;
        identitiesOnly = true;
      };
      "gricad-gitlab.univ-grenoble-alpes.fr" = {
        host = "gricad-gitlab.univ-grenoble-alpes.fr";
        user = "git";
        identityFile = config.age.secrets.gricadSSHKey.path;
        identitiesOnly = true;
      };
    };
  };
}
