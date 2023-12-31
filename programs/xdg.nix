{config, ...}: let
  browser = ["firefox.desktop"];
  texteditor = ["org.gnome.gedit.desktop"];
  code = ["org.kde.kate.desktop"];
  # XDG MIME types
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "application/x-shellscript" = code;
    "text/html" = browser;
    "text/plain" = texteditor;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;
    "inode/directory" = ["nemo.desktop"];
    "audio/*" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
    "image/*" = ["imv-dir.desktop"];
    "application/json" = browser;
    "application/pdf" = browser;
    "application/x-kdbx" = ["org.keepassxc.KeePassXC.desktop"];
  };
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;

    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
