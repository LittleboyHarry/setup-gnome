#!/bin/bash
dconf load /org/gnome/shell/extensions/dash-to-dock/ <<END
[/]
dock-fixed=true
extend-height=true
dash-max-icon-size=56
dock-position='RIGHT'
END
dconf reset /org/gnome/shell/extensions/dash-to-dock/background-opacity
dconf write /org/gnome/shell/extensions/ding/start-corner "'top-left'"
dconf write /org/gnome/desktop/wm/preferences/button-layout "'close,minimize,maximize:appmenu'"
