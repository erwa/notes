### Invert y-axis

```
plt.ylim(max(y_array), min(y_array))

// can also try
scatter = plt.scatter(x, y)
ax = scatter.axes
ax.invert_xaxis()
ax.invert_yaxis()
```

https://stackoverflow.com/questions/2051744/reverse-y-axis-in-pyplot


### Plot points without connnecting line

```
ax.plot(x, y, color='red', marker='o', markersize=1, linestyle='None')
```


### Plot rectangle on image

```
import matplotlib.pyplot as plt
import matplotlib.patches as patches
from PIL import Image
import numpy as np

im = np.array(Image.open('stinkbug.png'), dtype=np.uint8)

# Create figure and axes
fig,ax = plt.subplots(1)

# Display the image
ax.imshow(im)

# Create a Rectangle patch
rect = patches.Rectangle((50,100),40,30,linewidth=1,edgecolor='r',facecolor='none')

# Add the patch to the Axes
ax.add_patch(rect)

plt.show()
```

https://stackoverflow.com/questions/37435369/matplotlib-how-to-draw-a-rectangle-on-image


### Plot curve

```
import matplotlib.pyplot as plt

fig = plt.figure()
fig.suptitle('My awesome neural network')

ax = fig.add_subplot(211)
ax.plot(epochs, train_loss)
ax.plot(epochs, valid_loss)
ax.set(xlabel='epochs', ylabel='avg loss')
ax.grid()
ax.legend(('train', 'valid'))

ax = fig.add_subplot(212)
ax.plot(epochs, train_acc)
ax.plot(epochs, valid_acc)
ax.set(xlabel='epochs', ylabel='accuracy')
ax.grid()
ax.legend(('train', 'valid'))

plt.subplots_adjust(hspace=0.5)
plt.show()
```

https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.subplots_adjust.html
https://matplotlib.org/3.1.1/gallery/images_contours_and_fields/irregulardatagrid.html#sphx-glr-gallery-images-contours-and-fields-irregulardatagrid-py
https://matplotlib.org/3.1.1/gallery/subplots_axes_and_figures/figure_title.html
https://matplotlib.org/3.1.1/gallery/lines_bars_and_markers/masked_demo.html#sphx-glr-gallery-lines-bars-and-markers-masked-demo-py
https://matplotlib.org/3.1.1/gallery/lines_bars_and_markers/simple_plot.html#sphx-glr-gallery-lines-bars-and-markers-simple-plot-py


### 3d scatterplot

```
# This import registers the 3D projection, but is otherwise unused.
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 unused import

import matplotlib.pyplot as plt

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

for x,y,z in points:
	ax.scatter(x,y,z)

plt.show()
```

https://matplotlib.org/3.1.1/gallery/mplot3d/scatter3d.html


### Wait for user to close plot to continue

```
plt.show()
```


### Wait for key press to close plot

```
plt.draw()
plt.waitforbuttonpress(0)
```


### Show image in grayscale

```
plt.imshow(data, cmap='gray')
plt.show()
```

https://stackoverflow.com/questions/3823752/display-image-as-grayscale-using-matplotlib


### Save figure without white margins

```
fig = plt.figure()
plt.axis('equal')
plt.axis('off')
plt.imshow(data, cmap='jet')
plt.savefig(filename, bbox_inches='tight', transparent=True, pad_inches=0)
```

https://stackoverflow.com/questions/8218608/scipy-savefig-without-frames-axes-only-content


### Label axes

```
import matplotlib.pyplot as plt

fig = plt.figure()
ax1 = fig.add_subplot(111)
ax1.set_ylabel('position')
ax1.set_xlabel('time')
```


### subplot

```
# plt.figure() optional (plt.figure(1) created automatically)
# plt.subplot(111) optional (created by default if no axes specified)

# numrows, numcols, plot_number (1 to numrows * numcols)
subplot(211) # same as subplot(2, 1, 1)
```

https://matplotlib.org/3.1.0/tutorials/introductory/pyplot.html