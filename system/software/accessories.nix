{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    age
    backintime
    mate.engrampa
    featherpad
    galculator
    geoclue2
    geogebra6
    kdePackages.ghostwriter
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
    nextcloud-client
    pandoc
    redshift
    remmina
    rustdesk-flutter
    stellarium
    terminator
    veracrypt
    xfce.orage
    xfce.xfburn
    zip
    unzip
    (pkgs.callPackage 
      "${builtins.fetchTarball 
        "https://github.com/ryantm/agenix/archive/main.tar.gz"}/pkgs/agenix.nix" {})
  ];
  
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
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
