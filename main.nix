{ config, pkgs, ... }:

{
  imports = [
    ./prime.nix
    ./devops.nix
    ./ui.nix
    ./internet.nix
  ];
}
