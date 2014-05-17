# set the cursor
xsetroot -cursor_name left_ptr &

# Make Caps Lock a Control key
setxkbmap -option ctrl:nocaps       

# set German keyboard layout
# setxkbmap -layout de

#set wallpaper
feh --bg-fill Pictures/wallpaper-2988644.jpg

# start xmonad
exec dbus-launch xmonad
