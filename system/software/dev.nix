{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # C / C++
    cmake
    gcc-arm-embedded
    gcc_multi
    gdb
    gnumake
    llvmPackages_20.clang-unwrapped
    valgrind
    coreboot-toolchain.riscv
    
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
    
    # Literate prog
    noweb
  ];
  
  nixpkgs.config.allowUnfree = true;
}
