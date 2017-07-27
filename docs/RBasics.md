### R Language Programming

## Basic Math

Basic math operators are available:

```
> 7 + 4
[1] 11
> 6 / 2
[1] 3
```

## Assignment Operator

To assign a variable, you can use either ```<-```  or ```=```  Both will work for most situations, we will bring it to your attention when one or the other is requred.
For more on the history and difference see this [stackoverflow discussion of '<-' vs '=' in R](https://stackoverflow.com/questions/1741820/assignment-operators-in-r-and)

```
>a <- 4 + 5
>print(a)
[1] 9
>b = 9 / 3
>print(b)
[1] 3
```

## Printing

You can use the ```print()``` function, but usually **R** is smart enough to know what to do when you just type the variable name at the prompt:

```
>print(a)
[1] 9
>a
[1] 9
```

## Getting Help

Inside R, at the console, try ```?```:

```
>?mean
```

This works if function is available in your environment, if not try ```??```:

```
>??princomp
```

[Stackoverflow](https://stackoverflow.com/questions/tagged/r), part of the stackechange group, is is an excellent place to look for answers to programming questions or issues. See [the stats stackechange site](http://stats.stackexchange.com) for more statistics oriented questions.

Later in the course, we will discuss Biocondutor packages - Bioconductor also has it's own [help forum](https://support.bioconductor.org/).

[prev](RIntro.md) | [up](../README.md) | [next](RDataTypes.md)
