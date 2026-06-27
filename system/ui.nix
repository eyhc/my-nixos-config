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

  environment.xfce.excludePackages = with pkgs; [
    mousepad
    parole
    xfce4-appfinder
    xfce4-volumed-pulse
  ];

  environment.systemPackages = with pkgs; [
    xfce4-whiskermenu-plugin
    xfce4-docklike-plugin
    xfce4-battery-plugin
    xfce4-power-manager
    xfce4-timer-plugin
    xfce4-systemload-plugin
    xfce4-clipman-plugin
    xfce4-mailwatch-plugin
    xfce4-xkb-plugin
    xfce4-fsguard-plugin
  ];

  services.displayManager.defaultSession = "xfce";
}
