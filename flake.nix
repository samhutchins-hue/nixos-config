{
  description = "Aremihc's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";

    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nixvim.url = "github:samhutchins-hue/nixvimtemp";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprmag.url = "github:SIMULATAN/hyprmag";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    claude-code.url = "github:sadjow/claude-code-nix";

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      self,
      ...
    }@inputs:
    let
      username = "samh";
      mkSystem = host: nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/${host}
          { nixpkgs.hostPlatform = "x86_64-linux"; }
        ];
        specialArgs = {
          inherit host self inputs username;
        };
      };
    in
    {
      nixosConfigurations = {
        desktop = mkSystem "desktop";
        laptop = mkSystem "laptop";
        vm = mkSystem "vm";
      };
    };
}
