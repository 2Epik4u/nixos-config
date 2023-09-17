{

home.file."firefox-wavefox-theme" = {
      target = ".mozilla/firefox/default/chrome/wavefox";
      source = builtins.fetchTarball {
                url = "https://github.com/QNetITQ/WaveFox/archive/refs/tags/v1.6.118.tar.gz";
                sha256 = "1ldirhs9qjbaiwz70n01m1qydjlhs2w89rl3nyc0q6svb64b8bp4";
                };
};

programs.firefox = {
    enable = true;
    profiles."default" = {
        settings = {
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "layout.css.has-selector.enabled" = true;
                "svg.context-properties.content.enabled" = true;
                "userChrome.Tabs.Option8.Enabled" = true;
                "dom.events.asyncClipboard.readText" = true;
        };
        userChrome = ''
            @import "wavefox/chrome/userChrome.css";
            '';
};
};
}
