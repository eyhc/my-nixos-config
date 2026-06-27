{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    git
    gitFull
    git-extras
    gnupg
    meld
    qemu
    tig
  ];

  virtualisation = {
    virtualbox = {
      host.enable = true;
      guest.enable = true;
    };

    docker = {
      enable = true;
      daemon.settings = {
        data-root = "/home/docker";
      };
    };
  };
}
