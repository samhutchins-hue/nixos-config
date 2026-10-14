{pkgs, ...}:
let
  ttvlol = pkgs.fetchurl {
    url = "https://github.com/2bc4/streamlink-ttvlol/releases/latest/download/twitch.py";
    hash = "sha256-84y5l1WoGSFtNJY++8J0wPqCR5IVxLoZS9eXc3Ysq04";
  };
in
{
home.packages = with pkgs; [
    streamlink
  ];
xdg.dataFile."streamlink/plugins/twitch.py" = {
    source = ttvlol;
  };
xdg.configFile.streamlink = {
    target = "streamlink/config";
    text = ''
      player=mpv
      default-stream=best
      twitch-disable-ads
      twitch-proxy-playlist=https://lb-na.cdn-perfprod.com,https://eu.luminous.dev,https://eu2.luminous.dev,https://lb-eu.cdn-perfprod.com
      twitch-proxy-playlist-fallback
    '';
  };
}
