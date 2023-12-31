{ config, pkgs, ... }:

{
  imports = [
    ./binds.nix
  ];
  # Packages that should be installed to the user profile.
  home.packages = [                               
    pkgs.btop
  ];

  home.sessionVariables = {
    GOPATH = "$HOME/.go";
  };

  home.stateVersion = "23.05";

  xdg.userDirs = {
    enable = true;
    desktop = "${config.home.homeDirectory}/.void";
    documents = "${config.home.homeDirectory}/.void";
    download = "${config.home.homeDirectory}/.void";
    music ="${config.home.homeDirectory}/.void";
    pictures = "${config.home.homeDirectory}/.void";
    publicShare = "${config.home.homeDirectory}/.void";
    templates = "${config.home.homeDirectory}/.void";
    videos = "${config.home.homeDirectory}/.void";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
    mutableExtensionsDir = true; # for jupyter
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-pyright.pyright
      ms-toolsai.jupyter
    ];
    userSettings = {
      "window.titleBarStyle" = "custom";
      "window.zoomLevel" = 1.8;
      "workbench.startupEditor" = "none";
    };
  };


  programs.git = {
    enable = true;
    userName = "elintendo";
    userEmail = "elintendo@yandex.ru";
  };

  programs.helix = {                              
    enable = true;
    defaultEditor = true;
    settings = {
       theme = "autumn";
    };
  };

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 3;
    };
  };

  programs.fish = {
    enable = true;
    loginShellInit = "";
    interactiveShellInit = ''
      set fish_greeting 
    '';
    shellAliases = {
      b = "cat /sys/class/power_supply/BAT1/capacity";
      g = "git";
      gs = "git status";
      setup = "wlr-randr --output eDP-1 --off --output HDMI-A-1 --scale 1.5";
    };
  };
  # home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 20;
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    settings = {
      misc = {
        force_default_wallpaper = 0;
        disable_splash_rendering = true;
      };
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";
        kb_variant = "";
        kb_model = "";
        kb_rules = "";

        repeat_rate = 25;
        repeat_delay = 200;

        touchpad = {
          natural_scroll = false;
          scroll_factor = "0.7";
        };
      };

      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 0;

        inactive_opacity = 0.92;

        drop_shadow = true;
        shadow_range = 15;
        shadow_render_power = 3;
      };

      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        animation = [
          "windows, 1, 2.5, ease, slide"
          "windowsOut, 1, 2.5, ease, slide"
          "border, 1, 6, default"
          "fade, 1, 3, ease"
          "workspaces, 1, 3, ease"
        ];
      };

      gestures = {
        workspace_swipe = true;
      };

    };
  };

  programs.rofi= {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "JetBrainsMono Nerd Font 12";
    theme = "sidebar";
  };

  services.gpg-agent = {                          


    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}

