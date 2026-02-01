{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    git-extras
    meld
    gnupg
    tig
    git-cola
    docker
    docker-compose
  ];
}
