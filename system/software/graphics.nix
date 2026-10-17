{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    imagemagick
    inkscape
    gimp-with-plugins
    sane-backends
    simple-scan
  ];
}
