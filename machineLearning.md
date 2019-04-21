### Synchronous vs. Asynchronous training

https://blog.skymind.ai/distributed-deep-learning-part-1-an-introduction-to-distributed-training-of-neural-networks/#asynchronousstochasticgradientdescent

Good visual showing epochs per second vs. accuracy per epoch between various async and sync approaches: https://blog.skymind.ai/content/images/2017/12/image8.svg


### Conjugate Gradient

How it can be applied to non-symmetric, non-positive definite matrices:

```
A^T Ax = A^T b
```

A^T A is symmetric and positive. Can use above to find a solution that minimizes

```
||Ax - b||^2
```

https://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf section 13.

Each new residual is orthogonal to all previous residuals.

http://www.cs.cmu.edu/~15859n/RelatedWork/painless-conjugate-gradient.pdf Figure 29


### Hashing trick

Hash words into a range. A way to deal with out-of-vocabulary words, also do not need to retrain model for new words/misspellings -- can update existing model.

https://medium.com/value-stream-design/introducing-one-of-the-best-hacks-in-machine-learning-the-hashing-trick-bf6a9c8af18f


### Parallel and Distributed Deep Learning

https://arxiv.org/pdf/1802.09941.pdf


### Output variable / response variable

The variable you are trying to predict is the output or response variable.

https://machinelearningmastery.com/data-terminology-in-machine-learning/


### Top-5 error rate

Fraction of test images where correct label is not in top-5 most probable labels.

https://stats.stackexchange.com/questions/156471/imagenet-what-is-top-1-and-top-5-error-rate


### Dropout

Ignoring nodes in a layer with some probability. Helps prevent overfitting.

https://medium.com/@amarbudhiraja/https-medium-com-amarbudhiraja-learning-less-to-learn-better-dropout-in-deep-machine-learning-74334da4bfc5


### Features vs. labels

Features are inputs. Labels are outputs. Training data may be *tagged* with labels.

https://stackoverflow.com/questions/40898019/what-is-the-difference-between-a-feature-and-a-label


### AUC / AUROC

AUC usually means AUROC -- Area Under a Receiver Operating Characteristic Curve.

ROC curve is a visualization of how good a binary classifier is. A random one has AUC of 0.5; a perfect one has AUC of 1.

http://gim.unmc.edu/dxtests/roc3.htm
https://en.wikipedia.org/wiki/Receiver_operating_characteristic
https://stats.stackexchange.com/questions/132777/what-does-auc-stand-for-and-what-is-it


### Overview of Deep Learning

https://stats.stackexchange.com/questions/182734/what-is-the-difference-between-a-neural-network-and-a-deep-neural-network-and-w


### Recurrent Neural Network (RNN)

A neural network with loops.

https://stats.stackexchange.com/questions/182734/what-is-the-difference-between-a-neural-network-and-a-deep-neural-network-and-w


### Machine Learning Engineers

https://www.oreilly.com/ideas/what-are-machine-learning-engineers


### Glossary

https://developers.google.com/machine-learning/glossary/


### Common Machine Learning Algorithms

From 2015 Quora answer:

Linear regression
Logistic regression
k-means
SVMs
Random Forests
Matrix Factorization/SVD
Gradient Boosted Decision Trees/Machines
Naive Bayes
Artificial Neural Networks
For the last one I'd let you pick one of the following:
Bayesian Networks
Elastic Nets
Any other clustering algo besides k-means
LDA
Conditional Random Fields
HDPs or other Bayesian non-parametric model

https://www.datasciencecentral.com/profiles/blogs/top-10-machine-learning-algorithms


### Classes

Stanford CS225 - Ng
Stanford CS231n - Deep Learning