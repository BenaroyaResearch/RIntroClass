#
# WIP: Basic into to R
#
# Scott Presnell, SPresnell@benaroyaresearch.org
# Thu Jan 19 08:22:40 2017 ------------------------------


# Perform simple arithmatic
4 + 3
# perform logical tests
4 > 3
# Assign an object to the result of a 
# In most cases '<-' is equivalent to '=' - historical accident.  My fingers are tied to '<-'
a <- 4 + 3
# Ask for the value of an object
a
# Create a vector of numbers
v <- c(3, 4, 8, 9, 11)
# Square all the elements in v
v^2
# Use a builtin function
mean(v)
# get more information:
summary(v)
# Get Help
?median

###
###
###

# Read in a comma separated values file (CSV) into table - a data.frame object
e <- read.csv("Rexample.csv")
# What are the dimensions of the table?
dim(e)
# Show me the first few lines of the table (occasionally UNIX functions/programs show up in R)
head(e)
# Where is a good cutoff to break age into young and old?
mean(e$age)
# Get the old and the young into separate tables. by asking which rows meet your age based criteria
young <- e[which(e$age <= 32), ]
old <- e[which(e$age > 32), ]
dim(young)
dim(old)
#summary(young)
#summary(old)
# We have missing data - will this work?
plot(density(young$pct.p5IL7pos_nvCD8))
# why not?
?density
# Nope - have to remove the NAs - this command creates the first plot of the 'young' values
plot(density(young$pct.p5IL7pos_nvCD8, na.rm=TRUE), col="red", main="Density Plot", xlab="Percentages", ylab="Density")
# Second command draws over the top of the existing plot
lines(density(old$pct.p5IL7pos_nvCD8, na.rm=TRUE), col="blue")
# Finally the t.test (builtin) we've all been waiting for...
t.test(old$pct.p5IL7pos_nvCD8, young$pct.p5IL7pos_nvCD8, na.rm=T)

# If there's time: boxplot of both
boxplot(old$pct.p5IL7pos_nvCD8, young$pct.p5IL7pos_nvCD8, names=c("Old", "Young"), ylab="Percent", main="Compare Old to Young")

# Add the points on top:
stripchart(list(old$pct.p5IL7pos_nvCD8, young$pct.p5IL7pos_nvCD8), vertical=T, method="jitter", col="red", pch=21, add=T)


