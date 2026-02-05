{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.ark
    backintime
    conky
    featherpad
    galculator
    #geogebra6
    giac-with-xcas
    gnome-font-viewer
    gparted
    htop
    keepassxc
    nextcloud-client
    redshift
    stellarium
    terminator
    xfce.xfburn
  ];
}
