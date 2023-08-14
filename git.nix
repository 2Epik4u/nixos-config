{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "2Epik4u";
    userEmail = "justinabossmlg@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
