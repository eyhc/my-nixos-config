{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # C / C++ / EMBEDDED
    cmake
    gcc-arm-embedded
    gcc
    gdb
    gnumake
    valgrind
    coreboot-toolchain.riscv
    cpplint
    cppcheck
    platformio-core
    openocd
    tio

    clang
    ninja
    pkg-config
    gtk3
    glib
    libx11
    stdenv.cc
    
    # Python   
    (python3.withPackages (python-pkgs: with python-pkgs; [
      pandas
      requests
      notebook
      numpy
      dbus-python
      tkinter
      pylint
      powerline
      pip
      pipx
      pycairo
      pygobject3
      pyserial
      opencv
      matplotlib
      pandas
      scikit-learn
      ipykernel
      ipython
      notebook
      #spyder
      z3-solver
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
    
    # Library
    rapidjson
    xapian
    libmicrohttpd
    libsecret
    libusb1
    
    # stm
    stlink
    stlink-gui
    probe-rs-tools

    # kicad - fritzing
    kicad-small
    fritzing
    
    # Arduino
    arduino
    arduino-ide
    arduino-cli
    
    # Android
    scrcpy
    
    # Dart - Flutter
    #dart
    flutter
    virtualgl
    mesa
    
    # IA
    ollama
  ];

  services.udev = {
    enable = true;
    packages = with pkgs; [
      stlink
      stlink-gui
      probe-rs-tools
      openocd
    ];
  };
}
