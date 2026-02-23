{ config, pkgs, lib, ... }:

let
  joplinConfigPath = "${config.xdg.configHome}/joplin-desktop/";
  joplinExec = "${pkgs.joplin-cli}/bin/joplin";
  systemctlExec = "${pkgs.systemd}/bin/systemctl";
in {
  ## JOPLIN
  systemd.user.services.joplin-autostart = {
    Unit = {
      Description = "Joplin NoteBook Desktop";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.joplin-desktop}/bin/joplin-desktop";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  age.secrets.joplin.file = ../secrets/nextcloud.pass.age;

  home.activation.joplinConfig = lib.hm.dag.entryAfter [ "reloadSystemd" ] ''
    if [ ! -d "${joplinConfigPath}" ]; then
      ${systemctlExec} --user stop joplin-autostart.service
      JOPLIN_PW=`cat ${config.age.secrets.joplin.path}`

      ${joplinExec} --profile ${joplinConfigPath} config sync.target 5
      ${joplinExec} --profile ${joplinConfigPath} config sync.5.path https://drive.shadow.tech/remote.php/webdav/Joplin
      ${joplinExec} --profile ${joplinConfigPath} config sync.5.username elie.carrot-5892
      ${joplinExec} --profile ${joplinConfigPath} config sync.5.password $JOPLIN_PW
      ${joplinExec} --profile ${joplinConfigPath} config sync.interval 600
      ${joplinExec} --profile ${joplinConfigPath} config locale fr_FR
      ${joplinExec} --profile ${joplinConfigPath} config spellChecker.languages '["en-GB", "fr-FR"]'

      ${systemctlExec} --user start joplin-autostart.service
    else
      printf "\e[0;31m  /!\\ Joplin config already exists, skipping setup.\e[0m\n"
    fi
  '';

  ## NEXTCLOUD
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  home.activation.nextcloudSettings = lib.hm.dag.entryAfter [ "reloadSystemd" ] ''
    ${systemctlExec} --user stop nextcloud-client.service
    ${pkgs.nextcloud-client}/bin/nextcloud --overrideserverurl https://drive.shadow.tech
    ${systemctlExec} --user start nextcloud-client.service
  '';
}
