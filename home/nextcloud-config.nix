{ config, pkgs, lib, ... }:

let 
  nextcloudConfig = ''
    [General]
    confirmExternalStorage=true
    launchOnSystemStartup=true
    promptDeleteAllFiles=false

    [Accounts]
    0\authType=webflow
    0\dav_user=e5723de6-c194-403c-87ed-f87bbf84f981
    0\displayName=Elie CARROT
    0\url=https://drive.shadow.tech
    0\webflow_user=e5723de6-c194-403c-87ed-f87bbf84f981
  '';
  systemctlExec = "${pkgs.systemd}/bin/systemctl";
in {
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
  
  age.secrets.nextcloud.file = ../secrets/nextcloud.pass.age;
  
  home.activation.nextcloudSettings = lib.hm.dag.entryAfter [ "reloadSystemd" ] ''
    ${systemctlExec} --user stop nextcloud-client.service
    NEXTCLOUD_PW=`cat ${config.age.secrets.nextcloud.path}`
    rm -rf ${config.xdg.configHome}/Nexcloud/
    ${pkgs.nextcloud-client}/bin/nextcloud --serverurl "https://drive.shadow.tech/" \
      --userid elie.carrot-5892 --apppassword $NEXTCLOUD_PW \
      --localdirpath $HOME/Nextcloud --isvfsenabled 1 \
      || printf ""
    ${systemctlExec} --user start nextcloud-client.service
  '';
}
