{
    services.jellyfin = {
        enable = true;
        dataDir = "/var/lib/jellyfin";
        cacheDir = "/var/cache/jellyfin";
        # openFirewall = "0.0.0.0";
        #   ports = {
        #     http = 8096;
        #     https = 8920;
        #   };
        user = "thomash";
        group = "wheel";
    };


    networking.firewall.allowedTCPPorts = [
        8096
    ];
}