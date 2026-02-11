{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    imagemagick
    inkscape
    freecad
    gimp2-with-plugins
    sane-backends
    simple-scan
  ];
}
