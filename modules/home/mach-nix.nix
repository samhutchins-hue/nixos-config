{ config, pkgs, ... }:

let
  mach-nix = import (builtins.fetchTarball {
    url = "https://github.com/DavHau/mach-nix/tarball/3.4.0";
    sha256 = "0a1nbryb43smysiz4c0bdfg3ibss6x6g2xvfi0giczh1dwyxf1kd";
  }) {};

  myPythonEnv = mach-nix.mkPython {
    python = pkgs.python3;
    requirements = ''
      my_cookies==1.2.3
    '';
  };
in

{
  home.packages = [
    myPythonEnv
  ];
}
