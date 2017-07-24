# R language Programming

## Introduction

* What is R
* What R is not
* Some details about R
	* Interpreted, Interactive Language
	* Statistical analysis, filtering, transforming, plotting
	* Based on previous languages, S, S-plus - previous work to lean on
* Packages
	* CRAN: package repository
	* Bioconductor: specific packages for Bioinformatics
	
## R Studio
* R Studio is an Integrated Development Environment (IDE)
* Why use R Studio?
	* Script Managment
	* Project Management (multiple scripts)
	* Help, Plots, History, Visualizations in one place
* Why Scripts
	* Sequence of loading libraries, function calls to create an analysis or plot
	* Most Importantly: **Reproducible Research** - write scripts to reproducibly run your analysis
* Four sections:
	* Editor - write R code
	* History, Environment - see what you've done; your current variables and functions.
	* Files, Plots, Help
	* Console - interaction with R interpreter

## Getting Help
Inside R, at the console:

```
? as in ?mean
```

Works if function is available in your environment, if not try:

```
?? as in ??vegan
```
