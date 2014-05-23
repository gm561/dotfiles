# set the cursor
xsetroot -cursor_name left_ptr &

# Make Caps Lock a Control key
setxkbmap -option ctrl:nocaps       
# Disable beep globaly
xset b off

# set German keyboard layout
# setxkbmap -layout de

#set wallpaper
feh --bg-fill Pictures/wallpaper-2988644.jpg

#Make key bining working
xbindkeys

# start xmonad
exec dbus-launch xmonad
