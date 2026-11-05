{ config, lib, pkgs, ... }:

{
  ## Extra packages
  home.packages = with pkgs; [
    geogebra6
    giac-with-xcas
    stellarium
    discord
    freecad
    sioyek
    texmaker

    (python3.withPackages (python-pkgs: with python-pkgs; [
      requests
      notebook
      dbus-python
      ipykernel
      ipython
      pandas
    ]))

    bruno
    rustup
    lazygit
    ripgrep
    maven
    clang
    cmake

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    taskwarrior-tui
  ];

  home.shellAliases = {
    tt = "taskwarrior-tui";
  };

  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "geogebra6"
    "discord"
  ];

  programs = {

    # ------ MULTIMEDIA ------

    cmus = {
      enable = true;
      theme = "default";
    };
    yt-dlp = {
      enable = true;
    };
    freetube = {
      enable = true;
      settings = {
        defaultVideoFormat = "audio";
        defaultQuality = "480";
        mainColor = "Red";
        secColor = "Green";
      };
    };

    # ------ ACCESSORIES ------

    taskwarrior = {
      enable = true;
      package = pkgs.taskwarrior3;
      dataLocation = "${config.home.homeDirectory}/Nextcloud/task";
    };
  };
}
