{ config, pkgs, ... }:

{
  services.resolved = {
    enable = true;
    dnsovertls = "true";
    extraConfig = "DNS=1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001";
  };
  systemd.services.zapret = {
    description = "Zapret startup service";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [ "/opt/zapret/init.d/sysv/zapret start" ];
      RemainAfterExit = true;
    };
    wantedBy = [ "default.target" ];
    after = [ "network.target" ]; # optional, if it needs network
  };
  
}
