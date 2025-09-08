{ inputs, pkgs, ... }: {
  services.foundryvtt = {
    enable = true;
    hostName = "thomash";
    minifyStaticFiles = true;
    package = inputs.foundryvtt.packages.${pkgs.system}.foundryvtt_latest;
    port = 30001;
    proxyPort = 443;
    proxySSL = true;
    upnp = true;
    # dataDir = "./FoundryVTT";
  };

  networking.firewall.allowedTCPPorts = [
    30001
  ];
}