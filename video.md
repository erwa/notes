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