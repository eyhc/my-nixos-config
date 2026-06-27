{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    age
    backintime
    engrampa
    featherpad
    fzf
    galculator
    geoclue2
    geogebra6
    giac-with-xcas
    gnome-font-viewer
    gnome-keyring
    gparted
    gnupg
    home-manager
    htop
    joplin-cli
    joplin-desktop
    jq
    keepassxc
    lsof
    micro
    nextcloud-client
    orage
    pandoc
    redshift
    stellarium
    testdisk
    tmux
    veracrypt
    xfburn
    zip
    unzip
    usbutils
    wget
    (pkgs.callPackage 
      "${builtins.fetchTarball 
        "https://github.com/ryantm/agenix/archive/main.tar.gz"}/pkgs/agenix.nix" {})
  ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  programs.gnupg = {
    agent.enable = true;
    agent.enableSSHSupport = true;
    agent.pinentryPackage = pkgs.pinentry-curses;
  };

  services.gnome.gnome-keyring.enable = true;
}
