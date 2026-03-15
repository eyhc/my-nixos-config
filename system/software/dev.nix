{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # C / C++ / EMBEDDED
    cmake
    gcc-arm-embedded
    gcc
    gdb
    gnumake
    llvmPackages_20.clang-unwrapped
    valgrind
    coreboot-toolchain.riscv
    cpplint
    cppcheck
    platformio-core
    openocd
    minicom
    picocom
    tio
    
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
      numpy
      opencv
      matplotlib
      pandas
      scikit-learn
      ipykernel
      ipython
      notebook
      #spyder
      z3-solver
      meshtastic
      meshcore
    ]))
    
    # Java
    javaPackages.compiler.openjdk21
    maven
    gradle
    
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
    kicad
    fritzing
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
