{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    appimage-run
    docker
    docker-compose
    git
    gitFull
    git-extras
    gnupg
    kvmtool
    meld
    qemu
    tig
  ];
  
  virtualisation.virtualbox = {
    host.enable = true;
    guest.enable = true;
  };
}
