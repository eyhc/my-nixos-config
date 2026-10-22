{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.scrcpy
    pkgs.android-tools
  ];
}
