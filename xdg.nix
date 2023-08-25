{config, ...}: let
# https://github.com/fufexan/dotfiles/blob/main/home/programs/xdg.nix
  browser = ["chromium-browser.desktop"];
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
    "inode/directory" = ["org.gnome.Nautilus.desktop"];

    "audio/*" = ["mpv.desktop"];
    "video/*" = ["mpv.dekstop"];
    "image/*" = ["imv.desktop"];
    "image/webp" = ["imv.desktop"]; # why
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
