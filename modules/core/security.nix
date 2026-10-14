{ ... }:
{
  security.rtkit.enable = true;
  security.sudo.enable = true;

  # Secret service for Proton Mail Bridge credentials.
  # With autologin PAM can't unlock the keyring; create the default
  # keyring with an empty password on first prompt.
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };
}
