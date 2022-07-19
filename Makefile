.ONESHELL:

targets = \
enable-touchpad-tap-to-click\
enable-resize-window-by-superkey-and-rightclk-drag\
restrict-alttab-to-current-app\
show-desktop-when-press-super-d\
show-process-tree-in-system-monitor\
no-redundant-characters-on-search-result\
add-minmaxbtn-to-windowbar\
skip-confirm-before-60s-shutdown-confirm\
optimize-alt-grave-app-switcher-appearance\
show-battery-percentage-weekday-weekindex-in-top-panel\

todo: $(targets)

disabled = \
shutdown-when-pressed-powerbtn\

.PHONY: $(targets) $(disabled)

enable-touchpad-tap-to-click:
	gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

enable-resize-window-by-superkey-and-rightclk-drag:
	gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

shutdown-when-pressed-powerbtn:
	gsettings set org.gnome.settings-daemon.plugins.power power-button-action interactive

restrict-alttab-to-current-app:
	gsettings set org.gnome.shell.app-switcher current-workspace-only true

show-desktop-when-press-super-d:
	gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"

show-process-tree-in-system-monitor:
	dconf write /org/gnome/gnome-system-monitor/show-dependencies true

no-redundant-characters-on-search-result:
ifeq ($(shell dconf read /org/gnome/desktop/search-providers/disabled),)
	gsettings set org.gnome.desktop.search-providers disabled "['org.gnome.Characters.desktop']"
endif

add-minmaxbtn-to-windowbar:
	gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close

skip-confirm-before-60s-shutdown-confirm:
	gsettings set org.gnome.SessionManager logout-prompt false

optimize-alt-grave-app-switcher-appearance:
	dconf load /org/gnome/desktop/wm/keybindings/ <<END
	[/]
	cycle-group=['<Alt>grave']
	cycle-group-backward=['<Shift><Alt>grave']
	END

show-battery-percentage-weekday-weekindex-in-top-panel:
	cat <<END | dconf load /org/gnome/desktop/
	[interface]
	show-battery-percentage=true
	clock-show-weekday=true
	[calendar]
	show-weekdate=true
	END

.PHONY: default disabled
