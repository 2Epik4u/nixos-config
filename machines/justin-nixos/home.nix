{ config, pkgs, inputs, ... }:
  # for machine specific home manager configs
{
  imports = [
      # import the global one
        ./../../home.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "justin";
  home.homeDirectory = "/home/justin";
  # pc monitor config
  wayland.windowManager.hyprland.extraConfig = ''
            monitor=DP-3,1920x1080@144,0x0,1
            monitor=HDMI-A-1,1920x1080, 1920x0, 1
            monitor=DP-1,1366x768,3840x0,1
    '';
  # This value determines the Home Manager release that your configuration isg
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfreePredicate = _: true;
  home.packages = with pkgs; [
    # games / game related
    steam
    protontricks
    inputs.linuxmobile.packages.${pkgs.system}.xwaylandvideobridge
    gamescope
    grapejuice
    lutris
    wineWowPackages.waylandFull
    inputs.toonmux.packages.${pkgs.system}.toonmux
  ];
  # weird fix till cursor is fixed

  xdg.desktopEntries = {
    grapejuice = {
        type = "Application";
        name = "Roblox App Wayland";
        icon = "grapejuice-roblox-player";
        exec = "${pkgs.gamescope}/bin/gamescope -W 1920 -H 1080 -w 1920 -h 1080 --adaptive-sync --immediate-flips --force-windows-fullscreen --force-grab-cursor -f -- ${pkgs.grapejuice}/bin/grapejuice app";
        categories = [ "Game" ];
    };
  };
  xdg.desktopEntries = {
    toonmux = {
        type = "Application";
        name = "toonmux";
        icon = "toontown-rewritten";
        exec = "${inputs.toonmux.packages.${pkgs.system}.toonmux}/bin/toonmux";
        categories = [ "Game" ];
    };
  };

  programs.chromium = {
    enable = false;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/justin/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
