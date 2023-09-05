{
    pkgs,
    ...
}:
{

    home.packages = with pkgs; [
      (xfce.thunar.override {
        thunarPlugins = [
          pkgs.xfce.thunar-archive-plugin
          pkgs.xfce.thunar-volman
          pkgs.xfce.xfconf
          pkgs.xfce.tumbler
          pkgs.xfce.exo
        ];
      })
      gnome3.file-roller
    ];
    home.file = {
      ".config/xfce4/helpers.rc".text = ''
        TerminalEmulator=alacritty
      '';
    };
}
