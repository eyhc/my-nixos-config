{ config, pkgs, ... }:

{
  imports = [
    ./system/prime.nix
    ./system/devops.nix
    ./system/ui.nix
    ./system/internet.nix
    ./system/office.nix
    ./system/accessories.nix
    ./system/graphics.nix
    ./system/multimedia.nix
    ./system/dev.nix
  ];
}
