{ config, pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "java"
      "codebook"
      "latex"
      "dockerfile"
      "doxygen"
      "xy-zed"
      "todo-highlight"
      "nix"
      "toml"
      "lua"
      "xml"
      "make"
      "csv"
      "mermaid"
      "ocaml"
      "plantuml"
      "meson"
    ];
    userSettings = {
      features = {
        copilot = true;
      };
      telemetry = {
        metrics = false;
      };
      ui_font_size = 14;
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 12;
      agent_buffer_font_size = 12;
      project_panel = {
        dock = "left";
      };
      outline_panel = {
        dock = "right";
      };
      collaboration_panel = {
        dock = "right";
      };
      git_panel = {
        dock = "left";
      };
      agent = {
        dock = "right";
        sidebar_side = "left";
      };
      theme = "XY-Zed";
      wrap_guides = [80 100];
      diff_view_style = "split";
    };
  };

  home.packages = with pkgs; [ nil nixd ];
}
