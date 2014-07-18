# set the cursor
xsetroot -cursor_name left_ptr &

# Make Caps Lock a Control key
setxkbmap -option ctrl:nocaps

# Disable beep globaly
xset b off

# set German keyboard layout
# setxkbmap -layout de

#set wallpaper
#feh --bg-fill Pictures/wallpaper-2988644.jpg
feh --bg-fill Pictures/falcon.jpg

#Make key bining working
xbindkeys

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start xmonad
exec dbus-launch xmonad

