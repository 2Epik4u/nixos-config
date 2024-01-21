{

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

};
};
}
