yabai -m config active_window_border_color "0xff$1"
sleep .07
# We can be sure this is the appropriate border colour
# since errors can only occur in normal mode
yabai -m config active_window_border_color '0xfff6c177'
