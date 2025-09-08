{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    gcc
    kdenlive
    gparted
    # hyprpanel
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];
}
