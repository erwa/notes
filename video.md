### Examples

```
# -re means read input at native frame rate
# -c copy means not to re-encode stream
ffmpeg -re -i foo.ts -c copy -map 0 -f mpegts udp://1.2.3.4:56789?pkt_size=1234
```




### Check encoding of video

```
ffprobe foo.ts
```

https://stackoverflow.com/questions/2869281/how-to-determine-video-codec-of-a-file-with-ffmpeg


### Extract first minute of video

```
ffmpeg -i in.mov -ss 0 -t 120 out.mov
```

https://stackoverflow.com/questions/26432463/ffmpeg-command-to-extract-first-two-minutes-of-a-video