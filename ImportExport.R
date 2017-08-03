#
# read in example data
#
data <- read.csv("data/example.csv", row.names=1)

#
# get the "str"ucture of the data
#
str(data)

#
# Testing for NAs
#
is.na(data$pct.p5IL7pos_nvCD8)
#
# show a truth table
table(is.na(data$pct.p5IL7pos_nvCD8))
#
# are there any true objects in the vector
any(is.na(data$pct.p5IL7pos_nvCD8))

#
# Comparing two groups of patients, old and young with a cutoff age of 32
#
cutoff <- 32

data$age < cutoff

which(data$age > 32)

data[which(data$age > 32), ]

old <- data[which(data$age > 32), ]

young <- data[which(data$age <= 32), ]

plot(density(young$pct.p5IL7pos_nvCD8))
