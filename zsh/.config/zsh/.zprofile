# Auto-launch Hyprland via uwsm no login TTY
if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi
