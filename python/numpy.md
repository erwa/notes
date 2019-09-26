### Copy one array into part of another

```
>>> import numpy as np
>>> a = np.arange(9)
>>> a = a.reshape((3, 3))
>>> b = np.zeros((5, 5))
>>> b[1:4, 1:4] = a
>>> b
array([[ 0.,  0.,  0.,  0.,  0.],
       [ 0.,  0.,  1.,  2.,  0.],
       [ 0.,  3.,  4.,  5.,  0.],
       [ 0.,  6.,  7.,  8.,  0.],
       [ 0.,  0.,  0.,  0.,  0.]])
```


### Extract submatrix / return block of matrix

```
>>> a = np.arange(16).reshape(4,4)
>>> a
array([[ 0,  1,  2,  3],
       [ 4,  5,  6,  7],
       [ 8,  9, 10, 11],
       [12, 13, 14, 15]])
>>> a[1:3,1:3]
array([[ 5,  6],
       [ 9, 10]])
```


### Sum all elements of array

```
>>> np.sum([[0, 1], [0, 5]])
6
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.sum.html


### Number of elements in array

```
>>> x = np.zeros((3, 5, 2), dtype=np.complex128)
>>> x.size
30
>>> np.prod(x.shape)
30
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.ndarray.size.html


### Iterate over elements in matrix or array

```
>>> a = np.arange(6).reshape(2,3)
>>> for x in np.nditer(a):
...     print(x, end=' ')
...
0 1 2 3 4 5
```

https://docs.scipy.org/doc/numpy/reference/arrays.nditer.html


### Count number of nonzero elements

```
>>> np.count_nonzero(np.eye(4))
4
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.count_nonzero.html


### Initialize matrix

```
np.zeros((3, 3), dtype=np.uint8)
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.zeros.html


### Minimum value and index of minimum value

```
np.argmin(a) # index of minimum value
np.amin(a)   # minimum value
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.argmin.html
https://docs.scipy.org/doc/numpy/reference/generated/numpy.amin.html


### Concatenate two matrices

```
>>> a = np.array([[1, 2], [3, 4]])
>>> b = np.array([[5, 6]])
>>> np.concatenate((a, b), axis=0)
array([[1, 2],
       [3, 4],
       [5, 6]])
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.concatenate.html


### Add channel to image

```
# (25, 54, x) -> (25, 54, x + 1)
numpy.dstack( ( your_input_array, numpy.zeros((25, 54)) ) )
```

https://stackoverflow.com/questions/39642721/adding-alpha-channel-to-rgb-array-using-numpy


### Split image into channels

```
r, g, b = image[:, :, 0], image[:, :, 1], image[:, :, 2] # For RGB image
```

https://stackoverflow.com/questions/41500637/how-to-extract-r-g-b-values-with-numpy-into-seperate-arrays


### Matrix multiplication

```
np.dot(A, B)
np.dot(A, x)
```

https://stackoverflow.com/questions/21562986/numpy-matrix-vector-multiplication


### Shift elements

```
array([[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]])
>>> np.roll(a, -1, 1)
array([[2, 3, 1],
       [5, 6, 4],
       [8, 9, 7]])
>>> np.roll(a, (1, 1), (0, 1))
array([[9, 7, 8],
       [3, 1, 2],
       [6, 4, 5]])
```

https://www.geeksforgeeks.org/numpy-roll-python/