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
    #spyder
    python312
    #python312Packages.spyder
    python312Packages.notebook
    python312Packages.pip
    python312Packages.pipx
    python312Packages.numpy
    python312Packages.opencv4Full
    python312Packages.matplotlib
    python312Packages.pandas
    python312Packages.scikit-learn
    python312Packages.ipykernel
    python312Packages.ipython
    python312Packages.powerline
    python312Packages.pylint-venv
    python312Packages.tkinter
    
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
  ];
  
  nixpkgs.config.allowUnfree = true;
}
