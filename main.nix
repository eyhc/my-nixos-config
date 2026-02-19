{ config, pkgs, ... }:

{
  age.identityPaths = [ "/home/martin/my-nixos-config/secrets/age.key" ];

  imports = [
    # agenix module
    "${builtins.fetchTarball 
      "https://github.com/ryantm/agenix/archive/main.tar.gz"}/modules/age.nix"
    
    # softwares
    ./system/software/prime.nix
    ./system/software/devops.nix
    ./system/software/internet.nix
    ./system/software/office.nix
    ./system/software/accessories.nix
    ./system/software/graphics.nix
    ./system/software/multimedia.nix
    ./system/software/dev.nix
    
    # system config
    ./system/config.nix
    ./system/boot.nix
    
    # UI - XFCE
    ./system/ui.nix
    
    # Hardware
    ./hardware/common.nix
  ];
}
