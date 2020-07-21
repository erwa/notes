### Specify output format

```
# specifies mpegts as output format
ffmpeg -re -i input.ts -c copy -map 0 -f mpegts udp://127.0.0.1:1234
```


### Loop video forever

```
# -fflags +genpts regenerates pts timestamps so time sequence is correct even when looping
# -re plays at original speed
# -stream_loop -1 causes input to loop forever
ffmpeg -re -fflags +genpts -stream_loop -1 -i ./test.mp4 -c copy ./test.m3u8
```

https://stackoverflow.com/questions/30846719/infinite-stream-from-a-video-file-in-a-loop