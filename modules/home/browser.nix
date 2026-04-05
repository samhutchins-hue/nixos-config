{ inputs
, pkgs
, host
, ...
}:
{
  home.packages = (
    with pkgs; [ inputs.zen-browser.packages.${pkgs.system}.default ]
  );
}
