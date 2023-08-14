{
    config,
    pkgs,
    ...
}: let
   pointer = config.home.pointerCursor;
in {
  wayland.windowManager.hyprland.extraConfig = ''
    monitor=,1920x1080@144,0x0,1
    monitor=HDMI-A-1,1920x1080, 1920x0, 1
    $mod = SUPER
    $modshift = SUPERSHIFT
    $modalt = ALT

    # binds

    bind = $mod, backspace,killactive,

    # from https://github.com/fufexan/dotfiles/blob/5f00d66445c353f94dad1460c8f2a61ff7aac56d/home/wayland/hyprland/config.nix#L225
    # note, if screenshots folder doesn't exist it will not save
    $screenshotarea = hyprctl keyword animation "fadeOut,0,0,default"; grimblast --notify --cursor copysave area ${config.home.homeDirectory}/Pictures/screenshots/$(date +%F_%I:%M ).png; hyprctl keyword animation "fadeOut,1,4,default"
    bind = $modshift,S,exec,$screenshotarea
    bind = $mod,C,exec,grimblast --notify --cursor copysave active ${config.home.homeDirectory}/Pictures/screenshots/$(date +%F_%I:%M ).png

    bindm = $mod,mouse:272,movewindow
    bindm = $mod,mouse:273,resizewindow
    bind = $mod,F,fullscreen,0
    bind = $mod,RETURN,exec,alacritty
    bind = $mod,TAB,exec,nemo
    bind = $mod,P,pseudo,
    bind = $mod,V,togglefloating,
    bind = $mod,SPACE,exec,fuzzel
    bind=$mod,a,movefocus,l
    bind=$mod,d,movefocus,r
    bind=$mod,w,movefocus,u
    bind=$mod,s,movefocus,d

    # workspaces
    # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
    ${builtins.concatStringsSep "\n" (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in ''
          bind = $mod, ${ws}, workspace, ${toString (x + 1)}
          bind = $modalt, ${ws}, movetoworkspace, ${toString (x + 1)}
        ''
      )
      10)}



    # executables

    # from https://github.com/fufexan/dotfiles/blob/5f00d66445c353f94dad1460c8f2a61ff7aac56d/home/wayland/hyprland/config.nix#L18
    exec-once = hyprctl setcursor ${pointer.name} ${toString pointer.size}
    exec-once = eww open bar
    exec-once = swaybg -o '*' -i ${config.home.homeDirectory}/wall/leaves.png -m fill
    exec-once = ${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1

    # windowrules
    windowrulev2 = opacity 0.9 0.9,class:^(foot)$
    windowrulev2 = opacity 0.9 0.9,class:^(alacritty)$
    windowrule=float,title:^(Firefox — Sharing Indicator)$
    windowrulev2 = float,title:^(Firefox — Sharing Indicator)$
    windowrule = tile,^(vegas140.exe)
    windowrulev2 = nofullscreenrequest,class:^(org.kde.dolphin)$
    windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
    windowrulev2 = noanim,class:^(xwaylandvideobridge)$
    windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
    windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$



    # everything else (inputs, misc, etc)


    input {
        kb_layout=
        kb_variant=
        kb_model=
        kb_options=
        kb_rules=
        #follow_mouse=0
        #float_switch_override_focus=0

    }
    general {
        sensitivity=1.0 # for mouse cursor
        gaps_in=4
        gaps_out=20
        border_size=3
        col.active_border=0xFF9399B2
        col.inactive_border = rgba(595959aa)

        apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
    }

    decoration {
      rounding=8
      blur {
        enabled = true
        size = 3
        passes = 1
        new_optimizations = true
      }
        drop_shadow=true
        shadow_range=50
    }

    animations {
        enabled = true

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 2, myBezier
        animation = windowsOut, 1, 2, default, popin 10%
        animation = border, 1, 2, default
        animation = fadeIn, 1, 5, default
        animation = workspaces, 1, 2, default
    }

    misc {
        enable_swallow = true
        swallow_regex  = ^(alacritty)$
        vrr=1
    }

    # disable touchpad as mouse for playstation 4/5 controllers
    device:Sony Interactive Entertainment Wireless Controller Touchpad {
        enabled=no
    }
    device:Wireless Controller Touchpad {
        enabled=no
    }



    # ...
  '';
}
