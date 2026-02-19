{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    audacity
    cheese
    handbrake
    helvum
    mplayer
    obs-studio
    pavucontrol
    vlc
  ];
}
