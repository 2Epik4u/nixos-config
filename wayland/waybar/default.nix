{
    pkgs,
    config,
    ...
}: {
    imports = [./config.nix ./style.nix];
    programs.waybar = {
        enable = true;
        package = pkgs.waybar-hyprland;
        systemd.enable = true;
    };
}
