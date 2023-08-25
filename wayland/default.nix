{
    pkgs,
    inputs,
    ...
}: {
  imports = [./hyprland ./waybar ./fuzzel.nix ./swayidle.nix ];
  # Enable wayland on Chromium
nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";


home.packages = with pkgs; [
    fuzzel
    wineWowPackages.wayland
    swaybg
];
}
