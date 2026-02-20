{ config, lib, pkgs, ... }:

{
  xfconf.settings = {
    
    xfce4-panel = let 
      mkUint = v: { type = "uint"; value = v; };
      uintZero = mkUint 0;
    in {
      # GLOBAL
      panels = [ 1 2 ];
      "panels/dark-mode" = false;
      
      ## 1ST PANEL
      "panels/panel-1/autohide-behavior" = uintZero;
      "panels/panel-1/background-style" = uintZero;
      "panels/panel-1/border-width" = uintZero;
      "panels/panel-1/enable-struts" = true;
      "panels/panel-1/length" = 100.0;
      "panels/panel-1/length-adjust" = true;
      "panels/panel-1/mode" = uintZero;
      "panels/panel-1/nrows" = mkUint 1;
      "panels/panel-1/position" = "p=6;x=0;y=0";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/size" = mkUint 24;
      "panels/panel-1/plugin-ids" = [
        1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
      ];      
      # ----
      "plugins/plugin-1" = "whiskermenu";
      "plugins/plugin-1/button-icon" = "desktop-environment-xfce";
      "plugins/plugin-1/button-title" = "Applications";
      "plugins/plugin-1/favorites-in-recent" = false;   
      "plugins/plugin-1/menu-width" = 450;
      "plugins/plugin-1/menu-height" = 500;   
      "plugins/plugin-1/show-button-icon" = true;
      "plugins/plugin-1/show-button-title" = true;
      "plugins/plugin-1/show-command-logout" = true;
      "plugins/plugin-1/show-command-shutdown" = false;
      "plugins/plugin-1/show-command-suspend" = true;
      "plugins/plugin-1/show-command-logoutuser" = false;
      "plugins/plugin-1/show-command-profile" = false;
      "plugins/plugin-1/show-command-menueditor" = false;
      "plugins/plugin-1/view-mode" = 1;
      "plugins/plugin-1/favorites" = [
        "startcenter.desktop"
        "texmaker.desktop"
        "com.obsproject.Studio.desktop"
        "fr.handbrake.ghb.desktop"
        "audacity.desktop"
        "gimp.desktop"
        "veracrypt.desktop"
        "gparted.desktop"
        "xcas.desktop"
        "org.xfce.ristretto.desktop"
      ];
      # ----
      "plugins/plugin-2" = "separator";
      "plugins/plugin-2/expand" = true;
      "plugins/plugin-2/style" = uintZero;
      # ----
      "plugins/plugin-3" = "clock";
      "plugins/plugin-3/command" = "orage";
      "plugins/plugin-3/mode" = mkUint 2;
      "plugins/plugin-3/digital-layout" = mkUint 1;
      "plugins/plugin-3/digital-date-format" = "%A %d %B %Y";
      "plugins/plugin-3/digital-time-format" = "%R";
      "plugins/plugin-3/style" = uintZero;
      # ----
      "plugins/plugin-4" = "separator";
      "plugins/plugin-4/expand" = true;
      "plugins/plugin-4/style" = uintZero;
      # ----
      "plugins/plugin-5" = "systemload";
      "plugins/plugin-5/timeout" = mkUint 500;
      "plugins/plugin-5/timeout-seconds" = mkUint 1;
      "plugins/plugin-5/uptime/enabled" = false;
      # ----
      "plugins/plugin-6" = "separator";
      "plugins/plugin-6/style" = uintZero;
      # ----
      "plugins/plugin-7" = "pager";
      "plugins/plugin-7/rows" = mkUint 1;
      "plugins/plugin-7/miniature-view" = true;
      "plugins/plugin-7/wrap-workspaces" = false;
      "plugins/plugin-7/workspace-scrolling" = true;
      # ----
      "plugins/plugin-8" = "separator";
      "plugins/plugin-8/style" = uintZero;
      # ----
      "plugins/plugin-9" = "pulseaudio";
      "plugins/plugin-9/enable-keyboard-shortcuts" = true;
      "plugins/plugin-10" = "notification-plugin";
      "plugins/plugin-11" = "xfce4-clipman-plugin";
      "plugins/plugin-12" = "systray";
      "plugins/plugin-12/square-icons" = false;
      "plugins/plugin-12/menu-is-primary" = true;
      "plugins/plugin-13" = "power-manager-plugin";
      # ----
      "plugins/plugin-14" = "separator";
      "plugins/plugin-14/style" = uintZero;
      # ----
      "plugins/plugin-15" = "actions";
      "plugins/plugin-15/button-title" = uintZero;
      "plugins/plugin-15/appearance" = uintZero;
      "plugins/plugin-15/items" = [
        "+lock-screen"
        "-switch-user"
        "+suspend"
        "-hibernate"
        "-hybrid-sleep"
        "-shutdown"
        "-restart"
        "+logout"
        "-logout-dialog"
      ];
      
      
      ## 2ND PANEL
      "panels/panel-2/autohide-behavior" = mkUint 1;
      "panels/panel-2/length" = 1.0;
      "panels/panel-2/length-adjust" = true;
      "panels/panel-2/mode" = uintZero;
      "panels/panel-2/position" = "p=10;x=0;y=0";
      "panels/panel-2/position-locked" = true;
      "panels/panel-2/size" = mkUint 48;
      "panels/panel-2/plugin-ids" = [
        20 21 22 23 24 25 26
      ];
      # ----
      "plugins/plugin-20" = "docklike";
      "plugins/plugin-21" = "separator";
      # ----
      "plugins/plugin-22" = "separator";
      "plugins/plugin-22/style" = uintZero;
      "plugins/plugin-23" = "showdesktop";
      "plugins/plugin-23/show-on-hover" = false;
      "plugins/plugin-24" = "separator";
      "plugins/plugin-24/style" = uintZero;
      # ----
      "plugins/plugin-25" = "directorymenu";
      "plugins/plugin-25/base-directory" = "/home/martin";
      "plugins/plugin-25/hidden-files" = false;
      "plugins/plugin-25/icon-name" = "default-fileopen";
      "plugins/plugin-25/new-folder" = true;
      "plugins/plugin-25/new-document" = true;
      "plugins/plugin-26" = "separator";
      "plugins/plugin-26/style" = uintZero;
    };
    
    ## Power manager config
    xfce4-power-manager = {
      "xfce4-power-manager/show-tray-icon" = false;
      "xfce4-power-manager/show-panel-label" = 1;
      "xfce4-power-manager/show-presentation-indicator" = false;
      "xfce4-power-manager/presentation-mode" = false;
    };
    
    # SuperL -> whiskermenu
    xfce4-keyboard-shortcuts = {
      "commands/custom/Super_L" = "xfce4-popup-whiskermenu";
    };
    
  };
  
  ## DOCKLIKE Config
  xdg.configFile."xfce4/panel/docklike-20.rc" = {
    force = true;
    text = ''
      [user]
      noWindowsListIfSingle=true
      indicatorStyle=2
      inactiveIndicatorStyle=2
      indicatorOrientation=0
      onlyDisplayVisible=true
      onlyDisplayScreen=true
      showPreviews=false
      showWindowCount=false
      indicatorColorFromTheme=false
      inactiveColor=rgb(255,120,0)
      indicatorColor=rgb(64,191,168)
      pinned=firefox;thunar;terminator;writer;calc;impress;thunderbird;codium-url-handler;texmaker;featherpad;galculator;xfce4-screenshooter;org.keepassxc.KeePassXC;joplin;
      forceIconSize=false
      iconSize=38
      keyComboActive=false
      middleButtonBehavior=1
    '';
  };
}
