{
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
        normal.family = "JetBrains Mono Nerd Font";
        bold.family = "JetBrains Mono Nerd Font";
        italic.family = "'JetBrains Mono Nerd Font";
        size = 13;
      };
      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";
        };
        normal = {
          black = "#CDD6F4";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
      };
    };
  };
}
