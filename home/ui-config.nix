{ config, lib, pkgs, ... }:

{
  # THEME GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.qogir-theme;
      name = "Qogir-Light";
    };
    iconTheme = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir-Manjaro";
    };
    cursorTheme = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
    };
  };

  ## XFCE CONFIG
  xfconf.settings = {
    # XFWindow Manager THEME
    xfwm4 = {
      "general/theme" = "Qogir";
      "general/show_dock_shadow" = false;
      "general/show_frame_shadow" = false;
      "general/show_popup_shadow" = false;
      "general/tile_on_move" = true;
      "general/snap_resist" = false;
      "general/snap_to_border" = true;
      "general/snap_to_windows" = true;
      "general/click_to_focus" = false;
      "general/focus_delay" = 600;
      "general/raise_on_focus" = true;
      "general/raise_delay" = 175;
      "general/focus_new" = true;
      "general/raise_on_click" = true;
    };

    # WALLPAPER
    xfce4-desktop =
    let
      image = "${pkgs.xfce.xfdesktop}/share/backgrounds/xfce/xfce-shapes.svg";
    in {
      "backdrop/screen0/monitorVirtual-1/workspace0/last-image" = image;  
      "backdrop/screen0/monitoreDP-1/workspace0/last-image" = image;
      "backdrop/screen0/monitorVirtual-1/workspace0/image-style" = 5;
      "backdrop/screen0/monitoreDP-1/workspace0/image-style" = 5;
      "desktop-icons/primary" = true;
      "desktop-icons/single-click" = false;
      "desktop-icons/sort-folders-before-files" = true;
      "desktop-icons/file-icons/show-removable" = true;
      "desktop-icons/show-thumbnails" = false;
      "desktop-icons/file-icons/show-home" = true;
      "desktop-icons/file-icons/show-filesystem" = true;
      "desktop-icons/file-icons/show-trash" = true;
    };
    
    # THUNAR
    thunar = {
      "last-icon-view-zoom-level" = "THUNAR_ZOOM_LEVEL_75_PERCENT";
    };
    thunar-volman = {
      "autobrowse/enabled" = true;
      "automount-drives/enabled" = true;
      "automount-media/enabled" = true;
      "autoopen/enabled" = false;
    };

    ## SCREENSAVER
    xfce4-screensaver = {
      "saver/enabled" = true;
      "saver/themes/list" = [ "screensavers-xfce-floaters" ];
      "saver/mode" = 2;
      "saver/idle-activation/delay" = 2;
      "lock/enabled" = true;
      "lock/saver-activation/delay" = 1;
    };
  };
}
