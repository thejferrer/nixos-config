{ pkgs, inputs, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
  };
in
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20"
    "googleearth-pro-7.3.6.9796"
  ];
  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    anki
    code-cursor
    imv
    mpv
    ###obs-studio
    obsidian
    pamixer
    pavucontrol
    teams-for-linux
    telegram-desktop
    vesktop

    # Migrating old home.nix
    vivaldi
    pipe-viewer
    spotify
    dolphin-emu
    duckstation
    pcsx2
    bottles
    networkmanagerapplet
    # python310Full
    libgcc
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    yt-dlp
    jq
    ###krita
    libreoffice
    nixd
    unetbootin
    mesa
    meson
    boost
    mediawriter
    osu-lazer-bin
    ###gimp
    keepassxc
    libdrm
    #kdePackages.polkit-kde-agent-1
    ferium
    vscodium
    winetricks
    wineWowPackages.waylandFull
    appimage-run
    qt6.qtwayland
    protontricks
    firefox
    thunderbird
    gtk3
    qbittorrent
    dotnet-runtime_7
    ###astrolog
    # gparted
    # polkit
    # polkit_gnome
    hyprpolkitagent
    nautilus
    nautilus-open-any-terminal
    gnome-disk-utility
    kdePackages.dolphin
    fuse
    hyprutils
    # kdePackages.polkit-qt-1
    # qt6.qtbase
    # qt6.qtsvg
    # qt6.qtwayland
    xfce.thunar
    xfce.thunar-volman
    gvfs
    # aylurs-gtk-shell-git
    # libgtop
    bluez
    bluez-tools
    jetbrains-mono
    # networkmanager
    # dart-sass
    # upower
    ###googleearth-pro
    grim
    slurp
    unstable.waytrogen
    hyprshot
    process-viewer

    # rofi
    # rofi-wayland

    # CLI utils
    bc
    bottom
    brightnessctl
    cliphist
    # ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    grimblast
    htop
    hyprpicker
    ntfs3g
    mediainfo
    microfetch
    playerctl
    ripgrep
    showmethekey
    silicon
    udisks
    ueberzugpp
    unzip
    w3m
    wget
    wl-clipboard
    wtype
    yt-dlp
    zip

    # Coding stuff
    openjdk23
    nodejs
    python311

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    bemoji
    nix-prefetch-scripts

    # TV, music, streaming
    ###stremio
    ###tartube-yt-dlp
    lutris
    p7zip
    #gamma-launcher
  ];
}

