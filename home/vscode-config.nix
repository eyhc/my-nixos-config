{ config, pkgs, lib, ... }:

let
  extFromMarketplace = name: publisher: version: sha256: (pkgs.vscode-utils.extensionFromVscodeMarketplace {
    inherit name publisher version sha256;
  });
in {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # AI
      github.copilot
      github.copilot-chat

      # DATA/CONFIG LANGUAGES
      mechatroner.rainbow-csv
      redhat.vscode-xml
      redhat.vscode-yaml
      tamasfe.even-better-toml
      zainchen.json

      # MARKDOWN/PDF
      yzhang.markdown-all-in-one
      tomoki1207.pdf

      # C / C++
      ms-vscode.cmake-tools
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack
      ms-vscode.hexeditor
      ms-vscode.makefile-tools
      (extFromMarketplace "cpplint" "mine" "0.1.3" "sha256-pptjbCdgn9oh/TrEEaX4oqU9JbdKx/A8q9D1XZXbh20=")

      # PYTHON / JUPYTER
      ms-pyright.pyright
      ms-python.pylint
      ms-python.mypy-type-checker
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      ms-toolsai.jupyter

      # DART / FLUTTER
      dart-code.dart-code
      dart-code.flutter

      # RUST
      rust-lang.rust-analyzer
      
      # JAVA
      vscjava.vscode-java-debug
      vscjava.vscode-java-dependency
      vscjava.vscode-java-test
      vscjava.vscode-java-pack
      vscjava.vscode-maven

      # NIX
      bbenoist.nix

      # GO
      golang.go

      # NODE / JS / TS
      angular.ng-template
      #ionic.ionic

      # OCAML
      ocamllabs.ocaml-platform

      # EMBEDDED
      zhwu95.riscv
      #marus25.cortex-debug
      platformio.platformio-vscode-ide

      # SPELL CHECKER
      streetsidesoftware.code-spell-checker-french
      streetsidesoftware.code-spell-checker

      # REMOTE / DOCKER / LIVE SHARE
      ms-vscode-remote.remote-ssh
      ms-vscode.remote-explorer
      ms-vscode-remote.remote-containers
      docker.docker
      ms-vsliveshare.vsliveshare

      # GIT / GITHUB / GITLAB
      mhutchie.git-graph
      github.github-vscode-theme
      github.vscode-github-actions
      github.vscode-pull-request-github
      gitlab.gitlab-workflow

      # DIAGRAMS
      jebbs.plantuml
      hediet.vscode-drawio
      bierner.markdown-mermaid

      # LATEX
      james-yu.latex-workshop

      # OTHERS
      ms-vscode.anycode
      gruntfuggly.todo-tree
      mikestead.dotenv
      vitaliymaz.vscode-svg-previewer
      (extFromMarketplace "free-sqlite" "free-sqlite" "0.6.20"  "sha256-JEuvVaoFTN/U5LpVaDPZjfQnCGbMItzQhhEmtSB7IGQ=")
      (extFromMarketplace "doxdocgen" "cschlosser" "1.4.0"  "sha256-InEfF1X7AgtsV47h8WWq5DZh6k/wxYhl2r/pLZz9JbU=")
    ];
  };

  xdg.configFile."Code/User/settings-base.json" = {
    force = true;
    text = builtins.toJSON {
      # EDITOR / BASIC SETTINGS
      "editor.fontSize" = 14;
      "editor.formatOnSave" = true;
      "editor.autoIndentOnPaste" = true;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "editor.rulers" = [
        { column = 80;  color = "#97ff78"; }
        { column = 100; color = "#ff72d5"; }
        { column = 120; color = "#ffaf6a"; }
      ];

      # FORMAT
      "[cpp]"."editor.defaultFormatter" = "ms-vscode.cpptools";
      "[c]"."editor.defaultFormatter" = "ms-vscode.cpptools";

      # IA
      "github.copilot.nextEditSuggestions.enabled" = true;
      "github.copilot.enable" = { "*" = false; };
      "editor.aiStats.enabled" = true;

      "workbench.colorTheme" = "GitHub Dark Default";
      "notebook.insertFinalNewline" = true;

      # SPELL CHECKER
      "cSpell.checkLimit" = 1024;
      "cSpell.maxNumberOfProblems" = 512;
      "cSpell.language" = "en,fr";
      "cSpell.enabledFileTypes" = {
        "latex" = true;
        "plaintext" = true;
        "*" = false;
        "tex" = true;
      };

      # cpplint
      "cpplint.cpplintPath" = "${pkgs.cpplint}/bin/cpplint";
      "cpplint.filters" = [
        "-build/c++17" "-whitespace/indent" "-build/include_what_you_use"
      ];
      "cpplint.extensions" = [
        "cpp" "h++" "cuh" "c" "c++" "cu" "hxx" "hpp" "cc" "cxx" "h"
      ];

      # C / CPP SETTINGS
      "C_Cpp.clang_format_fallbackStyle" = "LLVM";
      "C_Cpp.clang_format_style" = "file";
      "C_Cpp.default.compilerPath" = "${pkgs.gcc}/bin/gcc";
      "C_Cpp.default.cppStandard" = "c++17";
      "C_Cpp.default.cStandard" = "c17";
      "C_Cpp.default.configurationProvider" = "ms-vscode.cmake-tools";
      "C_Cpp.default.intelliSenseMode" = "linux-gcc-x64";
      "C_Cpp.default.includePath" = [ "\${workspace}/**" ];
    };
  };

  home.activation.mergeVscodeSettings = lib.hm.dag.entryAfter ["writeBoundary"] ''
    SETTINGS_DIR="${config.xdg.configHome}/Code/User"
    BASE="$SETTINGS_DIR/settings-base.json"
    LOCAL="$SETTINGS_DIR/settings.json"

    if [ ! -f "$LOCAL" ]; then
      cp "$BASE" "$LOCAL"
    else
      TMP=$(mktemp)
      ${pkgs.jq}/bin/jq -s '.[0] * .[1]' "$LOCAL" "$BASE" > "$TMP"
      mv "$TMP" "$LOCAL"
    fi
  '';
}
