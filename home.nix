{ config, pkgs, ... }:

{
  imports = [
    ./binds.nix
  ];
  # Packages that should be installed to the user profile.
  home.packages = [                               
    pkgs.btop
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

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
  };
  # home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 25;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
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

  programs.wofi = {
    enable = true;
  };

  services.gpg-agent = {                          


    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}

