{ pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        mechatroner.rainbow-csv
        bbenoist.nix
        redhat.vscode-xml
        redhat.vscode-yaml
        yzhang.markdown-all-in-one
        tomoki1207.pdf
        mikestead.dotenv
        hediet.vscode-drawio
        bungcip.better-toml
        zainchen.json
        vitaliymaz.vscode-svg-previewer
        jebbs.plantuml
        
        zhwu95.riscv
        marus25.cortex-debug

        ms-vscode-remote.remote-ssh
        ms-vscode.anycode
        ms-vscode.cmake-tools
        ms-vscode.cpptools
        ms-vscode.cpptools-extension-pack
        ms-vscode.hexeditor
        ms-vscode.makefile-tools
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-containers
        docker.docker

        ms-pyright.pyright
        ms-python.pylint
        ms-python.mypy-type-checker
        ms-python.python
        ms-python.debugpy
        ms-python.vscode-pylance
        ms-toolsai.jupyter

        visualstudioexptteam.vscodeintellicode
        visualstudioexptteam.intellicode-api-usage-examples

        mhutchie.git-graph
        github.github-vscode-theme
        github.vscode-github-actions
        github.vscode-pull-request-github
        gitlab.gitlab-workflow
        
        dart-code.dart-code
        dart-code.flutter
        rust-lang.rust-analyzer
        
        vscjava.vscode-java-debug
        vscjava.vscode-java-dependency
        vscjava.vscode-java-test
        vscjava.vscode-java-pack
        vscjava.vscode-maven
        
        angular.ng-template
        ionic.ionic
        vue.vscode-typescript-vue-plugin
        
        streetsidesoftware.code-spell-checker-french
        streetsidesoftware.code-spell-checker
        
        ocamllabs.ocaml-platform
        
        github.copilot
        github.copilot-chat
        #continue.continue
      ];
      userSettings = {
        "editor.rulers" = [
          { column = 80;  color = "#97ff78"; }
          { column = 100; color = "#ff72d5"; }
          { column = 120; color = "#ffaf6a"; }
        ];
        "chat.disableAIFeatures" = false;
      };
    };
  };
}
