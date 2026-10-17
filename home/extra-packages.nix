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
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "geogebra6"
    "discord"
  ];

  programs = {
    freetube = {
      enable = true;
      settings = {
        defaultVideoFormat = "audio";
        defaultQuality = "480";
        mainColor = "Red";
        secColor = "Green";
      };
    };
  };

  fonts.fontconfig.enable = true;
}
