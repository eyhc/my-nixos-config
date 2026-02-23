{ config, pkgs, lib, ... }:

{
  ##############################################################################
  ##                                FIREFOX                                   ##
  ##############################################################################
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = false;
    languagePacks = [ "en-GB" "fr" ];

    # POLICIES
    policies = {
      AppAutoUpdate = true;
      AllowFileSelectionDialogs = true;

      AutofillCreditCardEnabled = false;
      BrowserDataBackup = {
        AllowBackup = false;
        AllowRestore = false;
      };
      CaptivePortal = true;

      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisableMasterPasswordCreation = true;
      DisableForgetButton = true;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;

      DisplayBookmarksToolbar = "always";
      DisplayMenuBar = "never";

      BlockAboutProfiles = true;
      BlockAboutConfig = true;
      BlockAboutSupport = true;

      GenerativeAI = {
        Enabled = false;
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Locked = true;
      };
      Homepage = {
        Locked = true;
        StartPage = "none";
      };

      NewTabPage = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;

      PictureInPicture = true;
      PrintingEnabled = true;
      PrivateBrowsingModeAvailability = 0;
      ShowHomeButton = false;

      Extensions = {
        Install = [
          "https://addons.mozilla.org/firefox/downloads/file/4689687/eclipse_gray-1.0.xpi"
        ];
      };
    };

    # PROFILE
    profiles.default = {
      # SEARCH ENGINE
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
      };

      # BOOKMARKS
      bookmarks = {
        force = true;
        settings = [
          {
            name = "wikipedia";
            tags = [ "wiki" ];
            keyword = "wiki";
            url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
          }
          {
            name = "Toolbar";
            toolbar = true;
            bookmarks = [
              { name = "Google"; url = "https://www.google.com"; }
              { name = "Wikipedia"; url = "https://wikipedia.org/"; }
              { name = "Mail UGA"; url = "https://webmail.etu.univ-grenoble-alpes.fr/mail#1"; }
              { name = "ProtonMail"; url = "https://mail.proton.me/u/"; }
              { name = "Calendar"; url = "https://calendar.proton.me/u/"; }
              { name = "Youtube"; url = "https://www.youtube.com/"; }
              { name = "Linguee"; url = "https://www.linguee.com/"; }
              { name = "Deepl"; url = "https://www.deepl.com/en/translator"; }
              { name = "Géoportail"; url = "https://www.geoportail.gouv.fr/"; }
              { name = "MF"; url = "https://meteofrance.com/"; }
              {
                name = "NixOS";
                bookmarks = [
                  { name = "Homepage"; url = "https://nixos.org/"; }
                  { name = "Wiki"; url = "https://wiki.nixos.org/"; }
                  { name = "Pkgs"; url = "https://search.nixos.org/packages"; }
                  { name = "Options"; url = "https://search.nixos.org/options"; }
                  {
                    name = "HomeManager Appendix A";
                    url = "https://home-manager.dev/manual/24.11/options.xhtml";
                  }
                ];
              }
              {
                name = "Conserv. Doc.";
                url = "https://www.service-public.gouv.fr/particuliers/vosdroits/F19134";
              }
            ];
          }
        ];
      };

      # EXTENSIONS
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          ghostery
          privacy-badger
          keepassxc-browser
          improved-tube
          tournesol
          french-dictionary
        ];
      };

      settings = {
        "extensions.autoDisableScopes" = 0;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;


  ##############################################################################
  ##                             THUNDERBIRD                                  ##
  ##############################################################################
  accounts = {
    email.accounts =  {
      uga = {
        thunderbird.enable = true;
        address = "elie.carrot@etu.univ-grenoble-alpes.fr";
        flavor = "plain";
        realName = "Elie Carrot";
        userName = "elie.carrot@etu.univ-grenoble-alpes.fr";
        imap = {
          host = "webmail.renater.fr";
          port = 993;
          tls = {
            enable = true;
            useStartTls = false;
          };
        };
        smtp = {
          host = "webmail.renater.fr";
          port = 587;
          tls = {
            enable = true;
            useStartTls = true;
          };
        };

        primary = true;
      };

      laposte = {
        thunderbird.enable = true;
        address = "elie.carrot@laposte.net";
        flavor = "plain";
        realName = "Elie Carrot";
        userName = "elie.carrot";
        imap = {
          host = "imap.laposte.net";
          port = 993;
          tls = {
            enable = true;
            useStartTls = false;
          };
        };
        smtp = {
          host = "smtp.laposte.net";
          port = 465;
          tls = {
            enable = true;
            useStartTls = false;
          };
        };
      };

      gmail = {
        thunderbird.enable = true;
        address = "eyh.carrot@gmail.com";
        flavor = "gmail.com";
        realName = "Elie Carrot";
      };
    };
  };

  programs.thunderbird = {
    enable = true;
    profiles = {
      uga.isDefault = true;
    };
  };

  systemd.user.services.thunderbird-autostart = {
    Unit = {
      Description = "Thunderbird Mail Client";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.thunderbird}/bin/thunderbird";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
