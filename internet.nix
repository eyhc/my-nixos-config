{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox-esr
    thunderbird-esr
    ungoogled-chromium
    filezilla
    tor
    tor-browser
  ];

  # TODO : add discord
}
