{
    inputs,
    pkgs,
    ...
}: {
  imports = [./config.nix];
  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
];
  wayland.windowManager.hyprland.enable = true;
}
