{

    xdg.configFile."fuzzel/fuzzel.ini".text = ''
font=monospace
prompt=>
icon-theme=Papirus-Dark
icons-enabled=yes
fields=filename,name,generic
fuzzy=yes
show-actions=yes
terminal=$TERMINAL -e  # Note: you cannot actually use environment variables here

lines=10
width=50
horizontal-pad=50
vertical-pad=0
inner-pad=5

image-size-ratio=0.5


layer = top
exit-on-keyboard-focus-loss = yes

[colors]
background=1e1e2ed7
text=cdd6f486
match=cb4b16ff
selection=585B70dd
selection-text=b4befedd
border=b4befedd

[border]
width=3
radius=10

[dmenu]
mode=text  # text|index
exit-immediately-if-empty=no

[key-bindings]
# cancel=Escape Control+g
# execute=Return KP_Enter Control+y
#  execute-or-next=Tab
#  cursor-left=Left Control+b
#  cursor-left-word=Control+Left Mod1+b
#  cursor-right=Right Control+f
#  cursor-right-word=Control+Right Mod1+f
#  cursor-home=Home Control+a
#  cursor-end=End Control+e
#  delete-prev=BackSpace
#  delete-prev-word=Mod1+BackSpace Control+BackSpace
#  delete-next=Delete
#  delete-next-word=Mod1+d Control+Delete
#  delete-line=Control+k
#  prev=Up Control+p
# prev-with-wrap=ISO_Left_Tab
#  prev-page=PageUp KP_PageUp
#  next=Down Control+n
#  next-with-wrap=none
#  next-page=Page_Down KP_Page_Down

# custom-N: *dmenu mode only*. Like execute, but with a non-zero
# exit-code; custom-1 exits with code 10, custom-2 with 11, custom-3
# with 12, and so on.

# custom-1=Mod1+1
# custom-2=Mod1+2
# custom-3=Mod1+3
# custom-4=Mod1+4
# custom-5=Mod1+5
# custom-6=Mod1+6
# custom-7=Mod1+7
# custom-8=Mod1+8
# custom-9=Mod1+9
# custom-10=Mod1+0
# custom-11=Mod1+exclam
# custom-12=Mod1+at
# custom-13=Mod1+numbersign
# custom-14=Mod1+dollar
# custom-15=Mod1+percent
# custom-16=Mod1+dead_circumflex
# custom-17=Mod1+ampersand
# custom-18=Mod1+asterix
# custom-19=Mod1+parentleft


    '';
}
