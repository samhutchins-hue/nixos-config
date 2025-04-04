{ pkgs, inputs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: with epkgs; [
      pdf-tools
      org-pdftools
    ];
    # Optionally, you can specify the package version
    # package = pkgs.emacs;
  };
}

