# R Language Programming 

## DataTypes

There are four low level data types:

* Character Strings e.g. - "Red"
* Integers - e.g. 13, 37, 42
* Doubles - e.g. 3.14159
* Logicals - TRUE, FALSE, T, F


These can be put together in different ways:

## Vectors

When working with either a single number or groups of numbers, you'll be doing this in vectors - collections of numbers.  For example:

```
> a <- 42
> print(a)
[1] 42
```
The **[1]** in the result of the print statement is telling us that **a** is a _vector_ marking the first position,  and it happens that the only element of the vector is 42.

We can make longer vectors using the ```c()``` function (short for combine, or concatenate).  Lets make a pair:

```
>m.height <- c(72, 74, 78, 68, 70, 69, 75)
>f.height <- c(68, 66, 67, 64, 61, 60, 60)
>class(f.height)
[1] "numeric" # a vector of numbers (integers or doubles)
```

Vectors should contain only values of the same type (here numbers).  As you might now expect, many **R** functions take vectors as arguments.  ```mean()``` and ```sd()``` (standard deviation) return what you would expect.  ```summary()``` is a convient function that returns a few important details about the argument - given a vector, ```summary()``` returns information about it's distribution and basic statistics.

```
> mean(f.height)
[1] 63.71429
> sd(f.height)
[1] 3.40168
> summary(f.height)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  60.00   60.50   64.00   63.71   66.50   68.00
> summary(m.height)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
68.00   69.50   72.00   72.29   74.50   78.00 
```

Is the difference of the means significant?  Let's Check:

```
> t.test(m.height, f.height)

	Welch Two Sample t-test

data:  m.height and f.height
t = 4.5838, df = 11.964, p-value = 0.000633
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  4.495883 12.646974
sample estimates:
mean of x mean of y 
 72.28571  63.71429 
```

## Matrices

If vectors are one dimensional objects of the same data type, matrices are two dimensional object that are made up of the same data type.

For example:

```
> M <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), byrow=T, nrow=3)
> M
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
> sum(M)
[1] 45
> t(M)
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

```

Why do we care? Some heatmap functions require a matrix argument.

See also:

* c() [manual page](https://stat.ethz.ch/R-manual/R-devel/library/base/html/c.html), [tutor page](http://www.r-tutor.com/r-introduction/vector/combining-vectors)
* summary() [manual page](https://stat.ethz.ch/R-manual/R-devel/library/base/html/summary.html)
* t.test() [manual page](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/t.test.html), [tutor page](http://www.r-tutor.com/elementary-statistics/inference-about-two-populations/population-mean-between-two-independent-samples)
* matrix() [manual page](https://stat.ethz.ch/R-manual/R-devel/library/base/html/matrix.html), [tutor page](http://www.r-tutor.com/r-introduction/matrix)


[prev](RBasics.md) | [up](../README.md) | [next](RListsFrames.md)
