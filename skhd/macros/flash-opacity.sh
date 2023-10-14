# $1 - opacity
# $2 - number of repetitions
for (( c=1; c<=$2; c++ ))
do 
    yabai -m config active_window_opacity $1
    sleep .05
    yabai -m config active_window_opacity 1.0
    sleep .03
done
