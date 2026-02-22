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
    minicom
    picocom
    
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
      numpy
      opencv
      matplotlib
      pandas
      scikit-learn
      ipykernel
      ipython
      notebook
      #spyder
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
    
    # Literate prog
    noweb
  ];
}
