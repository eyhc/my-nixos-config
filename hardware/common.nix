{ config, pkgs, ... }:

{
  # KEYMAP
  console.keyMap = "fr";
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # BLUETOOTH
  hardware.bluetooth.enable = true;
}
