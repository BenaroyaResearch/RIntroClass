#
# Basic Examples
#
a <- 4 + 5
print(a)

b = 9 / 3
print(b)

# Print is the same as just typing the variable
print(a)
a

#
# Help function
?mean

#
# Apropos function
??princomp

#
# Vectors - create two vectors of data
m.height <- c(72, 74, 78, 68, 70, 69, 75)
f.height <- c(68, 66, 67, 64, 61, 60, 60)
class(f.height)

#
# Interrogate them with mean, standard deviation, and summary statistics
mean(f.height)
sd(f.height)
summary(f.height)
summary(m.height)

#
# Run your first t-test
t.test(m.height, f.height)

#
# Matrices
M <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), byrow=T, nrow=3)
# Sum over entire matrix
sum(M)
# Transpose a matrix
t(M)

#
# Lists
l <- list(height=c(50, 60, 58, 55, 62), mean=57, 4.690416)

# getting at sub-elements of a list
l[[2]]

l[["height"]]

l$mean

#
# Factors
g <- factor(c("F", "M", "F", "F", "M"))

#
# Data frames
df<- data.frame(gender=factor(c("F", "M", "F", "F", "M")), height=c(50, 60, 58, 55, 62), SLEDAI=c(5, 1, 3, 4, 1))

#
# Structure of an object
str(df)

#
# Rownames, like column names
rownames(df) <- c("Patient A", "Patient B", "Patient C", "Patient D", "Patient E")
