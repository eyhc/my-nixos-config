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

  programs.thunderbird = {
    enable = true;
    policies = {
      AppAutoUpdate = true;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;
      CaptivePortal = false;

      DisableDeveloperTools = true;
      DisableMasterPasswordCreation = true;
      DisableSecurityBypass = true;
      DisableTelemetry = true;

      Preferences = {
        "mailnews.start_page.enabled" = false;
        "mail.accounthub.enabled" = false;
        "mail.accounthub.addressbook.enabled" = false;
        "font.name.sans-serif.x-western" = "monospace";
        "font.size.variable.x-western" = 14;
        "intl.regional_prefs.use_os_locales" = true;
        "mail.threadpane.listview" = 1;
        "mailnews.default_view_flags" = 0;
        "mail.SpellCheckBeforeSend" = true;
        "spellchecker.dictionary" = "en-US,fr";
        "msgcompose.font_face" = "monospace";
        "mail.compose.default_to_paragraph" = false;
        "mail.default_send_format" = 1; # 0:auto, 1:plaintext, 2:html, 3:both
        "mail.uifontsize" = 12;
        "mail.pane_config.dynamic" = 0; # 0:classic, 1:wide, 2:vertical
      };

      SearchEngines = {
        Default = "DuckDuckGo";
      };

      Extensions = {
        Install = [
          #"https://addons.thunderbird.net/thunderbird/downloads/latest/nu-grey-theme/addon-988401-latest.xpi"
          "https://addons.thunderbird.net/user-media/addons/_attachments/354872/french_spelling_dictionary-6.3.1webext.xpi"
        ];
      };
    };
  };
}
