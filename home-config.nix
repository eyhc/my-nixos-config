{ config, pkgs, ... }:

{
  home = {
    username = "martin";
    homeDirectory = "/home/martin";
  	stateVersion = "25.11";
  };
  
  imports = [
    ./home/accessories-config.nix
    ./home/bash-config.nix
    ./home/ui-config.nix
    ./home/panels-config.nix
  ];
}
