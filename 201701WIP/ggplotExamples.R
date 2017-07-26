#
# WIP: Example plots from Christian's Data
#
# Scott Presnell, SPresnell@benaroyaresearch.org
# Thu Jan 19 08:20:05 2017 ------------------------------
#

# Read in Excel files, requires rJava
if (!require('xlsx')) install.packages('xlsx'); library('xlsx')
# alternatives: readxl, openxlsx. First parameter is different, both read with default stringsAsFactors=F
# this code for read.xlsx() assumes stringsAsFactors=T

# need melt
if (!require('reshape2')) install.packages('reshape2'); library('reshape2')

# plot with ggplot2
if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')

# arrange multiple plots on a grid
if (!require('gridExtra')) install.packages('gridExtra'); library('gridExtra')

##########
##########  Example One
##########

# read in the data, on the first worksheet
wip <- read.xlsx(file="WIPExampleData.xlsx", sheetIndex=1)

# What's it look like?
dim(wip) # can also use Environment Tab
str(wip) # can also use Environment Tab
summary(wip) # Statistical summary

#
# gg - (Layered) Grammar of Graphics
# http://vita.had.co.nz/papers/layered-grammar.pdf
#
# A blank canvas
ggplot(data=wip, aes(x=Genotype, y=Total.CD4))

# Lets use this as a base
base <- ggplot(data=wip, aes(x=Genotype, y=Total.CD4))

# First plot just a boxplot
base + geom_boxplot()

# Second Plot, with points
base + geom_boxplot() + geom_point()

# Third plot - find those pesky overlapping data points
base + geom_boxplot(outlier.shape=NA) + geom_jitter()

# These aren't what we're used to looking at - can we make them a little more narrow, add some color for groups, and error bars
ggplot(data=wip, aes(x=Genotype, y=Total.CD4, color=Genotype)) +
  stat_boxplot(geom="errorbar", width=0.15) +
  geom_boxplot(outlier.shape=NA, width=0.15) + 
  geom_jitter(width=0.07) +
  labs(title="IFN-alpha pSTAT1 MFI Response of Total CD4")

# Update our base to include color group by Genotype, make a canvas for CD4 Naive as well.
base <- ggplot(data=wip, aes(x=Genotype, y=Total.CD4, color=Genotype))
base2 <- ggplot(data=wip, aes(x=Genotype, y=CD4.naïve, color=Genotype))

#  Examples of Violin Plots.
base + geom_violin(width=0.25)
# Fill the entire violin with color.
base + geom_violin(aes(fill=Genotype), width=0.25)
base + geom_violin(width=0.25) + geom_jitter(width=0.02)
base + geom_violin(width=0.25) + geom_boxplot(width=0.05)
base + geom_violin(width=0.25) + geom_boxplot(outlier.shape=NA, width=0.05) + geom_jitter(width=0.02)

# Let's create a collection of these and display them in a grid.
# boxplot, with points
p1 <- base +
  stat_boxplot(geom="errorbar", width=0.15) +
  geom_boxplot(outlier.shape=NA, width=0.15) +
  geom_jitter(width=0.07) +
  labs(title="IFN-alpha pSTAT1 MFI Response of Total CD4")

# scatter/strip plot with bars and mean closer to original plots
p2 <- base2 +
  geom_jitter(width=0.07, aes(fill=Genotype), color="black", shape=21) +
  stat_boxplot(geom="errorbar", width=0.15) +
  stat_summary(fun.y="mean", color="black", size=2, geom="point") +
  labs(title="IFN-alpha pSTAT1 MFI Response of Naïve CD4")

# Lets take a look at violin plots too, with embedded boxplot
p3 <- base +
    geom_violin(width=0.25) +
    geom_boxplot(width=0.05) +
    labs(title="IFN-alpha pSTAT1 MFI Response of Total CD4")

# or with just the points.
p4 <- base2 +
  geom_violin(width=0.25) +
  geom_jitter(width=0.05, shape=17) +
  labs(title="IFN-alpha pSTAT1 MFI Response of Naïve CD4")

# Create a grid of plots
grid.arrange(p1, p2, p3, p4, nrow=2)

#
# Let's get as close to Christian's plot as possible.
#
# Look at the wip data again.
View(wip)
#
# Reorganize the data so that we can use groups and facets to create a larger plot.
wip.melt <- melt(wip, value.name="MFI", variable.name="Celltype")
#
# Look at the melted data

# Plot the melted data grouping by genotype, with Celltype facets, add error bar, and label.
ggplot(data=wip.melt, aes(x=Genotype, y=MFI, color=Genotype)) +
  facet_grid(~Celltype) +
  stat_boxplot(geom="errorbar", width=0.15) +
  geom_boxplot(outlier.shape=NA, width=0.15) +
  geom_jitter(width=0.07) +
  labs(title="IFN-alpha pSTAT1 CD4/CD8 MFI Response")

# Explain that statistical tests and plotting are separate

# How do we get significance info on the plot?  Create a plot to work with:
s <- ggplot(data=wip.melt, aes(x=Genotype, y=MFI, color=Genotype)) + facet_grid(~Celltype) + stat_boxplot(geom="errorbar", width=0.15) + geom_boxplot(outlier.shape=NA, width=0.15) + geom_jitter(width=0.07) + labs(title="IFN-alpha pSTAT1 CD4/CD8 MFI Response", caption="All tests Mann-Whitney")

