{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    imagemagick
    inkscape
    freecad
    gimp-with-plugins
    sane-backends
    simple-scan
  ];
}
