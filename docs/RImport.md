### R Language Programming

## Import/Read a file.

```read.csv()``` is probably one of the easiest ways to get data into R. Let's load a subset of a T1D study.

```
>data <- read.csv("data/example.csv", row.names=1)
>data
            HIPCsampleID DiseaseStatus gender age pct.p5IL7pos_nvCD8
Wb01018268           149           T1D      F  22              40.53
Wb01232422            59           CTL      F  32              53.67
Wb01641203           121           T1D      M  26              45.39
Wb01694149           126           T1D      F  38                 NA
Wb02326960            87           T1D      F  32              33.16
...

>str(data)
'data.frame':	200 obs. of  6 variables:
 $ HIPCsampleID      : int  149 59 121 126 87 68 91 129 130 31 ...
 $ DiseaseStatus     : Factor w/ 2 levels "CTL","T1D": 2 1 2 2 2 1 2 1 2 2 ...
 $ gender            : Factor w/ 2 levels "F","M": 1 1 2 1 1 1 2 1 1 2 ...
 $ age               : int  22 32 26 38 32 19 32 30 33 21 ...
 $ pct.p5IL7pos_nvCD8: num  40.5 53.7 45.4 NA 33.2 ...
```
We've read it in assigning the first column, WBnumber, to be the row name.
Using ```str()``` We can see that ```read.csv()``` has read the file in and converted it into data.frame for us. Further, DiseaseStatus and Gender are now represened as factors, and age is represented as an integer vector (though it could be a floating point number).

Finally pct.p5IL7pos_nvCD8 has been loaded in as a vector of numbers but we can see that there is an NA... as a breif aside, let's look into this a little more - we may need to keep an eye on this.  

#### NA - what is it?

What is an 'NA'?  *NA*, sometimes referred to as a 'missing value', is a specific string that has special meaning in **R** - 'not available'  You should use NA instead of blanks, whitespace, period ('.'), or any other character or string.  If you need to specify why some data is missing, do that in a comment field.  If you use something other than NA for missing number, ```read.csv()``` or other importers will be confused and think that the entire column is strings instead of numbers.

Back to our situation, how many NAs are therein our set?  One way to do that is to first we can test each element of the vector to see if it's NA

```
is.na(data$pct.p5IL7pos_nvCD8)
  [1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [19]  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
 [37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
 [55] FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [73]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [91] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE
[109] FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[127] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[145] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE
[163] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[181] FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[199] FALSE  TRUE
```

This returns a vector representing truth or falsehood for each element of the vector.
In **R** you can nest function calls... we can summarize this vector with ```table()```
The function ```any()``` also works here.

```
>table(is.na(data$pct.p5IL7pos_nvCD8))

FALSE  TRUE 
  159    41 

>any(is.na(data$pct.p5IL7pos_nvCD8))
[1] TRUE
```
But, why is this important to me?  Because the statistical functions in **R** need to know what to do when it encounters an *NA*.  Sometimes they will fail miserably, but most of the time you can designate what you would like to have happen.  We will see this in action in the next section.

[up](../README.md) | [next](RFilter.md)