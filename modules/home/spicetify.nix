{
  pkgs,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  # nixpkgs.config is set globally in system.nix (allowUnfree = true)

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      #adblock
      #hidePodcasts
      #shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    theme = spicePkgs.themes.text;
    colorScheme = "CatppuccinMocha";
  };
}
