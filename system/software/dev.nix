{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # C / C++ / EMBEDDED
    clang
    cmake
    conan
    dtc
    gcc-arm-embedded
    gcc
    gdb
    gnumake
    ninja
    openocd
    pkg-config
    valgrind
    vcpkg

    coreboot-toolchain.riscv
    cpplint
    cppcheck
    tio

    # Python   
    (python3.withPackages (python-pkgs: with python-pkgs; [
      requests
      notebook
      numpy
      dbus-python
      powerline
      pip
      matplotlib
      ipykernel
      ipython
    ]))

    # Java
    jdk
    maven

    # WEB
    bruno
    nodejs_24

    # RUST
    rustup

    # Editors
    vscode
    neovim

    # kicad - fritzing
    kicad-small

    # Arduino
    arduino
    arduino-ide
    arduino-cli

    # Dart - Flutter
    #dart
    #flutter
    #virtualgl
    #mesa

    # IA
    ollama
  ];

  services.udev = {
    enable = true;
    packages = with pkgs; [
      openocd
    ];
  };
}
