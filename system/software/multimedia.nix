{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    audacity
    cheese
    handbrake
    mplayer
    obs-studio
    pavucontrol
    vlc
    ffmpeg
  ];
}
