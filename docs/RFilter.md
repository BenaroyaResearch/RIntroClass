# R Language Programming

## Filtering, Sub-selecting, and reorganizing data

Let say you want to compare the pct.p5IL7pos_nvCD8 data in old patients to young patients - let's just say 32 is the cutoff between young and old.

```
cutoff <- 32
```

What we want to do is select or filter rows of *data* frame by the result of an expression using the 'age' column - compare the age value in a row to the cutoff, and use the result to select that row.

Remember that we can ask for the entire column of a data.frame by name ('age'). 

**One of R's important tricks is 'vectorizing' a comparison.**

For instance if we asked for the comparison ```data$age < cutoff``` **R** will assume you want to compare the value for the 'age' column in each row of 'data' against the 'cutoff' value - it does this by creating a vector of cutoffs to match the length of data$age, and then compares the two.  When we do this the result is a vector of logicals:

```
data$age < cutoff
  [1]  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
 [23] FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
 [45]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [67] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE
 [89] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE
[111]  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE
[133] FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
[155]  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
[177] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE
[199]  TRUE FALSE
```

OK, we're half way there....

To select the old folks, we only care about the *TRUE* values, and if we could get the row indicies from the *TRUE* slots in the vector we could select the rows to keep.
We can get a vector of the row indicies from a logical vector using ```which()```...

```
> which(data$age > 32)
 [1]   4   9  11  12  15  18  19  20  25  26  28  29  32  33  34  36  38  42  44  47  53  55  56  57  58  65  66  67  68  70  72  73  74
[34]  80  85  86  88  89  90  92  93  95  99 100 101 102 104 105 106 110 112 116 117 118 119 120 121 124 126 129 130 132 133 134 135 137
[67] 140 142 145 147 148 149 152 153 154 156 157 159 160 163 164 168 174 177 178 179 180 181 184 186 188 189 191 194 196 197 200
```

...then using using ```data[ , ]```...


```
> data[which(data$age > 32), ]
            HIPCsampleID DiseaseStatus gender age pct.p5IL7pos_nvCD8
Wb01694149           126           T1D      F  38                 NA
Wb04700691           130           T1D      F  33              19.23
Wb07419492           112           T1D      F  38              40.94
Wb09648849            66           T1D      F  38              41.43
```

Now we can use the expression and ```which()``` together to save old and young separately.
Let's filter data into old and young (if you want all columns, don't specify anything in the column selection of the dataframe):

```
old <- data[which(data$age > 32), ]
young <- data[which(data$age <= 32), ]
```


[prev](RImport.md) | [up](../README.md) | [next](RViewing.md)