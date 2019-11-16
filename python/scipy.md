### Scipy vs. scikit-image

scikit-image is bundled with most Scientific Python distributions.

https://scipy-lectures.org/packages/scikit-image/index.html#scikit-image-and-the-scipy-ecosystem


### Convert to grayscale

```
from skimage import data
from skimage.color import rgb2gray

original = data.astronaut()
grayscale = rgb2gray(original)
```

https://scikit-image.org/docs/dev/auto_examples/color_exposure/plot_rgb_to_gray.html


### Color matrix of labels in RGB / convert grayscale to color

```
img = skimage.color.label2rgb(img, img)
```

https://scikit-image.org/docs/dev/api/skimage.color.html#skimage.color.label2rgb