{ config, pkgs, ...}:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # VIDEO / VLC
      "video/dv" = [ "vlc.desktop" ];
      "video/mp2t" = [ "vlc.desktop" ];
      "video/mp4" = [ "vlc.desktop" ];
      "video/mpeg" = [ "vlc.desktop" ];
      "video/ogg" = [ "vlc.desktop" ];
      "video/quicktime" = [ "vlc.desktop" ];
      "video/vnd.mpegurl" = [ "vlc.desktop" ];
      "video/vnd.rn-realvideo" = [ "vlc.desktop" ];
      "video/webm" = [ "vlc.desktop" ];
      "video/3gpp" = [ "vlc.desktop" ];
      "video/3gpp2" = [ "vlc.desktop" ];
      "video/vnd.avi" = [ "vlc.desktop" ];
      "video/x-ogm+ogg" = [ "vlc.desktop" ];
      "video/x-theora+ogg" = [ "vlc.desktop" ];
      "video/x-flic" = [ "vlc.desktop" ];
      "video/x-flv" = [ "vlc.desktop" ];
      "video/x-javafx" = [ "vlc.desktop" ];
      "video/x-matroska" = [ "vlc.desktop" ];
      "video/x-matroska-3d" = [ "vlc.desktop" ];
      "video/x-ms-wmv" = [ "vlc.desktop" ];
      "video/x-nsv" = [ "vlc.desktop" ];
      "x-content/video-dvd" = [ "vlc.desktop" ];
      "x-content/video-svcd" = [ "vlc.desktop" ];
      "x-content/video-vcd" = [ "vlc.desktop" ];
      
      # AUDIO / VLC
      "x-content/audio-cdda" = [ "vlc.desktop" ];
      "audio/x-wavpack=vlc.desktop
      "audio/x-speex+ogg" = [ "vlc.desktop" ];
      "audio/x-opus+ogg" = [ "vlc.desktop" ];
      "audio/x-musepack" = [ "vlc.desktop" ];
      "audio/x-ms-wma" = [ "vlc.desktop" ];
      "audio/x-ms-asx" = [ "vlc.desktop" ];
      "audio/x-matroska" = [ "vlc.desktop" ];
      "audio/x-m4b" = [ "vlc.desktop" ];
      "audio/x-m4r" = [ "vlc.desktop" ];
      "audio/x-flac+ogg" = [ "vlc.desktop" ];
      "audio/x-ape" = [ "vlc.desktop" ];
      "audio/x-aiff" = [ "vlc.desktop" ];
      "audio/x-adpcm" = [ "vlc.desktop" ];
      "audio/vnd.wave" = [ "vlc.desktop" ];
      "audio/vnd.rn-realaudio" = [ "vlc.desktop" ];
      "audio/ogg" = [ "vlc.desktop" ];
      "audio/mp2" = [ "vlc.desktop" ];
      "audio/flac" = [ "vlc.desktop" ];
      "audio/basic" = [ "vlc.desktop" ];
      "audio/ac3" = [ "vlc.desktop" ];
      "audio/aac" = [ "vlc.desktop" ];
      "audio/mpeg" = [ "vlc.desktop" ];
      "audio/midi" = [ "vlc.desktop" ];
      "audio/mp4" = [ "vlc.desktop" ];
      "audio/x-mpegurl" = [ "vlc.desktop" ];
      "audio/x-scpls" = [ "vlc.desktop" ];
      "audio/x-vorbis+ogg" = [ "vlc.desktop" ];
      "audio/webm" = [ "vlc.desktop" ];
      
      # IMAGE / RISTRETTO + GIMP
      "image/x-xpixmap" = [ "org.xfce.ristretto.desktop" ]
      "image/x-tiff-multipage" = [ "org.xfce.ristretto.desktop" ]
      "image/x-sony-srf" = [ "org.xfce.ristretto.desktop" ]
      "image/x-sony-sr2" = [ "org.xfce.ristretto.desktop" ]
      "image/x-sony-arw" = [ "org.xfce.ristretto.desktop" ]
      "image/x-pentax-pef" = [ "org.xfce.ristretto.desktop" ]
      "image/x-nikon-nrw" = [ "org.xfce.ristretto.desktop" ]
      "image/x-nikon-nef" = [ "org.xfce.ristretto.desktop" ]
      "image/x-kodak-kdc" = [ "org.xfce.ristretto.desktop" ]
      "image/x-kodak-k25" = [ "org.xfce.ristretto.desktop" ]
      "image/x-kodak-dcr" = [ "org.xfce.ristretto.desktop" ]
      "image/x-canon-cr2" = [ "org.xfce.ristretto.desktop" ]
      "image/x-adobe-dng" = [ "org.xfce.ristretto.desktop" ]
      "image/webp" = [ "org.xfce.ristretto.desktop" ]
      "image/tiff" = [ "org.xfce.ristretto.desktop" ]
      "image/svg+xml" = [ "org.xfce.ristretto.desktop" ]
      "image/jpeg" = [ "org.xfce.ristretto.desktop" ]
      "image/gif" = [ "org.xfce.ristretto.desktop" ]
      "image/bmp" = [ "org.xfce.ristretto.desktop" ]
      "image/apng" = [ "org.xfce.ristretto.desktop" ]
      "image/png" = [ "org.xfce.ristretto.desktop" ]

      "image/emf" = [ "org.inkscape.Inkscape.desktop" ]
      "image/jp2" = [ "gimp.desktop" ]
      "image/vnd.zbrush.pcx" = [ "gimp.desktop" ]
      "image/vnd.microsoft.icon" = [ "gimp.desktop" ]
      "image/wmf" = [ "org.inkscape.Inkscape.desktop" ]
      "image/x-bzeps" = [ "engrampa.desktop" ]
      "image/x-portable-pixmap" = [ "gimp.desktop" ]
      "image/x-gzeps" = [ "engrampa.desktop" ]
      "image/x-eps" = [ "org.inkscape.Inkscape.desktop" ]
      "image/svg+xml-compressed" = [ "engrampa.desktop" ]
      
      
      # TEXT / FEATHERPAD
      
      
      # LIBREOFFICE
      
      
      # FIREFOX
      
      
      # THUNDERBIRD
      
      
      # EPUB / FOLIATE
      "application/epub+zip" = [ "com.github.johnfactotum.Foliate.desktop" ]
      "application/vnd.amazon.mobi8-ebook" = [ "com.github.johnfactotum.Foliate.desktop" ]
      "application/x-mobipocket-ebook" = [ "com.github.johnfactotum.Foliate.desktop" ]
    }
  };
}
