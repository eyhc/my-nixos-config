{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    cowsay
    fortune
    lolcat
    sl
    figlet
    cmatrix
    asciiquarium
    rig
    bastet
    greed
  ];
}
