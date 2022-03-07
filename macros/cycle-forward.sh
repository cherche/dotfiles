if [[ $(yabai -m query --windows --window | jq -re '.["is-floating"]') = 'false' ]]; then
  FOCUS="$(yabai -m query --windows --space \
    | jq -re "[ \
      sort_by(.id, .frame) | .[] \
      | select(.role == \"AXWindow\" and .subrole == \"AXStandardWindow\" and .[\"is-floating\"] == false) \
      | .id \
    ] \
      | nth(index($(yabai -m query --windows --window | jq -re ".id")) - 1)")"
else
  FOCUS="$(yabai -m query --windows --space \
    | jq -re "[ \
      sort_by(.id, .frame) | .[] \
      | select(.role == \"AXWindow\" and .subrole == \"AXStandardWindow\" and .[\"is-floating\"]) \
      | .id \
    ] \
      | nth(index($(yabai -m query --windows --window | jq -re ".id")) - 1)")"
fi

yabai -m window --focus "$FOCUS"
