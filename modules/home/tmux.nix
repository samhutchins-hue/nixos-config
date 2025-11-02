{ pkgs, ... }:

let
  supinie-gruvbox = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "supinie-gruvbox";
    rtpFilePath = "gruvbox-tpm.tmux";
    version = "unstable-2024-04-19";
    src = pkgs.fetchFromGitHub {
      owner = "supinie";
      repo = "tmux-gruvbox";
      rev = "73ceab209502f4ac251ecda3f7dfe6df21e3c449";
      sha256 = "sha256-cVgAnr1SKkZPg4zz6LovTCmVytx49nG8vRvjcifXQ4s=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
      yank
      # tmux-power-zoom
      # gruvbox
      {
        plugin = supinie-gruvbox;
        extraConfig = ''
          set -g @supinie-gruvbox 'dark'
        '';
      }
    ];
    extraConfig = ''
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix
      bind | split-window -h -c "#{pane_current_path}"
      bind _ split-window -v -c "#{pane_current_path}"

      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l

      set -s set-clipboard on
    '';
  };
}
# is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
# | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|\.?l?n?vim?x?(-wrapped)?|fzf)(diff)?$'"
