{ pkgs, ... }:
let
  bridgeCert = "/home/samh/.config/protonmail/bridge-v3/cert.pem";
in
{
  # Proton Mail Bridge as a user service (IMAP 127.0.0.1:1143, SMTP 127.0.0.1:1025).
  # Secrets live in pass (no daemon/D-Bus; survives autologin boots, unlike
  # gnome-keyring, which repeatedly lost the bridge vault key).
  # One-time login required: `protonmail-bridge --cli` -> `login`, then store the
  # bridge password with: `pass insert protonmail-bridge`
  services.protonmail-bridge = {
    enable = true;
    extraPackages = [ pkgs.pass pkgs.gnupg ];
  };

  accounts.email = {
    maildirBasePath = "Mail";
    accounts.proton = {
      primary = true;
      address = "sthutchins@pm.me";
      userName = "sthutchins@pm.me";
      realName = "Sam Hutchins";
      passwordCommand = "pass show protonmail-bridge";
      imap = {
        host = "127.0.0.1";
        port = 1143;
        tls = {
          useStartTls = true;
          certificatesFile = bridgeCert;
        };
      };
      smtp = {
        host = "127.0.0.1";
        port = 1025;
        tls = {
          useStartTls = true;
          certificatesFile = bridgeCert;
        };
      };
      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
      };
      msmtp.enable = true;
      mu.enable = true;
    };
  };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.mu.enable = true;

  programs.password-store.enable = true;
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
