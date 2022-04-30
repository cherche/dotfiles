if [[ $(yabai -m config window_gap) = "0" ]]; then
  yabai -m config top_padding    4
  yabai -m config bottom_padding 4
  yabai -m config left_padding   6
  yabai -m config right_padding  6
  yabai -m config window_gap     4
else
  yabai -m config top_padding    0
  yabai -m config bottom_padding 0
  yabai -m config left_padding   0
  yabai -m config right_padding  0
  yabai -m config window_gap     0
fi
