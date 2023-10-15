# $1 - opacity
# $2 - number of repetitions
# $3 - length
len=${3:-0.07}
for (( c=1; c<=$2; c++ ))
do 
    yabai -m config active_window_opacity $1
    sleep $len
    yabai -m config active_window_opacity 1.0
    sleep .03
done
