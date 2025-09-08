{ pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/modules
  ];

  # HyprPanel WIP
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     # Your overlay definitions here
  #     my-custom-package = prev.some-package.overrideAttrs (oldAttrs: {
  #       branch = "master";
  #       src = final.fetchFromGitHub {
  #         owner = "Jas-SinghFSU";
  #         repo = "HyprPanel";
  #       };
  #     });
  #   })
  #   # You can add more overlays to this list
  # ];

  environment.systemPackages = [ pkgs.home-manager ];

  xdg.mime.enable = true;
  #xdg.mimeApps.enable = true;
  xdg.portal.enable = true;

  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;
  security.polkit.enable = true;
  # security.hyprpolkitagent.enable = true;
  services.udisks2.enable = true;

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}

