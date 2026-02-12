{ config, lib, pkgs, ... }:

let
  featherPadConfig = ''
    [text]
    appendEmptyLine=true
    autoBracket=true
    font="Monospace,10,-1,5,50,0,0,0,0,0"
    lineNumbers=true
    noWrap=false
    showEndings=false
    showWhiteSpace=false
    textTabSize=2
    vLineDistance=80
      
    [window]
    position=@Point\(100 80\)
    size=@Size\(800 500\)
    hideSingleTab=true
    hideSearchbar=true
    showCursorPos=true
  '';
in {
  ## REDSHIFT
  services.redshift = {
    enable = true;
    latitude = "45.21";
    longitude = "5.76";
    provider = "manual";
    temperature = {
      day = 6000;
      night = 2500;
    };
    tray = true;
  };

  ## FEATHERPAD
  home.activation.featherPadConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${config.xdg.configHome}/featherpad"
    printf '%s\n' "${featherPadConfig}" > "${config.xdg.configHome}/featherpad/fp.conf"
  '';
  
  ## GALCULATOR
  xdg.configFile."galculator/galculator.conf" = {
    force = true;
    text = ''
      [general]
      mode=1
      default_number_base=0
      default_angle_base=1
      default_notation_mode=2
    '';
  };
  
  ## THUNAR
  xdg.configFile."Thunar/uca.xml" = {
    force = true;
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <actions>
        <action>
          <icon>terminator</icon>
          <name>Open Terminator Here</name>
          <submenu></submenu>
          <unique-id>1388590880939619-1</unique-id>
          <command>terminator --working-directory %f</command>
          <description>Launch terminal emulator here</description>
          <range></range>
          <patterns>*</patterns>
          <startup-notify/>
          <directories/>
        </action>
        <action>
	        <icon></icon>
	        <name>Open root Thunar here</name>
	        <submenu></submenu>
	        <unique-id>1391443434179984-1</unique-id>
	        <command>pkexec thunar %f</command>
	        <description>Open this folder with administrative rights</description>
	        <range></range>
	        <patterns>*</patterns>
	        <directories/>
	      </action>
        <action>
          <icon></icon>
          <name>Create symlink</name>
          <submenu></submenu>
          <unique-id>1394124450909421-1</unique-id>
          <command>bash -c &apos;F=&quot;$1&quot;; N=&quot;$2&quot;;  P=$(readlink -f &quot;$PWD&quot;); R=$(readlink -f &quot;$F&quot;); [ &quot;$P&quot; = &quot;$R&quot; ] &amp;&amp; exit; ln -s &quot;$F&quot; &quot;$N (symlink)&quot;&apos; - %f %n</command>
          <description>Softlink between two files or directories</description>
          <range></range>
          <patterns>*</patterns>
          <startup-notify/>
          <directories/>
          <other-files/>
          <text-files/>
        </action>
      </actions>
    '';
  };
}
