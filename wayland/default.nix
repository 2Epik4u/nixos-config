{
    pkgs,
    inputs,
    ...
}: {
  imports = [./hyprland ./waybar ./fuzzel.nix ./swayidle.nix ];


home.packages = with pkgs; [
    fuzzel
    wineWowPackages.wayland
    swaybg
];
}
