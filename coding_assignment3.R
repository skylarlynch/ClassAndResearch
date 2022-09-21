# Coding assignment 3

# Question 1

number <- 100
while ( number <= 100 ) {
  number <- number - 1
  print(number)
}
# swap the placement of the expression and print

# Question 2

# Finds the number (y) that is the zth power of x

# Initialize parameters
x <- 3.2    #Any real number
z <- 3      #Any integer > 0

# Initialize working variables
y <- 1
counter <- 1

# Processing phase
for ( counter in 1:z ) {
  y <- y * x
}

# Termination phase
y

# Without changing the code z = 0, y = 10.24
# 1:10 y = 112590
# 1:3 y = 32.768
# 1:1 y = 3.2

# Question 3

fib <- c(1,1)
i <-3
while (fib[i-2]+fib[i - 1]<1000){
  fib[i]<- fib[i-2]+fib[i-1]
  i = i+1
}
fib

# Question 4 and 5 (oops I did 5 origionally, so I have nothing to modify)


num = 6
factorial = 1
# Rule out possibility that it's zero, because that makes life easier
 if(num == 0) {
  print("The factorial of 0 is 1")
} else { # Now I can actually do the factorial for every other positive integer 
  for(i in 1:num) {
    factorial = factorial * i
  }
  print(paste(factorial))
}


