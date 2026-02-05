{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    virtualbox
  ];
  
  users.groups.docker = {};
  users.groups.vboxusers = {};
  users.extraUsers.martin.extraGroups = [ "docker" "vboxsf" "vboxusers" ];
}
