{pkgs, ...}: let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in {
  # screen idle
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 330;
        command = suspendScript.outPath;
      }
    ];
  };
}
