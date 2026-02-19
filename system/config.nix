{ config, pkgs, ... }:

{
  # USERS
  users.groups.docker = {};
  users.groups.vboxusers = {};
  
  age.secrets.guestpass.file = ../secrets/guest.pass.age;
  age.secrets.ecarrotpass.file = ../secrets/ecarrot.pass.age;
  
  # wheel for sudoers
  users = {
    mutableUsers = true;
    users = {
      guest = {
        description = "Guest";
        isNormalUser = true;
        hashedPasswordFile = config.age.secrets.guestpass.path;
        extraGroups = [ "networkmanager" ];
      };
      
      ecarrot = {
        description = "Elie Carrot";
        isNormalUser = true;
        hashedPasswordFile = config.age.secrets.ecarrotpass.path;
        extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers" "vboxsf" ];
      };
    };
  };

  # NETWORK
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
  # networking.proxy.default = "http://xx/";
  # networking.proxy.noProxy = "127.0.0.1,localhost";
  # services.openssh.enable = true;

  # BLUETOOTH
  services.blueman.enable = true;
  
  # PRINTERS
  services.printing.enable = true;

  # AUDIO
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
    wireplumber.enable = true;
    extraConfig.pipewire = {
      "99-lowlatency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 1024;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 2048;
        };
      };
    };
  };
  
  # LOCATION
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };
  services.geoclue2.enable = true;
  location.provider = "geoclue2";
}
