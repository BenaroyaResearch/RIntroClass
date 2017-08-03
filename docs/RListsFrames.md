# R Language Programming

## Lists, factors, data.frames

Vectors are required to be constructed from the same basic type of data, but sometimes we want something more flexible. Thats where **lists** come in.

Lists can contain basic data, vectors, and even other lists inside.  For example:

```
> l <- list(height=c(50, 60, 58, 55, 62), mean=57, 4.690416)
> l
$height
[1] 50 60 58 55 62

$mean
[1] 57

[[3]]
[1] 4.690416
```

You can access the internal lists by location ([[x]] operator), or if the internal lists are 'named' (have an assignment), you can access them by name from the main list, or using the '$' operator.


```
> l[[2]]
[1] 57

> l[["mean"]]
[1] 57

> l$mean
[1] 57
```

**Factors** are a special kind of list with a limited number of values.  This is useful for handling categorical data. **Levels** are the different categories that make up the list.

```
> g <- factor(c("F", "M", "F", "F", "M"))
> g
[1] F M F F M
Levels: F M
```

_Here's where it gets interesting:_  A data.frame is a generalized matrix - where each interal list has the same number of elements.  These lists will make up the columns of the data.frame.

```
> df<- data.frame(gender=factor(c("F", "M", "F", "F", "M")), height=c(50, 60, 58, 55, 62), SLEDAI=c(5, 1, 3, 4, 1))
> df
  gender height SLEDAI
1      F     50      5
2      M     60      1
3      F     58      3
4      F     55      4
5      M     62      1
> str(df)
'data.frame':	5 obs. of  3 variables:
 $ gender: Factor w/ 2 levels "F","M": 1 2 1 1 2
 $ height: num  50 60 58 55 62
 $ SLEDAI: num  5 1 3 4 1
```

You can give names to rows, in the same way that columns have names...

```
> rownames(df) <- c("Patient A", "Patient B", "Patient C", "Patient D", "Patient E")
> df
          gender height SLEDAI
Patient A      F     50      5
Patient B      M     60      1
Patient C      F     58      3
Patient D      F     55      4
Patient E      M     62      1
```

In the data frame selector '[', rows are first, columns second.  You can ask for the rows or the columns by index (number), or by name. Same with columns, but don't use the comma, just the name of the column.  For instance:

```
>df[1,]
          gender height SLEDAI
Patient A      F     50      5

> df["Patient B",]
          gender height SLEDAI
Patient B      M     60      1

> df["SLEDAI"]
          SLEDAI
Patient A      5
Patient B      1
Patient C      3
Patient D      4
Patient E      1

> df[2]
          height
Patient A     50
Patient B     60
Patient C     58
Patient D     55
Patient E     62
```

In these cases a data.frame is returned. If you employ the comma to select a column from the '[' selector, use '$', or use '[[', to ask for a column you will get back a vector.


```
> df[,"height"]
[1] 50 60 58 55 62

> df[,1]
[1] F M F F M
Levels: F M # this is a factor

> df$SLEDAI
[1] 5 1 3 4 1

> df[["gender"]]
[1] F M F F M
Levels: F M
```

If you want more than one at a time, use a vector of indices, or names:

```
> df[c(1,4), c("gender", "height")]
          gender height
Patient A      F     50
Patient D      F     55
```

For more examples see:

* r-tutor page on [column slices](http://www.r-tutor.com/r-introduction/data-frame/data-frame-column-slice)
* r-tutor page on [row slices](http://www.r-tutor.com/r-introduction/data-frame/data-frame-row-slice)


[prev](RDataTypes.md) | [up](../README.md) | done
