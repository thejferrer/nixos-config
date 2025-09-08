{ lib, ... }:
# nixos-config-reborn original waybar config
{
  programs.waybar = {
    enable = true;
    
    style = lib.mkAfter ''
    * {
      border: none;
      border-radius: 0px;
      font-family: "JetBrains Mono";
      font-weight: bold;
      font-size: 16px;
      min-height: 0;
    }
    #workspaces button label{
      padding: 0 10px;
    }
    #clock, #battery, #pulseaudio, #tray, #language, #weather {
      padding: 0 10px;
      margin: 0 10px;
    }
    #language {
      margin: 0;
      border-bottom: 5px solid;
    }
    #custom-weather {
      margin: 0;
      border-bottom: 5px solid;
    }

    #pulseaudio {
      margin: 0;
      border-bottom: 5px solid;
    }

    #pulseaudio.muted {
      padding: 0 20px;
      border-bottom: 5px solid;
    }

    #battery {
      margin: 0;
      border-bottom: 5px solid;
    }

    #clock {
      margin: 0;
      border-bottom: 5px solid;
    }

    #tray {
      margin: 0;
      border-bottom: 5px solid;
    }

    '';
    
    # style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["hyprland/language" "custom/weather" "pulseaudio" "battery" "clock" "tray"];
        "hyprland/workspaces" = {
          # on-click = "focus";
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "magic" = "";
          };

          persistent-workspaces = {
            "*" = [1 2 3 4 5 6 7 8];
            # "DP-3" = 8;
            # "HDMI-A-1" = [1 2 3 4 5 6 7 8];
          };
        };

        "hyprland/language" = {
          format-en = "🇺🇸";
          format-ru = "🇷🇺";
          format-he = "🇮🇱";
          min-length = 5;
          tooltip = false;
        };

        "custom/weather" = {
          format = " {} ";
          exec = "curl -s 'wttr.in/Providence?format=%c%t'";
          interval = 300;
          class = "weather";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 1;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };

        "clock" = {
          format = "{:%m.%d.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };
}
