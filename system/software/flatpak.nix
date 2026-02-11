{ config, pkgs, ... }:

let
  nix-flatpak = builtins.fetchTarball {
    url = "https://github.com/gmodena/nix-flatpak/archive/refs/tags/v0.7.0.tar.gz";
    sha256 = "sha256-7ZCulYUD9RmJIDULTRkGLSW1faMpDlPKcbWJLYHoXcs=";
  };
in {
  imports = [
    "${nix-flatpak}/modules/nixos.nix"
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "net.rpdev.OpenTodoList"
      "com.discordapp.Discord"
    ];
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
