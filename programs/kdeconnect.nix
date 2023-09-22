{pkgs, ...}: {
  # KDEConnect user service
  # https://github.com/fufexan/dotfiles/blob/main/home/programs/kdeconnect.nix
  systemd.user.services.kdeconnect = {
    Unit.Description = "KDEConnect Service";
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.kdeconnect}/bin/kdeconnect-indicator";
      TimeoutStopSec = 5;
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
