{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    age
    kdePackages.ark
    backintime
    featherpad
    galculator
    geoclue2
    #geogebra6
    giac-with-xcas
    gnome-font-viewer
    gparted
    gnupg
    home-manager
    htop
    joplin-cli
    joplin-desktop
    keepassxc
    nextcloud-client
    redshift
    remmina
    stellarium
    terminator
    veracrypt
    xfce.orage
    xfce.xfburn
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
}
