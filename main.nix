{ config, pkgs, ... }:

{
  imports = [
    ./prime.nix
    ./devops.nix
  ];
}
