{
    pkgs,
    ...
}: {
  imports = [./firefox.nix ./alacritty.nix ./chrome.nix ./dunst.nix ./git.nix ./gtk.nix ./qt.nix ./starship.nix ./xdg.nix ./wlogout.nix ./kdeconnect.nix ];
}
