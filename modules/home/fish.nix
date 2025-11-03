{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    # Paste the contents of caelestia-dots/caelestia/fish/config.fish
    shellInit = ''
      set -U fish_greeting #
      starship init fish | source
    '';
  };

  # Enable and configure starship prompt
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # Paste the contents of caelestia-dots/caelestia/starship.toml
    settings = {
      #
      format = "$directory$git_branch$git_status$line_break$character";
      right_format = "$time";

      add_newline = false;

      directory = {
        style = "bold #83a598";
        truncation_length = 8;
        truncate_to_repo = false;
      };

      character = {
        success_symbol = "[❯](bold #a9b665)";
        error_symbol = "[❯](bold #ea6962)";
        vimcmd_symbol = "[❮](bold #d8a657)";
      };

      git_branch = {
        format = "on [$symbol$branch]($style)";
        style = "bold #d8a657";
        symbol = " ";
      };
      git_status = {
        format = "[$all_status$ahead_behind]($style)";
        style = "bold #d8a657";
        conflicted = "…";
        ahead = "↑";
        behind = "↓";
        diverged = "⇕";
        untracked = "?";
        stashed = "*";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "x";
      };

      time = {
        disabled = false;
        format = "[$time]($style)";
        style = "bold #7daea3";
      };
    };
  };
}
