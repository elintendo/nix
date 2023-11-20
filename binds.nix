{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      bind = [
        # ",Print, exec, ${grimblast} --notify copysave area"
        # "$mod ALT, L, exec, swaylock"
        ",Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
        "$mod, M, exit"
        "$mod, B, exec, pkill -SIGUSR1 waybar" # toggle waybar
        "$mod, Return, exec, kitty"
        "$mod, B, exec, google-chrome-stable"
        "$mod, F, fullscreen"
        "$mod ALT, F, fakefullscreen"
        "$mod, Y, pin"
        "$mod, V, togglefloating"
        "$mod, Q, killactive"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod SHIFT, h, workspace, -1"
        "$mod SHIFT, l, workspace, +1"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "ALT, Tab, focuscurrentorlast"

        "$mod, R, exec, pkill rofi || rofi -show drun"
        # "$mod, S, exec, pkill rofi || rofi -show window"
        # "$mod, C, exec, pkill rofi || rofi -show calc"
        # "$mod, E, exec, pkill rofi || rofi -show emoji"

        # ",XF86AudioPlay,exec,${playerctl} play-pause"
        # ",XF86AudioNext,exec,${playerctl} next"
        # ",XF86AudioPrev,exec,${playerctl} previous"

        # ",KP_End, exec, firefox"
        # ",KP_Home, exec, pkill rofi || rofi-rbw"
        # ",KP_Up, exec, pkill rofi || rofi-vpn"
        # ",KP_Prior, exec, pkill rofi || rofi-bluetooth"
        # ",KP_Left, exec, pkill rofi || rofi -show emoji"
      ];

      binde = [
        ",XF86MonBrightnessDown,exec,brightnessctl set 10%-"
        ",XF86MonBrightnessUp,exec,brightnessctl set +10%"
        ",XF86AudioMute,exec,pamixer -t"
        ",XF86AudioLowerVolume,exec,pamixer -d 10"
        ",XF86AudioRaiseVolume,exec,pamixer -i 10"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

}
