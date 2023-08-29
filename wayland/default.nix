{
    pkgs,
    inputs,
    ...
}: {
  imports = [./hyprland ./waybar ./fuzzel.nix  ];

home.packages = with pkgs; [
    fuzzel
    swaybg
];
}
