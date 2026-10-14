{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    # mu4e elisp pinned to the same mu version as the CLI
    extraPackages = epkgs: [ epkgs.mu4e ];
  };

  # Supply system-level build dependencies for Doom's native packages
  #home.packages = with pkgs; [
  #  # vterm dependencies
  #  cmake
  #  gnumake
  #  gcc
  #  libvterm
  #  libtool

  #  # pdf-tools dependencies
  #  pkg-config
  #  poppler
  #  poppler_gi
  #  automake
  #  autoconf
  #];
}
