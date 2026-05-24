# Auto-launch Hyprland no TTY1
if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec uwsm start hyprland-uwsm.desktop
fi
