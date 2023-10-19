# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      # pipewire package
      inputs.nix-gaming.nixosModules.pipewireLowLatency
    ];
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
[

    # sorta essential
    alacritty

    mate.mate-polkit
    zsh
    vim
    efibootmgr
    git
    gnome.gnome-keyring
    unzip
    wget
    # everything else
    libsForQt5.plasma-systemmonitor
    mpv
    neofetch
    pavucontrol
    gnome.gedit
    starship
    dunst
    keepassxc
    (pkgs.discord.override {
          withVencord = true;
    })
    partition-manager
    keepassxc
    dolphin-emu
    qbittorrent
    krita
    obs-studio
    imv
    libsForQt5.kate
    github-desktop     # idk git cli that much
    emote     # Emoji Picker
    font-manager
    audacity
    appimage-run
    gnome.nautilus
    gradience
    filezilla
    ffmpeg
    ffmpegthumbnailer
    cpu-x
    handbrake
    popsicle # .desktop is called USB for some reason
    prismlauncher
   ];

   programs = {
      zsh.autosuggestions.enable = true;
      partition-manager.enable = true;
      dconf.enable = true;
      hyprland.enable = true;
      zsh.enable = true;
      kdeconnect.enable = true;
      nm-applet.enable = true;
   };
    # List services that you want to enable:
   services = {
      gvfs.enable = true; # Mount, trash, and other functionalities
      flatpak.enable = true;
      blueman.enable = true;
      # Enable the X11 windowing system.
      xserver.enable = true;
      xserver.displayManager.sddm.enable = true;
      # Enable the OpenSSH daemon.
      openssh.enable = true;
      printing.enable = true;
      avahi.enable = true;
      avahi.nssmdns = true;
      # for a WiFi printer
      avahi.openFirewall = true;

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;

      lowLatency = {
        # enable this module
        enable = true;
        # defaults (no need to be set unless modified)
        quantum = 64;
        rate = 48000;
      };
    };

  };


   # fonts
   fonts = {
   fontDir.enable = true;
    packages = with pkgs; [
      material-symbols
      lexend
      twitter-color-emoji
    ];
    fontconfig = {
      defaultFonts = {
        emoji = ["Twitter Color Emoji"];
    };
  };
};

  # Nix settings
   nix.settings.auto-optimise-store = true;
   nix = {
     package = pkgs.nixFlakes;
     extraOptions = ''
    experimental-features = nix-command flakes
  '';
};
  nix.settings = {
    substituters = [
    "https://nix-gaming.cachix.org"
    "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
    "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

   boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
  };

    # run appimages with appimage-run
    boot.binfmt.registrations = lib.genAttrs ["appimage" "AppImage"] (ext: {
      recognitionType = "extension";
      magicOrExtension = ext;
      interpreter = "/run/current-system/sw/bin/appimage-run";
    });

  # vulkan
  hardware = {
    opengl.driSupport = true;
    # For 32 bit applications
    opengl.driSupport32Bit = true;
    # also opengl
    opengl.enable = true;

    bluetooth.enable = true;
  };

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.nameservers = [ "1.1.1.1" ];
  # Set your time zone.
  time = {
    timeZone = "America/New_York";
    hardwareClockInLocalTime = true;
  };


  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };


  # Enable sound.
  sound.enable = true;

  # make pipewire realtime-capable
  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.justin = {
     isNormalUser = true;
     home = "/home/justin";
     extraGroups = [ "wheel" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [

     ];
   };
  # Set shell as well
  users.users.justin.shell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];
   nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5h";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Security polkit
   security.polkit.enable = true;

   xdg.portal = {
     enable = true;
     xdgOpenUsePortal = false;
     extraPortals = [pkgs.xdg-desktop-portal-gtk];
   };


  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion =  "23.11";  #did you read the comment?

}

