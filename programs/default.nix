{
    pkgs,
    ...
}: {
  imports = [./firefox.nix ./alacritty.nix ./chromium.nix ./dunst.nix ./git.nix ./gtk.nix ./qt.nix ./starship.nix ./xdg.nix ./wlogout.nix ./kdeconnect.nix ];
}
