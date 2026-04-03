{ pkgs, lib, ... }:

let
  android = pkgs.androidenv.composeAndroidPackages {
    buildToolsVersions = [ "36.0.0" "35.0.0" "28.0.3" ];
    platformVersions = [ "36" "35" "28" ];
    ndkVersions = [ "28.2.13676358" ];
    abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
  };
in {
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
    minicom
    picocom
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
    android.androidsdk
    scrcpy
    
    # Dart - Flutter
    #dart
    flutter
    virtualgl
    mesa
  ];
  
  nixpkgs.config.android_sdk.accept_license = true;
  
  environment.variables = {
    ANDROID_SDK_ROOT = "${android.androidsdk}/libexec/android-sdk";
    ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
    JAVA_HOME = "${pkgs.jdk.home}";
    CHROME_EXECUTABLE = "${pkgs.ungoogled-chromium}/bin/chromium";
    GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/28.0.3/aapt2";
  };

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
