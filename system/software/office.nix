{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    foliate
    libreoffice
    atril
    miktex
    pdfarranger
    texmaker
    xournalpp
  ];
}
