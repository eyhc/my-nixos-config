{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    foliate
    libreoffice
    mate.atril
    miktex
    pdfarranger
    texmaker
    xournalpp
  ];
}
