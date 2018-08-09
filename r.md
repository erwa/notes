### Comment out / uncomment lines in RStudio

```
Cmd + Shift + C
```


### Diff two vectors / Contingency Table

```
> a = c(1,0,0,1,0,1)
> b = c(0,0,0,1,1,0)
> table(a,b)
   b
a   0 1
  0 2 1
  1 2 1
```


### Apply function to all elements of a vector

```
z = sapply(x, myFunction)
```

http://astrostatistics.psu.edu/su07/R/html/base/html/lapply.html


### Defining functions

```
foo = function(x) {
  if (x > 0.5) {
    return(1)
  } else {
    return(0)
  }
}
```

https://swcarpentry.github.io/r-novice-inflammation/02-func-R/


### Test if two vectors are equal

```
all.equal(x, y)
```

https://stat.ethz.ch/R-manual/R-devel/library/base/html/all.equal.html


### Increase `max.print`

```
options(max.print=1000000)
```

https://stackoverflow.com/questions/6758727/how-to-increase-the-limit-for-max-print-in-r


### See source code of function

```
getAnywhere(gbm.perf)
```

https://stackoverflow.com/questions/19226816/how-can-i-view-the-source-code-for-a-function


### Help

```
help(gbm)
?gbm

# search
??gbm
```


### Time a function

```
system.time(x <- myFunc(...))
```

https://stackoverflow.com/questions/6262203/measuring-function-execution-time-in-r


### Gradient Boosting Model (gbm)

```
# . means all columns not otherwise in the formula
gbm0 = gbm(is_spam ~ ., data = x, interaction.depth = 4, shrinkage = 0.05, n.trees = 2500,
           bag.fraction = 0.5, cv.folds = 5, distribution = 'bernoulli', verbose = T)

# interaction.depth is number of splits, means trees allow N-way variable interactions
```


### Read file as vector

```
data = readLines('file')
```


### Ordinal variable

```
# ordered factor
rating <- ordered(rating)
```

https://www.statmethods.net/input/datatypes.html


### Debugging

```
> gbm.perf(gbm0, method = 'test')
Error in plot.window(...) : need finite 'ylim' values
```

Check the `gbmObject$valid.error`. If all NaN, probably because `train.fraction=1`. `method = 'cv'` should work. Another cause may be overfitting. Decreasing the number of iterations may solve the problem.

```
tar: Failed to set default locale
```

Fix:

```
system('defaults write org.R-project.R force.LANG en_US.UTF-8')
# then restart R
```

https://stackoverflow.com/questions/3907719/how-to-fix-tar-failed-to-set-default-locale-error




```
no font could be found for family "Arial"
```

Applications -> Fontbook (字體簿) -> enable "Arial" -> restart computer

http://r.789695.n4.nabble.com/no-font-could-be-found-for-family-quot-Arial-quot-td3233322.html


### Length of vector

```
length(myVector)
```


### Test if vector

```
is.vector(myVariable)
```


### Character vector

Is just a vector of strings

https://www.statmethods.net/input/datatypes.html


### Create a vector / vector literal

```
# think 'c' for combine
c(1, 2, 3)
```

https://swcarpentry.github.io/r-novice-inflammation/02-func-R/


### Count occurrences of each value in a vector

```
table(x)
```

https://stackoverflow.com/questions/1923273/counting-the-number-of-elements-with-the-values-of-x-in-a-vector


### Variable assignment

`=` or `<-`

```
x = 3
x <- 3
```

http://blog.revolutionanalytics.com/2008/12/use-equals-or-arrow-for-assignment.html


### For loop

```
ordinalCols = c(4, 5, 7, 8, 10, 11)

for(i in ordinalCols) {
  df[,i] = as.ordered(df[,i])
}

# alternative using column names
ordinalCols = c('age', 'Edu', 'Income', 'LiveBA', 'Persons', 'Under18')

for(ordinalCol in ordinalCols) {
  df[,ordinalCol] = as.ordered(df[,ordinalCol])
}
```


### Data frames

```
df = read.csv('/path/to/file', colClasses='factor')
head(df)

df$ColumnName
df['ColumnName']  # returns sublist
df[['ColumnName']]  # returns vector
# https://stackoverflow.com/questions/7070173/r-friendly-way-to-convert-r-data-frame-column-to-a-vector

# Change class of column
df$age = as.ordered(df$age)

# number of columns
ncol(df)

# number rows, size of a data frame, length of a data frame
nrow(df)
```

https://stackoverflow.com/questions/3796266/change-the-class-from-numeric-to-factor-of-many-columns-in-a-data-frame


### Print trees

```
library("rpart.plot", lib.loc="/Library/Frameworks/R.framework/Versions/3.4/Resources/library")

prp(tree)

plot.tree(mytree, type=c('uniform'))
```


### `rpart`

```
library(rpart)

df = read.csv('/path/to/file', colClasses='factor')
str(df)

t = rpart(df, data=df, method='class', control=rpart.control(minsplit=2, minbucket=1, cp=0.001))

t

# prints variable importance
summary(t)

# uniform means equal heights of branches
# branch=0 means V shaped branches
plot(t, uniform=TRUE, branch=0)

plot.new(); plot(t, frame.plot=TRUE, branch=0, uniform=TRUE); text(t, use.n=TRUE)

# all=TRUE labels internal nodes as well
plot.new(); plot(t, branch=1, uniform=TRUE, mar=rep(0.05,4)); text(t, use.n=TRUE, cex=0.9, all=TRUE)

plot(t)

# if minlength = 1, labels get printed as abcd (even if originally they were 1, 2, 3, 4)
text(t, use.n=TRUE, minlength=2)

post(t)
```


### data.frame

Fundamental data structure. 1-indexed.

Print row:
```
# print first row
df[1,]

# create a data frame of first two columns
x <- df[,1:2]

# create vector of first column
x <- df[,1]
```

https://stackoverflow.com/questions/21025609/how-do-i-extract-a-single-column-from-a-data-frame-as-a-data-frame


### Working directory

```
# print current working directory
getwd()

# change working directory
setwd('/path/to/dir')

# ls
list.files()
```

http://stat.ethz.ch/R-manual/R-devel/library/base/html/getwd.html