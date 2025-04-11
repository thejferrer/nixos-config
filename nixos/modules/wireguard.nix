{ pkgs, ... }: {
  networking.wg-quick.interfaces = let
    server_ip = "146.70.189.2";
  in {
    wg0 = {
      # IP address of this machine in the *tunnel network*
      address = [
        "10.64.235.252/32"
        "fc00:bbbb:bbbb:bb01::1:ebfb/128"
      ];

      # To match firewall allowedUDPPorts (without this wg
      # uses random port numbers).
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/mullvad-vpn.key";

      peers = [{
        publicKey = "lHrukA9+vn7Jjzx2Nb/1NQ0WiaiKppEqVxrGT5X1RFQ=";
        allowedIPs = [ "0.0.0.0/0" ];
        endpoint = "${server_ip}:51820";
        persistentKeepalive = 25;
      }];

      postUp = ''
        # Mark packets on the wg0 interface
        wg set wg0 fwmark 51820
      
        # Forbid anything else which doesn't go through wireguard VPN on
        # ipV4 and ipV6
        ${pkgs.iptables}/bin/iptables -A OUTPUT \
          ! -d 192.168.0.0/16 \
          ! -o wg0 \
          -m mark ! --mark $(wg show wg0 fwmark) \
          -m addrtype ! --dst-type LOCAL \
          -j REJECT
        ${pkgs.iptables}/bin/ip6tables -A OUTPUT \
          ! -o wg0 \
          -m mark ! --mark $(wg show wg0 fwmark) \
          -m addrtype ! --dst-type LOCAL \
          -j REJECT
          # Allow deluge web gui
        ${pkgs.iptables}/bin/iptables -I OUTPUT -o lo -p tcp \
            --dport 8096 -m state --state NEW,ESTABLISHED -j ACCEPT
            # Allow deluge web gui
        ${pkgs.iptables}/bin/iptables -I OUTPUT -o lo -p tcp \
            --dport 8920 -m state --state NEW,ESTABLISHED -j ACCEPT
      '';

      postDown = ''
        ${pkgs.iptables}/bin/iptables -D OUTPUT \
          ! -o wg0 \
          -m mark ! --mark $(wg show wg0 fwmark) \
          -m addrtype ! --dst-type LOCAL \
          -j REJECT
        ${pkgs.iptables}/bin/ip6tables -D OUTPUT \
          ! -o wg0 -m mark \
          ! --mark $(wg show wg0 fwmark) \
          -m addrtype ! --dst-type LOCAL \
          -j REJECT
          # Allow deluge web gui
        ${pkgs.iptables}/bin/iptables -I OUTPUT -o lo -p tcp \
          --dport 8096 -m state --state NEW,ESTABLISHED -j ACCEPT
        # Allow deluge web gui
        ${pkgs.iptables}/bin/iptables -I OUTPUT -o lo -p tcp \
            --dport 8920 -m state --state NEW,ESTABLISHED -j ACCEPT
      '';

      
    };
  };
}