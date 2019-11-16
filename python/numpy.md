### Create zero array of same shape as another array / create one array of same shape as another array

```
np.zeros_like(a)
np.ones_like(a)
```


### Ceiling

```
# returns float
np.ceil(x)
```


### Max element of each row of matrix

```
np.amax(mat, 1)

# max element index per row
np.argmax(mat, 1)
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.argmax.html
https://docs.scipy.org/doc/numpy/reference/generated/numpy.amax.html


### Apply function to each element of matrix

```
np.vectorize(myfunc)(mymatrix)
```

https://stackoverflow.com/questions/42594695/how-to-apply-a-function-map-values-of-each-element-in-a-2d-numpy-array-matrix?rq=1


### Subtract vector from each column of matrix

```
v = np.asarray([0, 1, 2])
v = v[:, np.newaxis]
a - v
```

https://stackoverflow.com/questions/26333005/numpy-subtract-every-row-of-matrix-by-vector/26333184


### Add vector to each row of matrix

```
>>> a = np.arange(9).reshape(3,3)
>>> a
array([[0, 1, 2],
       [3, 4, 5],
       [6, 7, 8]])
>>> a + np.asarray([1,2,3])
array([[ 1,  3,  5],
       [ 4,  6,  8],
       [ 7,  9, 11]])
```

Shape mismatch is automatically handled by Numpy's broadcasting: https://docs.scipy.org/doc/numpy/user/basics.broadcasting.html

https://stackoverflow.com/questions/11971089/adding-a-vector-to-matrix-rows-in-numpy


### Test array elements

```
# can combine with things like A > 0 to create a boolean matrix
>>> np.all([[True,False],[True,True]])
False
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.all.html


### Randomly permute array

```
np.random.permutation(x)

# uses np.arange(10)
>>> np.random.permutation(10)
array([1, 7, 4, 3, 0, 9, 2, 5, 8, 6])
```

https://docs.scipy.org/doc/numpy-1.15.0/reference/generated/numpy.random.permutation.html


### Sample elements from array without replacement

```
sampled = np.random.choice(data, num_samples, replace=False)
```

https://docs.scipy.org/doc/numpy-1.15.0/reference/generated/numpy.random.choice.html


### Load

```
my_dict = np.load('foo.npz')
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.load.html


### Save

```
>>> x = np.arange(10)
>>> np.save(outfile, x)

# savez
>>> outfile = TemporaryFile()
>>> np.savez(outfile, x=x, y=y)
>>> _ = outfile.seek(0)
>>> npzfile = np.load(outfile)
>>> sorted(npzfile.files)
['x', 'y']
>>> npzfile['x']
array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.save.html
https://docs.scipy.org/doc/numpy/reference/generated/numpy.savez.html


### Multiply matrices / multiply matrix and vector

```
np.matmul(a, b)
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.matmul.html


### Transpose matrix

```
np.transpose(A)
```


### Data types

bool_
float_
float64  # double
int_
int8
uint8
...

https://docs.scipy.org/doc/numpy-1.13.0/user/basics.types.html


### Swap columns

```
my_array[:,[0, 1]] = my_array[:,[1, 0]]
```

https://stackoverflow.com/questions/4857927/swapping-columns-in-a-numpy-array


### Advanced indexing

```
>>> x = np.array([[1, 2], [3, 4], [5, 6]])
>>> x[[0, 1, 2], [0, 1, 0]]
array([1, 4, 5])

# select specific element per row based on vector of indexes
a[np.arange(len(a)), indexes]
```

https://stackoverflow.com/questions/23435782/numpy-selecting-specific-column-index-per-row-by-using-a-list-of-indexes
https://docs.scipy.org/doc/numpy/reference/arrays.indexing.html#integer-array-indexing


### Convert to numpy array

```
numpy.asarray(a)
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.asarray.html


### Replace negative values

```
a[a < 0] = 0
np.clip(a, 0)
```

https://stackoverflow.com/questions/10335090/numpy-replace-negative-values-in-array


### Chain logical or

```
>>> x = np.array([True, True, False, False])
>>> y = np.array([True, False, True, False])
>>> z = np.array([False, False, False, False])
>>> np.logical_or(np.logical_or(x, y), z)
array([ True,  True,  True,  False], dtype=bool)

>>> np.logical_or.reduce((x, y, z))
array([ True,  True,  True,  False], dtype=bool)
```

https://stackoverflow.com/questions/20528328/numpy-logical-or-for-more-than-two-arguments


### Convert to uint8 / convert to different type

```
a = a.astype(np.uint8)
```

https://stackoverflow.com/questions/46689428/convert-np-array-of-type-float64-to-type-uint8-scaling-values


### Round to nearest int

```
np.rint(a)
```


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


### Sum each row of matrix

```
np.sum(a, 1)
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.sum.html


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

# to iterate with index
>>> a = np.array([[1, 2], [3, 4]])
>>> for index, x in np.ndenumerate(a):
...     print(index, x)
(0, 0) 1
(0, 1) 2
(1, 0) 3
(1, 1) 4
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.ndenumerate.html
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


### Square matrix / element-wise squaring of a matrix

```
>>> np.square([-1j, 1])
array([-1.-0.j,  1.+0.j])
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.square.html


### Matrix multiplication

```
np.dot(A, B)
np.dot(A, x)

>>> a = np.eye(2)
>>> b = np.ones((2, 2)) * 2
>>> a.dot(b)
```

https://docs.scipy.org/doc/numpy/reference/generated/numpy.ndarray.dot.html
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