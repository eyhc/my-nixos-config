{config, pkgs, lib, ...}:

{
  home.activation.npmConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.nodejs_24}/bin/npm config set prefix '~/.npm'
  '';
}
