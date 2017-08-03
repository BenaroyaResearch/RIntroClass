# R Language Programming

## View, Test the Data

Let's look at the data first.

```
>plot(density(young$pct.p5IL7pos_nvCD8))
Error in density.default(young$pct.p5IL7pos_nvCD8) : 
  'x' contains missing values
```

```Density()``` is a function where where you need to tell it what to do with the NAs - 
if we look at the help for density, you'll see we can pass an arugment to ask it to remove NAs ```na.rm=TRUE```.

```
>plot(density(young$pct.p5IL7pos_nvCD8, na.rm=T), col="red", main="Density Plot", xlab="Percentages", ylab="Density")>plot(density(old$pct.p5IL7pos_nvCD8, na.rm=T))
```

```Plot()``` starts a new plot every time, but we can add to an existing plot using either ```points()``` or ```lines()```  Let's add a density plot for the 'old' subjects, using lines

```
>lines(density(old$pct.p5IL7pos_nvCD8, na.rm=T), col="blue")
```

These look pretty good - fairly normally distributed, with a couple of shoulders. I think we could run a ```t.test()```:

```
>t.test(old$pct.p5IL7pos_nvCD8, young$pct.p5IL7pos_nvCD8, na.rm=T)

	Welch Two Sample t-test

data:  old$pct.p5IL7pos_nvCD8 and young$pct.p5IL7pos_nvCD8
t = -3.3958, df = 148.96, p-value = 0.0008774
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -10.171276  -2.688267
sample estimates:
mean of x mean of y 
 36.58213  43.01190 

```

You can visualize this result with a boxplot:

```
>boxplot(list(old$pct.p5IL7pos_nvCD8, young$pct.p5IL7pos_nvCD8), names=c("Old", "Young"), ylab="Percent", main="Compare Old to Young")
```

How about we overlay the individual data points on the boxplot()...

```
>stripchart(list(old$pct.p5IL7pos_nvCD8, young$pct.p5IL7pos_nvCD8), vertical=T, method="jitter", col="red", pch=21, add=T)
```

From out - you can use RStudio to save the plots as images (.png), or to PDF, or copy them to the clipboard for use in another application.

Here's good example of using search - if you didn't know how to put the points on top of the boxplot - how would you go about figuring that out?  Try the google search "r overlay points on boxplot" - look at the first search result in stackoverflow.  Half the battle is just getting the question right.

[prev](RFilter.md) | [up](../README.md)  | [next](RExport.md)