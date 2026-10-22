{ pkgs ? import <nixpkgs> {} }:

let
  zephyr-nix-src =
    builtins.fetchTarball
      "https://github.com/nix-community/zephyr-nix/archive/master.tar.gz";

  zephyr = pkgs.callPackage zephyr-nix-src {};
in

pkgs.mkShell {
  packages = [
    (zephyr.sdk.override {
      targets = [
        "arm-zephyr-eabi"
        "riscv64-zephyr-elf"
      ];
    })

    zephyr.pythonEnv
    zephyr.hosttools

    pkgs.cmake
    pkgs.ninja
  ];
}
