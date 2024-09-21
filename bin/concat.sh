# horizontally flip video
ffmpeg -i INPUT.mp4 -vf hflip -c:a copy OUTPUT.mp4

# concatenate videos + horizontally flip
ffmpeg -f concat -safe 0 -i files.txt -vf hflip -c:a copy OUTPUT.mp4

# concatenate + rotate + horizontally flip
ffmpeg -f concat -safe 0 -i files.txt -vf "transpose=2, hflip" -c:a copy OUTPUT.mp4

# concatenate + horizontally flip
# https://ffmpeg.org/ffmpeg-filters.html#Filtering-Introduction
# https://unix.stackexchange.com/a/38380

ffmpeg -i input1.mp4 -i input2.mp4 \
-filter_complex "[0:v] [0:a] [1:v] [1:a] \
concat=n=2:v=1:a=1 [tmp] [a]; [tmp] hflip [v]" \
-map "[v]" -map "[a]" -vcodec libx265 -crf 28 output.mp4

# cut/trim video
# start at 00:00:00 and count 7s forward
ffmpeg -ss 00:00:00 -i INPUT.mp4 -to 00:00:07 -c:v copy -c:a copy OUTPUT.mp4
# start at 00:00:00 and count until 00:00:08
ffmpeg -ss 00:00:05.5 -to 00:00:08 -i INPUT.mp4 -c copy OUTPUT.mp4

# concatenate videos
ffmpeg -f concat -safe 0 -i files.txt -c copy OUTPUT.mp4

# loop video
ffmpeg -stream_loop 6 -i INPUT.mp4 -c copy OUTPUT.mp4

# reverse video
ffmpeg -i INPUT.mp4 -vf reverse -af areverse OUTPUT.mp4
# https://superuser.com/questions/1222801/black-frames-at-beginning-of-video-file-when-file-cut
# precise video cut/trim by frame
ffmpeg -i INPUT.mp4 -filter_complex \
    "[0]trim=start_frame=1:end_frame=29,setpts=PTS-STARTPTS,reverse[r];[0][r]concat=n=2:v=1:a=0,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    OUTPUT.mp4

# crop video
ffmpeg -i INPUT.mp4 -filter:v "crop=out_w:out_h:x:y" OUTPUT.mp4

# slow down video and cut
ffmpeg -itsscale 20 -ss 00:00:00 -to 00:00:12 -i INPUT.mp4 -c copy OUTPUT.mp4

# cut/trim video and slow down
ffmpeg -ss 00:00:25.1 -to 00:00:29.7 -i INPUT.mp4 -an -vf "setpts=2*PTS" OUTPUT.mp4
