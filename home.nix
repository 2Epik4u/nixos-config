{ config, pkgs, inputs, ... }:
  
{
  imports = [];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "justin";
  home.homeDirectory = "/home/justin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
#  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfreePredicate = _: true; 
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    
    keepassxc  dolphin-emu qbittorrent krita inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge 
    libsForQt5.kwalletmanager wineWowPackages.waylandFull lutris steam imv protontricks
      # credits: yavko
      # catppuccin theme for qt-apps
      qt5.qttools
      libsForQt5.qt5ct
      qt6Packages.qt6ct
      lightly-qt	

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

 # set theme 
  gtk = {
    enable = true;

    font = {
      name = "Roboto";
      package = pkgs.roboto;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        size = "compact";
        variant = "mocha";
      };
    };
  };
  
 # set cursor
   home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };


    xdg.configFile."kdeglobals".source = "${(pkgs.catppuccin-kde.override {
      flavour = ["mocha"];
      accents = ["blue"];
      winDecStyles = ["modern"];
    })}/share/color-schemes/CatppuccinMochaBlue.colors";
    qt = {
      enable = true;
      # platformTheme = "gtk"; # just an override for QT_QPA_PLATFORMTHEME, takes "gtk" or "gnome"
      style = {
        package = pkgs.catppuccin-kde;
        name = "Catpuccin-Mocha-Dark";
      };
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
  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    NIXPKGS_ALLOW_UNFREE = "1";
     #QT_STYLE_OVERRIDE = "Lightly";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      DISABLE_QT5_COMPAT = "0";
      CALIBRE_USE_DARK_PALETTE = "1";
  };

# programs  

   programs.git = {
    enable = true; 
    userName = "Justin";
    userEmail = "justinabossmlg@gmail.com";
  };   


  programs.alacritty = {
    enable = true;
    settings = {
      window = {
      opacity = 0.7;
      decorations = "none";
      padding = {
        x = 24;
        y = 24;
      };
    };
      scrolling = {
          history = 1000;
          multiplier = 3;
    };
    font = {
        normal.family = "JetBrains Mono Nerd Font ";
        bold.family = "JetBrains Mono Nerd Font";
        italic.family = "'JetBrains Mono Nerd Font";
        size = 13;
    };
    color = {
        primary = {
            background = "#1E1E2E";
            foreground = "#CDD6F4";
	    dim_foreground = "#CDD6F4";
	    bright_foreground = "#CDD6F4";
        };
        normal = {
          black = "#CDD6F4";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan =  "#94E2D5";
          white = "#BAC2DE";
        };
    };
   };
};
  
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };

  # notification daemon
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        alignment = "center";
        corner_radius = 20;
        follow = "mouse";
        font = "Roboto 10";
        format = "<b>%s</b>\\n%b";
        frame_width = 1;
        offset = "5x5";
        horizontal_padding = 8;
        icon_position = "left";
        indicate_hidden = "yes";
        markup = "yes";
        max_icon_size = 64;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
        padding = 8;
        plain_text = "no";
        separator_color = "auto";
        separator_height = 1;
        show_indicators = false;
        shrink = "no";
        word_wrap = "yes";
      };

      fullscreen_delay_everything = {fullscreen = "delay";};

      urgency_critical = {
        background = "900000";
        foreground =  "#ffffff";
        frame_color = "#ff0000";
      };
      urgency_low = {
        background = "222222";
        foreground = "#888888";
#     frame_color = default.xcolors.blue;
      };
      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#ffffff";
#     frame_color = default.xcolors.green;
      };
    };
  };
  
                                           
                 
            
                                  
						      
home.stateVersion = builtins.trace (builtins.attrNames inputs) "23.05";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true; 
}
