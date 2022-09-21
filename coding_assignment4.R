# Question 2

# This program trains (fits) a simple linear model using the Nelder-Mead
# algorithm to find the minimum sum of squares.
# Brett Melbourne
# 1 Sep 2021

# Modified by Skylar Lynch for Class
# 21 Sep 2022




#----linmod()-----------------------
# A function for the linear model. This is the model algorithm.
# Returns a vector of y for the model:
#    y = b_0 + b_1 * x
# b_0: y intercept
# b_1: slope
#
linmod <- function(b_0, b_1, x) {
  y <- b_0 + b_1 * x
  return(y)
}


#----ssq_linmod() ------------------
# Returns the sum of squares for the linear model. This is set up for use with optim(). The first argument must be a vector of parameters.


ssq_linmod <- function(p, y, x) {
  y_pred <- linmod(b_0=p[1], b_1=p[2], x) 
  e <- y - y_pred 
  ssq <- sum(e^2)
  return(ssq)
}


#----Main Program--------------------------------------------------------------

#----Read in the data
# These are the same data used in the lectures.
linear_data <- read.csv("linear_data.csv")

# Plot the data
plot(linear_data$ï..x, linear_data$y)

# My R did something weird with the header when I entered the csv, but it works if I use that header label

# Train the model using the Nelder-Mead descent algorithm


# Initialize parameters 
b_0_start <- 150
b_1_start <- -6

# Finding the minimum SSQ


par <- c(b_0_start, b_1_start)  
fit <- optim(par, ssq_linmod, y=linear_data$y, x=linear_data$ï..x)
fit


# Calculate fitted model for best parameter values.

y_pred <- linmod(b_0=fit$par[1], b_1=fit$par[2], linear_data$ï..x)

# Plot fitted model with the data
points(linear_data$ï..x, y_pred, col="red")
abline(fit$par[1], fit$par[2], col="red")


# lm() for comparison.
lmfit <- lm(y ~ ï..x, data=linear_data)
lmfit 
anova(lmfit) 


# Question 3

#
linmod <- function(b_0, b_1, x) {
  y <- b_0 + b_1 * x
  return(y)
}


ssq_linmod <- function(p, y, x) {
  y_pred <- linmod(b_0=p[1], b_1=p[2], x) 
  e <- y - y_pred 
  ssq <- sum(e^2)
  return(ssq)
}



paramecium <- read.csv("paramecium.csv")

# Plot the data
plot(paramecium$ï..t, paramecium$N)

# My R did something weird with the header when I entered the csv, but it works if I use that header label

# Train the model using the Nelder-Mead descent algorithm


# Initialize parameters 
b_0_start <- 200
b_1_start <- -5

# Finding the minimum SSQ


par <- c(b_0_start, b_1_start)  
fit <- optim(par, ssq_linmod, y=paramecium$N, x=paramecium$ï..t)
fit


# Calculate fitted model for best parameter values.

y_pred <- linmod(b_0=fit$par[1], b_1=fit$par[2], paramecium$ï..t)

# Plot fitted model with the data
points(paramecium$ï..t, y_pred, col="red")
abline(fit$par[1], fit$par[2], col="red")

# lm() for comparison.
lmfit <- lm(N ~ ï..t, data=paramecium)
lmfit 
anova(lmfit) 
