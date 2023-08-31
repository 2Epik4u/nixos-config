{
  config,
  pkgs,
  ...
}: {
 programs.waybar.settings = {
 mainBar = {
    layer = "top"; # Waybar at top layer
    position = "top"; # Waybar position (top|bottom|left|right)
    height = 30; # Waybar height (to be removed for auto height)
    spacing = 4; # Gaps between modules (4px)

    # Choose the order of the modules
    modules-left = [
        "wlr/workspaces"
    ];

    modules-center = [
        "hyprland/window"
    ];

    modules-right = [
        "pulseaudio"
        "cpu"
        "memory"
        "clock"
        "tray"
        "custom/power"
    ];

    # module settings
    pulseaudio = let
        pavucontrol = "${pkgs.pavucontrol}" + "/bin/pavucontrol";
    in {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}%";
        format-muted = "";
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
                ""
                ""
            ];
        };
        scroll-setup = 1;
        on-click = "${pavucontrol}";
    };
    battery = {
        interval = 20;
        states = {
            warning = 30;
            critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-icons =
        [""
        " "
        ""
        ""
        ""];
        max-length = 25;

    };
    cpu = {
        format = " {usage}%";
    };
    memory = {
        interval = 30;
        format = " {}%";
    };
    "custom/power" =  {
        format = "";
        on-click = "${pkgs.wlogout}/bin/wlogout -p layer-shell";
        tooltip = false;
    };
    clock = {
        format = "{:%I:%M %p}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%I:%M %p %m/%d/%Y}";
    };
    "wlr/workspaces" = let
        hyprctl = config.wayland.windowManager.hyprland.package + "/bin/hyprctl";
    in {
        on-click = "activate";
        format = "{icon}";
        on-scroll-up = "${hyprctl} dispatch workspace e+1";
        on-scroll-down = "${hyprctl} dispatch workspace e-1";
    };
    tray = {
        icon-size = 15;
        spacing = 10;
    };
    "hyprland/window" = {
        max-length = 200;
        seperate-outputs = true;
    };
    };
};
}
