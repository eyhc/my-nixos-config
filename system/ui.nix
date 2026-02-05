{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;

    # DESKTOP MANAGER
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
      };
    };

    # DISPLAY MANAGER
    displayManager.lightdm.greeters.gtk = {
      theme = {
        package = pkgs.qogir-theme;
        name = "Qogir-Dark";
      };
      cursorTheme = {
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
        size = 24;
      };
    };
    excludePackages = with pkgs; [
      xterm
    ];
  };

  environment.xfce.excludePackages = with pkgs.xfce; [
    mousepad
    parole
    xfce4-appfinder
    xfce4-volumed-pulse
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    xfce.xfce4-whiskermenu-plugin
  ];

  services.displayManager.defaultSession = "xfce";
}
