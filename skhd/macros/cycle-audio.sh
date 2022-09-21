mode=$1

# grep is a bit of a neat hack to get the non-localized names
# since my interface language is set to French
system_audio=$(SwitchAudioSource -t $mode -a | grep 'MacBook Air')
airpods_audio=$(SwitchAudioSource -t $mode -a | grep 'AirPods')
current_audio=$(SwitchAudioSource -t $mode -c)

# If no AirPods, don't bother trying
if [ -z "$airpods_audio" ]; then
  exit 0
fi

# Otherwise, swap between system and AirPods
# Default to AirPods, even if current_audio is not system
if [ "$current_audio" = "$airpods_audio" ]; then
  SwitchAudioSource -t "$mode" -s "$system_audio"
else
  SwitchAudioSource -t "$mode" -s "$airpods_audio"
fi

# osascript -e "display notification \"$message\" with title \"SwitchAudioSource\""
