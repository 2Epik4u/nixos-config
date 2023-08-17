{
    inputs,
    pkgs,
    ...
}: {
  imports = [./config.nix];
  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
];

  systemd.user.services.swayidle.Install.WantedBy = ["hyprland-session.target"];
  wayland.windowManager.hyprland.enable = true;
}
