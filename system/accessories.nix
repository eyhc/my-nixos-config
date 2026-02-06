{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.ark
    backintime
    conky
    featherpad
    galculator
    geoclue2
    #geogebra6
    giac-with-xcas
    gnome-font-viewer
    gparted
    htop
    keepassxc
    nextcloud-client
    redshift
    remmina
    stellarium
    terminator
    xfce.orage
    xfce.xfburn
  ];
  
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
    ];
  };
  
  services.geoclue2.enable = true;
  location.provider = "geoclue2";
}
