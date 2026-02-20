{ config, pkgs, ... }:

let
  user = "martin";
  nur-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") { inherit pkgs; };
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
    ./home/nextcloud-joplin-config.nix
    ./home/internet-config.nix
    ./home/vscode-config.nix
  ];
  
  age.identityPaths = [ "/home/${user}/my-nixos-config/secrets/age.key" ];
  
  nixpkgs.overlays = [
    (self: super: { nur = nur-pkgs; })
  ];
}
