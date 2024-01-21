{
pkgs,
...
}: {
programs.chromium = {
    package = pkgs.google-chrome.override {
    commandLineArgs =
      [
        # Ungoogled features
        "--disable-search-engine-collection"
        "--extension-mime-request-handling=always-prompt-for-install"
        "--fingerprinting-canvas-image-data-noise"
        "--fingerprinting-canvas-measuretext-noise"
        "--fingerprinting-client-rects-noise"
        "--popups-to-tabs"
        "--show-avatar-button=incognito-and-guest"
        "--no-experiments"

        # wayland
        "--force-dark-mode"
        "--ozone-platform=wayland"
        "--enable-features=UseOzonePlatform"

        # Performance
        "--enable-gpu-rasterization"
        "--enable-oop-rasterization"
        "--enable-zero-copy"
        "--ignore-gpu-blocklist"

        # middle click scroll
        "--enable-blink-features=MiddleClickAutoscroll"

    ];
 };
};
}
