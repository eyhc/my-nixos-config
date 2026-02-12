{ config, pkgs, lib, ... }:

let 
  configPath = "${config.xdg.configHome}/joplin-desktop/";
  joplinExec = "${pkgs.joplin-cli}/bin/joplin";
  systemctlExec = "${pkgs.systemd}/bin/systemctl";
in {
  systemd.user.services.joplin-autostart = {
    Unit = {
      Description = "Joplin NoteBook Desktop";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.joplin-desktop}/bin/joplin-desktop";
      Restart = "on-failure";
      Environment = "DISPLAY=:0";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
  
  age.secrets.joplin.file = ../secrets/nextcloud.pass.age;
  
  home.activation.joplinConfig = lib.hm.dag.entryAfter [ "reloadSystemd" ] ''
    ${systemctlExec} --user stop joplin-autostart.service
    rm -rf ${configPath}
    JOPLIN_PW=`cat ${config.age.secrets.joplin.path}`
    
    ${joplinExec} --profile ${configPath} config sync.target 5
    ${joplinExec} --profile ${configPath} config sync.5.path https://drive.shadow.tech/remote.php/webdav/Joplin
    ${joplinExec} --profile ${configPath} config sync.5.username elie.carrot-5892
    ${joplinExec} --profile ${configPath} config sync.5.password $JOPLIN_PW
    ${joplinExec} --profile ${configPath} config sync.interval 600
    ${joplinExec} --profile ${configPath} config locale fr_FR
    ${joplinExec} --profile ${configPath} config spellChecker.languages '["en-GB", "fr-FR"]'
    
    ${systemctlExec} --user start joplin-autostart.service
  '';
}
