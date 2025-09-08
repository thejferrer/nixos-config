{
  # Wallpaper is configured in ../stylix.nix
  services.hyprpaper = {
    enable = true;
    settings = {
      general = {
        preload = "~/Downloads/Wallpapers/wallhaven-5g3y29.png/";
        wallpaper = "~/Downloads/Wallpapers/wallhaven-5g3y29.png/";
        ipc = "off";
      };
    };
  };
}