# Create a dataframe holding the locations and text to apply to the plot
annot <- data.frame(Genotype=c("NP/NP", "NP/NP"),
                       MFI=c(1515,1515),
                       text=c("p < 0.037", "p < 0.16 (ns)"),
                       Celltype=factor(c("Total.CD4", "CD4.memory"), levels=levels(wip.melt$Celltype)))

# Add that object to the plot and render it.
s + geom_text(data=annot, aes(label=text), color="black", hjust=0)

# Break it out into individual plots, by subsetting the data based on cell type, CD4 or CD8 in Celltype as a string.
p5 <- ggplot(data=subset(wip.melt, grepl("CD4", Celltype)), aes(x=Genotype, y=MFI, color=Genotype)) + facet_grid(~Celltype) + stat_boxplot(geom="errorbar", width=0.15) + geom_boxplot(outlier.shape=NA, width=0.15) + geom_jitter(width=0.07) + labs(title="IFN-alpha pSTAT1 CD4 MFI Response")
p6 <- ggplot(data=subset(wip.melt, grepl("CD8", Celltype)), aes(x=Genotype, y=MFI, color=Genotype)) + facet_grid(~Celltype) + stat_boxplot(geom="errorbar", width=0.15) + geom_boxplot(outlier.shape=NA, width=0.15) + geom_jitter(width=0.07) + labs(title="IFN-alpha pSTAT1 CD8 MFI Response")

# render onto a grid, and also save the object.
mfp <- grid.arrange(p5, p6, nrow=1)

# write it out to a pdf.
ggsave(file="plot1.pdf", mfp)

##########
##########  Example Two
##########

#
# Example Two, stim data:
#
wip3 <- read.xlsx(file="WIPExampleData.xlsx", sheetIndex=3)

# First shot...
ggplot(data=wip3, aes(x=TYK2.rs34536443, y=CD4.Memory.MFI.pSTAT1, color=TYK2.rs34536443)) +
  facet_grid(~Stim) +
  geom_boxplot(outlier.shape=NA, width=0.15) +
  geom_jitter(width=0.07)

# Create a new column with our perferred ordering
wip3$oStim <- factor(wip3$Stim, levels=c("unstim", "IFN b (50 U/ml)", "IFN b (100 U/ml)"))

# Facet by ordered stim, add coord_transform, and error bars.
ggplot(data=wip3, aes(x=TYK2.rs34536443, y=CD4.Memory.MFI.pSTAT1, color=TYK2.rs34536443)) +
  facet_grid(~oStim) +
  stat_boxplot(geom="errorbar", width=0.15) + 
  geom_boxplot(outlier.shape=NA, width=0.15) +
  geom_jitter(width=0.07) +
  coord_trans(y="log10") +
  labs(x="Tyk2 rs34536443", y=expression(paste("IFN", beta, " MFI of pSTAT1 Response on CD4 Memory Cells")))

# Facet by genotype, angle the x-axis labels
ggplot(data=wip3, aes(x=oStim, y=CD4.Memory.MFI.pSTAT1, color=oStim)) +
  facet_grid(~TYK2.rs34536443) +
  stat_boxplot(geom="errorbar", width=0.15) +
  geom_boxplot(outlier.shape=NA, width=0.15) +
  geom_jitter(width=0.07) +
  coord_trans(y="log10") +
  labs(x="Tyk2 rs34536443", y=expression(paste("IFN", beta, "MFI of pSTAT1 Response on CD4 Memory Cells"))) +
  theme(axis.text.x=element_text(angle=15, hjust=1))

#
# OK back on task... Just want the 100U/ml data, so subset for the string "100" in the Simulation column
# Fix the y scale to be the same on both plots, use the y-axis label in the first plot, but turn off the legend/guides
#
pA <- ggplot(data=subset(wip3, grepl(pattern="100", oStim)),
             aes(x=TYK2.rs34536443, y=CD4.Naïve.MFI.pSTAT1, color=TYK2.rs34536443)) +
  geom_boxplot(outlier.shape=NA, width=0.15) +
  geom_jitter(width=0.07) + 
  coord_trans(y="log10") + 
  ylim(250, 1100) + 
  labs(x="Tyk2 rs34536443", y="MFI", title=expression(paste("MFI of pSTAT1 CD4 Naïve (100 U/ml IFN", beta, ")"))) +
  guides(color=F)

pB <- ggplot(data=subset(wip3, grepl(pattern="100", oStim)),
             aes(x=TYK2.rs34536443, y=CD4.Memory.MFI.pSTAT1, color=TYK2.rs34536443)) +
  geom_boxplot(outlier.shape=NA, width=0.15) +
  geom_jitter(width=0.07) +
  coord_trans(y="log10") +
  ylim(250, 1100) +
  labs(x="Tyk2 rs34536443", y="", title=expression(paste("MFI of pSTAT1 CD4 Memory (100 U/ml IFN", beta, ")"))) +
  guides(color=F)

mfp <- grid.arrange(pA, pB, nrow=1)

# save my favorite plot
ggsave(file="plot3.pdf", mfp)

