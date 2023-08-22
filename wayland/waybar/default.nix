{
    pkgs,
    config,
    ...
}: {
    imports = [./config.nix ./style.nix];
    home.packages = with pkgs; [
        wlogout
    ];
    programs.waybar = {
        enable = true;
        package = pkgs.waybar-hyprland;
    };
}
