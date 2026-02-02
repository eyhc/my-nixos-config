{ config, pkgs, ... }:

{
  #nixpkgs.config.pulseaudio = true;
  
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    excludePackages = with pkgs; [
      xterm
      xfce.mousepad
      xfce.parole
    ];
  };
  
  services.displayManager.defaultSession = "xfce";

  ## TODO
  # icon themes
  ## TODO
  # cursor themes

  ## TODO
  # default panel / default wallpaper
  
}
