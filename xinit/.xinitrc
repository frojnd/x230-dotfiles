xrandr --dpi 125.37 &
xrandr --output VGA1 --auto &
xrandr --output VGA1 --above LVDS1 &
xrandr --output DP1 --auto &
xrandr --output DP1 --above LVDS1 &
feh --randomize --bg-fill ~/system/wallpapers/* &
xmodmap ~/.Xmodmap &
xss-lock -- i3lock -n -i ~/pictures/wallpapers/black-arch-linux-wallpaper.png &
xbindkeys &
exec i3
