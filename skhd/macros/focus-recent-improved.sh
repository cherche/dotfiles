# TODO: Find most recent window from ALL windows
# I think this requires either editing the yabai source (to track most
# recent of ALL windows),
# or adding a signal (for whenever focus changes) and a variable somewhere
# that stores the last ID
# Removing the --space option actually DOES NOT work because yabai's querying
# system seems to first check windows within the same space, meaning
# recent windows on different spaces end up inaccessible
FOCUS="$(yabai -m query --windows --space \
  | jq '[.[] | select(.role == "AXWindow" and .subrole == "AXStandardWindow")][1].id')"
yabai -m window --focus $FOCUS
