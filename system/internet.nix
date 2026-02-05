{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #discord
    filezilla
    firefox
    mattermost
    openconnect
    thunderbird
    tor
    tor-browser
    transmission_4-gtk
    ungoogled-chromium
  ];
  
  #nixpkgs.config.allowUnfree = true;
}
