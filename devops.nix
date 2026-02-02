{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    git-extras
    gitk
    meld
    gnupg
    tig
    git-cola
    docker
    docker-compose
  ];
}
