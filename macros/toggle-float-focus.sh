if [[ $(yabai -m query --windows --window | jq '.["is-floating"]') == "false" ]]; then
  FOCUS="$(yabai -m query --windows --space \
    | jq '[.[] | select(.["is-floating"])][0].id')"
else
  FOCUS="$(yabai -m query --windows --space \
    | jq '[.[] | select(.["is-floating"] == false)][0].id')"
fi

yabai -m window --focus $FOCUS
