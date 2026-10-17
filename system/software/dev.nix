{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # C / C++ / EMBEDDED
    gcc
    gdb
    gnumake
    openocd
    valgrind
    tio

    # Python
    (python3.withPackages (python-pkgs: with python-pkgs; [
      numpy
      pip
      matplotlib
    ]))

    # Java
    jdk

    # WEB
    nodejs

    # IA
    ollama
  ];

  services.udev = {
    enable = true;
    packages = with pkgs; [
      openocd
    ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = [ pkgs.zlib pkgs.openssl ];
  };
}
