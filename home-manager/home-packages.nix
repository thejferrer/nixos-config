{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20"
  ];

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    anki
    code-cursor
    imv
    mpv
    obs-studio
    obsidian
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
    networkmanagerapplet
    # python310Full
    libgcc
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    yt-dlp
    jq
    libreoffice
    nixd
    unetbootin
    meson
    boost
    mediawriter
    osu-lazer-bin
    gimp
    keepassxc
    libdrm
    kdePackages.polkit-kde-agent-1
    ferium
    vscodium
    winetricks
    wineWowPackages.waylandFull
    appimage-run
    qt6.qtwayland
    protontricks
    firefox
    thunderbird
    # kdePackages.dolphin
    gtk3
    qbittorrent
    dotnet-runtime_7

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
  ];
}
