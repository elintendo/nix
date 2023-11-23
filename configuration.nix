# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "hyperion"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Set up adequate TTY font
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
  boot.initrd.kernelModules = [ "i915" ];

  environment.etc = {
    "xdg/user-dirs.defaults".text = ''
      DESKTOP=$HOME/bin
      DOWNLOAD=$HOME/bin
      TEMPLATES=$HOME/bin
      PUBLICSHARE=$HOME/bin
      DOCUMENTS=$HOME/bin
      MUSIC=$HOME/bin
      PICTURES=$HOME/bin
      VIDEOS=$HOME/bin
    '';
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the Pantheon Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.pantheon.enable = true;

  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.displayManager.gdm.enable = true;

  # services.xserver.windowManager.i3.enable = true;

  # Configure keymap in X11
  #services.xserver = {
  #  layout = "us, ru";
  #  xkbVariant = "";
  #  xkbOptions = "grp:win_space_toggle";
  #};

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  #services.xserver.autoRepeatDelay = 210;
  #services.xserver.autoRepeatInterval = 40;

  programs.hyprland.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.fish.enable = true;

  programs.java = { enable = true; package = pkgs.jetbrains.jdk; };

  programs.xwayland.enable = true;

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    corefonts
    vistafonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    dina-font
    proggyfonts
  ];
  
  security.sudo.wheelNeedsPassword = false;
  users.users.fly = {
    isNormalUser = true;
    description = "fly";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      # screenshot
      # libnotify
      # jq
      grim
      slurp
      swappy
      wl-clipboard
      dunst

      nodejs
      
      telegram-desktop
      fish
      kitty
      git
      google-chrome
      helix
      qbittorrent
      pavucontrol

      gcc_multi
      gnumake
      go
      gopls
      racket

      wlr-randr

      libarchive
      # vscode

      pamixer
      brightnessctl

      #maven
      ghidra-bin
      #openjdk19

      #woeusb
      #ntfs3g
      #thunderbird

          
      (python310.withPackages (p:
        with p; [
          pandas
          matplotlib
          ipython
          requests
          numpy
          scikit-learn
          pygtrie
          tqdm
          scipy
          spacy
          notebook
          jupyter
          pip
          nltk
      ]))

    ];
  };
    

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
