# # stream for rviz1
# ffmpeg -f x11grab -s 1920x1080 -i :1 -r 30 -vcodec libx264 -preset ultrafast -tune zerolatency -b:v 5000k -f flv rtmp://localhost/live/stream1 &

# # stream for rviz2
# ffmpeg -f x11grab -s 1920x1080 -i :1 -r 30 -vcodec libx264 -preset ultrafast -tune zerolatency -b:v 5000k -f flv rtmp://localhost/live/stream2 &

# # stream for rviz3
# ffmpeg -f x11grab -s 1920x1080 -i :1 -r 30 -vcodec libx264 -preset ultrafast -tune zerolatency -b:v 5000k -f flv rtmp://localhost/live/stream3 &

# stream for rviz1
gst-launch-1.0 ximagesrc xid=0x4a00014 ! \
    queue ! videoconvert ! queue ! x264enc tune=zerolatency bitrate=2500 speed-preset=medium key-int-max=30 ! \
    queue ! flvmux ! queue ! rtmpsink location=rtmp://localhost/live/stream1 &

# stream for rviz2
gst-launch-1.0 ximagesrc xid=0x5000014 ! \
    queue ! videoconvert ! queue ! x264enc tune=zerolatency bitrate=2500 speed-preset=medium key-int-max=30 ! \
    queue ! flvmux ! queue ! rtmpsink location=rtmp://localhost/live/stream2 &

# stream for rviz3
gst-launch-1.0 ximagesrc xid=0x56001f6 ! \
    queue ! videoconvert ! queue ! x264enc tune=zerolatency bitrate=2500 speed-preset=medium key-int-max=30 ! \
    queue ! flvmux ! queue ! rtmpsink location=rtmp://localhost/live/stream3 &