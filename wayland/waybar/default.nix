{
    pkgs,
    config,
    ...
}: {
    imports = [./config.nix ./style.nix];
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd.enable = true;
    };
}
