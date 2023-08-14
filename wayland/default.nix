{
    pkgs,
    inputs,
    ...
}: {
  imports = [./hyprland ./fuzzel.nix];


home.packages = with pkgs; [
    fuzzel
    wineWowPackages.wayland
    swaybg
];
}
