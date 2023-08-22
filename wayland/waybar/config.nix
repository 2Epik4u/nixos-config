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
        "network"
        "cpu"
        "memory"
        "custom/power"
        "clock"
    ];

    # module settings
    pulseaudio = let
        pavucontrol = "${pkgs.pavucontrol}" + "/bin/pavucontrol";
    in {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-muted = "";
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
    network = {
        format-wifi = "({signalStrength}%)";
        format-ethernet = "";
        format-disconnected = "";
    };
    cpu = {
        format = "{usage}% ";
    };
    memory = {
        interval = 30;
        format = "{}% ";
    };
    "custom/power" = let
        wlogout = "${pkgs.wlogout}" + "/bin/wlogout";
    in {
        format = "";
        on-click = "${wlogout}";
    };
    clock = {
        format = "{: %I:%M %p}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };
    "wlr/workspaces" = let
        hyprctl = config.wayland.windowManager.hyprland.package + "/bin/hyprctl";
    in {
        on-click = "activate";
        format = "{icon}";
        on-scroll-up = "${hyprctl} dispatch workspace e+1";
        on-scroll-down = "${hyprctl} dispatch workspace e-1";
    };

    "hyprland/window" = {
        max-length = 200;
        seperate-outputs = true;
    };
    };
};
}
