{
    pkgs,
    inputs,
    ...
}: {
  imports = [./hyprland ./fuzzel.nix ./swayidle.nix ];


home.packages = with pkgs; [
    fuzzel
    wineWowPackages.wayland
    swaybg
];
}
