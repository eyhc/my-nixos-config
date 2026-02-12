{ config, pkgs, ... }:

let
  user = "martin";
in {
  home = {
    username = user;
    homeDirectory = "/home/${user}";
  	stateVersion = "25.11";
  };
  
  imports = [
    "${builtins.fetchTarball 
      "https://github.com/ryantm/agenix/archive/main.tar.gz"}/modules/age-home.nix"
  
    ./home/accessories-config.nix
    ./home/bash-config.nix
    ./home/ui-config.nix
    ./home/panels-config.nix
    ./home/joplin-config.nix
    ./home/nextcloud-config.nix
  ];
  
  age.identityPaths = [ "/home/${user}/my-nixos-config/secrets/age.key" ];
}
