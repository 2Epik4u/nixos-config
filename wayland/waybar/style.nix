{
programs.waybar.style = ''

* {
  font-family:"Lexend", Roboto,  Material Symbols Outlined, sans-serif;
}


window#waybar {
    background-color: rgba(0, 0, 0, 0.2);
}

window#waybar.hidden {
    opacity: 0.2;
}

/*
window#waybar.empty {
    background-color: transparent;
}
window#waybar.solo {
    background-color: #FFFFFF;
}
*/
.button {
  background: rgba(255, 255, 255, .2);
  border-radius: 100%;
  padding: .3rem .5rem; /* general for icons */
}
.button:hover {
    background: rgba(255, 255, 255, .25);
  }

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: rgba(255, 255, 255, .25);
}

#workspaces button {
    padding: 0 5px;
    background-color: transparent;
    color: #ffffff;
}



#workspaces button.urgent {
    background-color: #eb4d4b;
}

#mode {
    background-color: #64727D;
    border-bottom: 3px solid #ffffff;
}

#clock,
#battery,
#cpu {
    color: #b4befe;
}
#memory,
#disk,
#temperature,
#backlight,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#mpd {
    padding: 0 10px;
    color: #ffffff;
}

#window,
#workspaces {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
    color: #ffffff;

}

#battery {
    color: #a6e3a1;
}

#battery.charging, #battery.plugged {
    color: #26A65B;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
    background-color: #000000;
}
#power {
    color: #f38ba8;
}
#cpu {
    color: #94e2d5;
}

#memory {
    color: #a6e3a1;
}

#disk {
    color: #964B00;
}

#backlight {
    color: #90b1b1;
}


#pulseaudio {
    color: #b4befe;
}

#pulseaudio.muted {
    color: #2a5c45;
}

#wireplumber {
    color: #000000;
}

#wireplumber.muted {
    background-color: #f53c3c;
}

#custom-media {
    color: #2a5c45;
    min-width: 100px;
}

#custom-media.custom-spotify {
    color: #66cc99;
}

#custom-media.custom-vlc {
    color: #ffa000;
}

#temperature {
    color: #f0932b;
}

#temperature.critical {
    color: #eb4d4b;
}

#tray {
    color: #2980b9;
}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    color: #eb4d4b;
}

#idle_inhibitor {
    color: #2d3436;
}

#idle_inhibitor.activated {
    color: #2d3436;
}

#mpd {
    color: #2a5c45;
}

#mpd.disconnected {
   color: #f53c3c;
}

#mpd.stopped {
    color: #90b1b1;
}

#mpd.paused {
    color: #51a37a;
}

#language {
    color: #740864;
    padding: 0 5px;
    margin: 0 5px;
    min-width: 16px;
}

#keyboard-state {
    color: #000000;
    padding: 0 0px;
    margin: 0 5px;
    min-width: 16px;
}

#keyboard-state > label {
    padding: 0 5px;
}

#keyboard-state > label.locked {
/*     color: rgba(0, 0, 0, 0.2); */
}

'';
}
