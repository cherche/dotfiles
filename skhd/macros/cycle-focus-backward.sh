if [[ $(yabai -m config focus_follows_mouse) = "disabled" ]]; then
  yabai -m config focus_follows_mouse autoraise
else
  if [[ $(yabai -m config focus_follows_mouse) = "autoraise" ]]; then
    yabai -m config focus_follows_mouse autofocus
  else
    yabai -m config focus_follows_mouse off
  fi
fi
