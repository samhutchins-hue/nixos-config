{ lib, inputs, ... }:
{
  programs.keychain = {
    enable = true;
    keys = [ "id_nix" ];
    extraFlags = [ "--quiet" ];
  };
}
