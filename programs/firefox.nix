{

home.file."firefox-wavefox-theme" = {
      target = ".mozilla/firefox/default/chrome/wavefox";
      source = builtins.fetchTarball {
                url = "https://github.com/QNetITQ/WaveFox/archive/master.tar.gz";
                sha256 = "1kmag8lhhkyw62z4p5vwb14azk681ijckbqzx8ysbbd6izj6dzsn";
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
        };
        userChrome = ''
            @import "wavefox/chrome/userChrome.css";
            '';
};
};
}
