 {
  pkgs,
  ...
}: {  
  home.packages = with pkgs; [
    git-credential-manager
];
   programs.git = {
    enable = true; 
    userName = "2Epik4u";
    userEmail = "justinabossmlg@gmail.com";
  };   
 }

