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
    xfce.xfburn
  ];
  
  services.redshift = {
    enable = true;
    executable = "/bin/redshift-gtk";
  };
  services.geoclue2.enable = true;
  location.provider = "geoclue2";
}
