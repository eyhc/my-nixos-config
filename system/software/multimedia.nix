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

  security.wrappers = {
    cdrdao = {
      setuid = true;
      owner = "root";
      group = "cdrom";
      permissions = "u+wrx,g+x";
      source = "${pkgs.cdrdao}/bin/cdrdao";
    };
    cdrecord = {
      setuid = true;
      owner = "root";
      group = "cdrom";
      permissions = "u+wrx,g+x";
      source = "${pkgs.cdrtools}/bin/cdrecord";
    };
  };
}
