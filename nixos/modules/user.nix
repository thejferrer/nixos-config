{ pkgs, user, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "dialout"
        "root"
        "vboxusers"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
      ];
    };
  };

  services.getty.autologinUser = user;
}
