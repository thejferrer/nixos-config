{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.enableXdgAutostart = true;
    xwayland.enable = true;
    # xwayland.force_zero_scaling = true; - DEPRECATED
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "QT_QPA_PLATFORM, wayland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "XDG_PICTURES_DIR, $HOME/Pictures/"
        "XDG_SCREENSHOTS_DIR, $HOME/Pictures"
        "HYPRSHOT_DIR, $HOME/Pictures"
      ];

      monitor = [
        ",preferred,auto,1"
        #",3840x2160@60,auto,1"
        #",2560x1440@60,auto,1"
        #",4096x2160@60,auto,1.6"
        #",1920x1080@60,auto,1"
        #"HDMI-A-1, 1920x1080@60, -1920x0, 1"
        #"DP-3, 1920x1080@60, 0x0, 1"
      ];

      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      # "$fileManager" = "nautilus";
      # "$fileManager" = "$terminal -e sh -c 'ranger'";
      "$fileManager" = "thunar";
      "$menu" = "wofi";

      exec-once = [
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "systemctl --user start hyprpolkitagent"
        "obsidian"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;

        "col.active_border" = "rgba(d65d0eff) rgba(98971aff) 45deg";
        "col.inactive_border" = "rgba(3c3836ff)";

        # resize_on_border = true;

        # allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 0.8;
        inactive_opacity = 0.8;
        fullscreen_opacity = 0.8;

        shadow = {
          enabled = true;
          range = 15;
          render_power = 3;
          offset = "0, 0";
          color = "rgba(008080ff)";
          color_inactive = "rgba(808080ff)";
        };

        blur = {
          enabled = true;
          size = 8;
          passes = 2;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 3, default"
          "fade, 1, 2, default"
          "workspaces, 1, 1, default"
        ];
      };

      input = {
        kb_layout = "us,ru,il";
        kb_options = "grp:caps_toggle";
        accel_profile = "flat";
        numlock_by_default = true;
      };

      gestures = {
        workspace_swipe = true;
        # workspace_swipe_invert = false;
        # workspace_swipe_forever	= true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        smart_split = true;
      };

      master = {
        new_status = "master";
        # new_on_top = true;
        # mfact = 0.5;
      };

      misc = {
        # force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        background_color = "0x24273a";
      };

      windowrulev2 = [
        "bordersize 0, floating:0, onworkspace:w[t1]"

        "float,class:(mpv)|(imv)|(showmethekey-gtk)"
        "move 990 60,size 900 170,pin,noinitialfocus,class:(showmethekey-gtk)"
        "noborder,nofocus,class:(showmethekey-gtk)"

        "opacity 1.0 override, class:(vivaldi)"
        "opacity 1.0 override, class:(obsidian)"
        "opacity 1.0 override, class:(mpv)"
        "opacity 1.0 override, class:(osu-lazer)"
        "opacity 1.0 override, class:(protontricks)"
        "opacity 1.0 override, class:(steam)"
        "opacity 1.0 override, class:(stremio)"
        "opacity 1.0 override, class:(lutris)"
        "opacity 1.0 override, class:(duckstation)"
        "opacity 1.0 override, class:(pcsx2)"
        "opacity 1.0 override, class:(dolphin-emu)"
        "opacity 1.0 override, class:(bottles)"
        "opacity 1.0 override, workspace:6"

        


        # "workspace 3,class:(obsidian)"
        # "workspace 3,class:(zathura)"
        # "workspace 4,class:(com.obsproject.Studio)"
        # "workspace 5,class:(telegram)"
        # "workspace 5,class:(vesktop)"
        # "workspace 6,class:(teams-for-linux)"

        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
        "nofocus, class:^(xwaylandvideobridge)$"
      ];

      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
        #"w[tv1], gapsout:0, gapsin:0"
        #"f[1], gapsout:0, gapsin:0"
      ];
    };
  };
}
