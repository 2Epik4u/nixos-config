 {
  pkgs,
  ...
}: {  
  # notification daemon
  # from https://github.com/fufexan/dotfiles/blob/main/home/programs/dunst.nix
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        alignment = "center";
        corner_radius = 15;
        follow = "mouse";
        font = "Roboto 10";
        format = "<b>%s</b>\\n%b";
        frame_width = 2;
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


      urgency_critical = {
        background = "900000";
        foreground =  "#ffffff";
        frame_color = "#f38ba8";
      };
      urgency_low = {
        background = "900000";
        foreground = "#888888";
        frame_color = "#89b4fa";
      };
      urgency_normal = {
        background = "900000";
        foreground = "#ffffff";
        frame_color = "#b4befe";
      };
    };
  };
 }
