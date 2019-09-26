### Orthonomal matrices

Let M be an n x k matrix with n > k and orthonormal columns. Row norms are all <= 1 by Pythagorean theorem. Norm of Mx is equal to norm of M.

https://en.wikipedia.org/wiki/Orthogonal_matrix#Overview
https://math.stackexchange.com/questions/2638990/row-norms-of-a-tall-matrix-with-orthonormal-columns


### Matrix norm

Must satisfy some properties, including

* ||A+B|| <= ||A|| + ||B||

https://en.wikipedia.org/wiki/Matrix_norm#Matrix_norms_induced_by_vector_norms


### Different views of matrix-matrix multiplication

* row by column multiplication
* column at a time
* row at a time
* sum of outer products
* block multiplication

http://mlwiki.org/index.php/Matrix-Matrix_Multiplication


### Eigenvalues of A, B, and AB

Product of eigenvalues of AB = product of all eigenvalues in A and B

https://math.stackexchange.com/questions/716990/eigenvalues-of-matrices-and-eigenvalue-of-product-of-matrices


### References

[The Matrix Cookbook](https://www.math.uwaterloo.ca/~hwolkowi/matrixcookbook.pdf), Kaare Brandt Petersen and Michael Syskind Pedersen
[Linear Algebra Review and Reference](http://cs229.stanford.edu/section/cs229-linalg.pdf), Zico Kolter and Chuong Do

```
d/dx(Ax) = A^T
```

[Matrix Calculus](http://www.doc.ic.ac.uk/~ahanda/referencepdfs/MatrixCalculus.pdf) - see bottom of D-4


### Scalar-by-vector derivative

```
d/dx(x^T a) = d/dx(a^T x) = a
d/dx(x^T x) = 2x
d/dx(x^T A x) = (A + A^T)x
d/dx(x^T A^T A x) = 2 A^T A x
d/dx(x^T A^T y) = A^T y
```

https://eli.thegreenplace.net/2015/the-normal-equation-and-matrix-calculus/
https://www.math.uwaterloo.ca/~hwolkowi/matrixcookbook.pdf


### Symmetric matrix

Eigenvalues are always real and eigenvectors are always orthogonal.

https://math.stackexchange.com/questions/142645/orthogonal-eigenvectors


### x^T Ay = y^T Ax if A is symmetric

https://math.stackexchange.com/questions/5063/how-do-i-prove-that-xtay-ytax-if-a-is-symmetric