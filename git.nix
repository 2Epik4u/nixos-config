 {
  pkgs,
  ...
}: {  
   programs.git = {
    enable = true; 
    userName = "Justin";
    userEmail = "justinabossmlg@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };   
 }

