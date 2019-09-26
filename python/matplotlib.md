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