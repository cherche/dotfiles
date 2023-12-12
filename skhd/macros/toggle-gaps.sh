if [[ $(yabai -m config window_gap) = "4" ]]; then
  yabai -m config top_padding    8
  yabai -m config bottom_padding 8
  yabai -m config left_padding   8
  yabai -m config right_padding  8
  yabai -m config window_gap     8
  #borders width=4 &
else
  yabai -m config top_padding    2
  yabai -m config bottom_padding 2
  yabai -m config left_padding   2
  yabai -m config right_padding  2
  yabai -m config window_gap     4
  #borders width=0 &
fi
