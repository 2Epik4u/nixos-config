{
    config,
    pkgs,
    ...
}: let
   pointer = config.home.pointerCursor;
in {
  wayland.windowManager.hyprland.extraConfig = ''
    $mod = SUPER
    $modshift = SUPERSHIFT
    $modalt = ALT

    # binds

    bind = $mod, backspace,killactive,

    # from https://github.com/fufexan/dotfiles/blob/5f00d66445c353f94dad1460c8f2a61ff7aac56d/home/wayland/hyprland/config.nix#L225
    # note, if screenshots folder doesn't exist it will not save
    $screenshotarea = hyprctl keyword animation "fadeOut,0,0,default"; grimblast --notify --cursor copysave area ${config.xdg.userDirs.pictures}/Screenshots/$(date +%F_%I:%M ).png; hyprctl keyword animation "fadeOut,1,4,default"
    bind = $modshift,S,exec,$screenshotarea
    bind = $mod,C,exec,grimblast --notify --cursor copysave active ${config.xdg.userDirs.pictures}/Screenshots/$(date +%F_%I:%M ).png

    bindm = $mod,mouse:272,movewindow
    bindm = $mod,mouse:273,resizewindow
    bind = $mod,F,fullscreen,0
    bind = $mod,RETURN,exec,alacritty
    bind = $mod,TAB,exec,nemo
    bind = $mod,P,pseudo,
    bind = $mod,V,togglefloating,
    bind = $mod,SPACE,exec,fuzzel
    bind = $mod,a,movefocus,l
    bind = $mod,d,movefocus,r
    bind = $mod,w,movefocus,u
    bind = $mod,s,movefocus,d
    bind = $mod,period,exec,emote

    xwayland {
      force_zero_scaling = true
    }

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
    exec-once = hyprctl setcursor ${pointer.name} ${toString pointer.size}
    exec-once = swaybg -o '*' -i ${config.home.homeDirectory}/wall/space.png -m fill
    exec-once = ${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1
    exec-once = ${pkgs.emote}/bin/emote

    # windowrules
    windowrulev2 = opacity 0.8 0.8,class:^(Alacritty)$

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
        col.active_border = rgb(89b4fa) rgb(cba6f7) 270deg
        col.group_border_active = rgba(88888888)
        col.group_border = rgba(00000088)

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
        disable_hyprland_logo = true
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
