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
    lxqt.qps
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
    # idk git cli that much
    github-desktop
    # Emoji Picker
    emote
    font-manager
    audacity
    appimage-run
    gnome.nautilus
    gradience
    filezilla
    ffmpeg
];

   programs.zsh.autosuggestions.enable = true;
   programs.partition-manager.enable = true;
   programs.dconf.enable = true;
   programs.hyprland.enable = true;
   programs.zsh.enable = true;
   services.gvfs.enable = true; # Mount, trash, and other functionalities
   services.flatpak.enable = true;
   services.blueman.enable = true;


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
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;
   boot.loader.efi.efiSysMountPoint = "/boot";

    # run appimages with appimage-run
    boot.binfmt.registrations = lib.genAttrs ["appimage" "AppImage"] (ext: {
      recognitionType = "extension";
      magicOrExtension = ext;
      interpreter = "/run/current-system/sw/bin/appimage-run";
    });

  # vulkan
  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;
  # also opengl
  hardware.opengl.enable = true;

  hardware.bluetooth.enable = true;
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  programs.nm-applet.enable = true;
  networking.nameservers = [ "1.1.1.1" ];
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

   # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.displayManager.sddm.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;


  services.pipewire = {
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

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Security polkit
   security.polkit.enable = true;

   xdg.portal = {
     enable = true;
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

