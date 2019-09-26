### Independence / Pairwise independence / k-wise independence

X1, ..., Xn are k-wise independent if

Pr[X_1 = x_1 and X_2 = x_2 ... and X_n = x_n] = product over i of Pr[X_i = x_i]

https://www.cs.ubc.ca/~nickhar/W15/Lecture13Notes.pdf


### Markov's inequality

The probability that a random variable is greater than k times its expected value is less than or equal to 1/k.

Pr(X >= k E[X]) <= 1/k

Alternatively:

Pr(X >= k) <= E[X]/k


### Chernoff bound

Just a special case of Markov's inequality. Markov applied to e^(tX)

Pr(e^(tX) >= k E[e^(tX)]) <= 1/k

Alternatively:

Pr(e^(tX) >= e^(tk)) <= E[e^(tX)]/e^(tk) 