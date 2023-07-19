# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  environment.systemPackages = 
[ 
	pkgs.alacritty pkgs.cinnamon.nemo pkgs.fuzzel pkgs.eww-wayland pkgs.mate.mate-polkit
	pkgs.swaybg pkgs.discord pkgs.keepassxc pkgs.steam pkgs.zsh pkgs.neofetch pkgs.xdg-desktop-portal-gtk
	pkgs.bibata-cursors pkgs.pavucontrol pkgs.gnome.gedit pkgs.starship pkgs.dolphin-emu pkgs.jetbrains-mono
	pkgs.zsh-autosuggestions pkgs.catppuccin-gtk  pkgs.catppuccin-kvantum pkgs.catppuccin-papirus-folders
        pkgs.libsForQt5.qt5ct    pkgs.efibootmgr
 ];
   programs.zsh.autosuggestions.enable = true; 
   services.flatpak.enable = true;
   programs.zsh.enable = true;
   hardware.bluetooth.enable = true;
   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
   qt.platformTheme = "qt5ct";
  # Nix settings
   nix.settings.auto-optimise-store = true;
#  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
   nixpkgs.config.allowUnfree = true;
# required for steam
   programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};
  

#pkgs.catppuccin-gtk.override = {
#  accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes 
#  size = "compact";
#  tweaks = [ "rimless" "black" ]; # You can also specify multiple tweaks here
#  variant = "mocha";
#};
  # Use the systemd EFI boot loader.

   boot.loader.grub.device = "nodev";
   boot.loader.grub.efiSupport = true;
   boot.loader.grub.useOSProber = true;
   boot.loader.efi.canTouchEfiVariables = true;  
   boot.loader.efi.efiSysMountPoint = "/boot"; 
 
   networking.hostName = "justin-nixos"; # Define your hostname.
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
   security.rtkit.enable = true;
   services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
};

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.justin = {
     isNormalUser = true;
     home = "/home/justin";
     extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox

     ];
   };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  # Hyprland 
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fileSystems."/mnt/archlinux" =
	{ device = "/dev/nvme0n1p1";
	  fsType = "ext4";
	};
    
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

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
   
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
   system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

