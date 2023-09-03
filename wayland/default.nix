{
    pkgs,
    inputs,
    ...
}: {
  imports = [./hyprland ./waybar ./fuzzel.nix  ];

home.packages = with pkgs; [
    fuzzel
    swaybg
    wayvnc
];

  # variables
  home.sessionVariables = {
	MOZ_ENABLE_WAYLAND = "1";
	NIXOS_OZONE_WL = "1";
};
}
