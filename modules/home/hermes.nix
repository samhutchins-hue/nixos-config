{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.hermes-agent.homeManagerModules.default ];

  # Hermes Agent (Nous Research) pointed at the local ollama instance from
  # modules/core/services.nix, so this costs nothing and sends nothing offsite.
  #
  # Two option trees, by upstream's own split:
  #   programs.hermes-agent -- "install this for me": the CLI + HERMES_HOME
  #   services.hermes-agent -- "run this daemon" + owns ~/.hermes/config.yaml
  # We want the first and only the config half of the second.

  programs.hermes-agent.enable = true; # hermes, hermes-acp, hermes-agent on PATH

  services.hermes-agent = {
    # Does NOT start anything: every unit in the HM module sits behind
    # `gateway.enable` (off below) or `backend.mode` (defaults to "none").
    # Enabling it here is what makes config.yaml declarative -- the module
    # merges `settings` into the file on disk instead of symlinking it, so
    # `hermes setup` and /model can still write to it without a collision.
    enable = true;

    # `minimal` rather than the flake's `default`. `default` pre-builds every
    # optional integration (messaging, anthropic, bedrock, voice, matrix, ...)
    # for a 3.9 GiB closure; minimal is 3.2 GiB. We reach ollama over the
    # OpenAI-compatible API, so none of those extras are in the path. Switch to
    # `.default` (or add `extraDependencyGroups`) if you later want Telegram or
    # Discord -- see gateway.enable below.
    package = inputs.hermes-agent.packages.${pkgs.system}.minimal;

    # No Telegram/Discord/Slack bot. Turning this on also needs
    # `users.users.samh.linger = true` in core, or systemd kills the user
    # manager at logout and takes the gateway with it.
    gateway.enable = false;

    settings.model = {
      # qwen3-coder:30b is already pulled and reports capabilities
      # ["completion","tools"] -- tool calling is non-negotiable here, since
      # Hermes is agentic and a chat-only model can talk but not act.
      provider = "custom";
      default = "qwen3-coder:30b";
      base_url = "http://127.0.0.1:11434/v1";
    };
  };
}
