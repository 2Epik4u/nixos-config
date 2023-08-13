{
    pkgs,
    ...
}: {
  imports = [./hyprland];


home.packages = with pkgs; [
    fuzzel
    wineWowPackages.wayland
    swaybg
];
}
