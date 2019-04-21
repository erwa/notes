### Highlight color

```
#!/usr/bin/python
from PIL import Image
import sys

img = Image.open(sys.argv[1])
img = img.convert("RGBA")

pixdata = img.load()

# Clean the background noise, if color != white, then set to black.

for y in range(img.size[1]):
    for x in range(img.size[0]):
        if pixdata[x, y] == (255, 255, 255, 255):
            pixdata[x, y] = (0, 0, 0, 255)
```

https://stackoverflow.com/questions/3752476/python-pil-replace-a-single-rgba-color