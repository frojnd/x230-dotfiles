xrandr --dpi 125.37 &
xrandr --output VGA1 --auto &
xrandr --output VGA1 --above LVDS1 &
xrandr --output DP1 --auto &
xrandr --output DP1 --above LVDS1 &
feh --randomize --bg-fill ~/system/wallpapers/* &
xmodmap ~/.Xmodmap &
xss-lock -- locker.sh &
xbindkeys &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
