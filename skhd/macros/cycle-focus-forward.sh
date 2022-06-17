if [[ $(yabai -m config focus_follows_mouse) = "disabled" ]]; then
  yabai -m config focus_follows_mouse autofocus
else
  if [[ $(yabai -m config focus_follows_mouse) = "autofocus" ]]; then
    yabai -m config focus_follows_mouse autoraise
  else
    yabai -m config focus_follows_mouse off
  fi
fi
