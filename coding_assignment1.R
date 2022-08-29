#Question 1

student_grade <- 75
if ( student_grade < 60 )
  print("Failed")
print("You need to take the course again")

# There is a lack of brackets 

student_grade <- 75
if ( student_grade < 60 ) {
  print("Failed")
print("You need to take the course again")
}

# Question 2

grades <- read.csv("02_1_grades.csv")
class_grades <- grades$class1
if ( mean(class_grades) < 60 ) {
  adj <- 60 - mean(class_grades)         #calculate adjustment
  class_grades <- class_grades + adj     #adjust the original grades
  message <- "Mean for raw grades was a fail: grades adjusted"
}
if ( mean(class_grades) >= 60 ) {
  message <- "Average grade was a pass: no adjustment made"
}
print(message)
print(class_grades)    #Should now be adjusted if necessary

# The problem is that the "if" functions are independent, so you have two seperate and unrelated funtions. What happens when one doesn't have anything to print?

# Question 3

grades <- read.csv("02_1_grades.csv")
class_grades <- grades$class1
if ( mean(class_grades) < 60 ) {
  adj <- 60 - mean(class_grades)         #calculate adjustment
  class_grades <- class_grades + adj     #adjust the original grades
  message <- "Mean for raw grades was a fail: grades adjusted"
} else if ( mean(class_grades) >= 60 ) {
  message <- "Average grade was a pass: no adjustment made"
}
print(message)
print(class_grades)    #Should now be adjusted if necessary

# The double selection structure works significantly better! This is because the two statements are linked and can fully solve the problem as intended. I don't know if that was the most elequent wording of it

# Question 4

y <- 3
x <- 1

pattern <- NULL
if ( y == 2 )
  if ( x == 1 ) {
    pattern <- c(pattern,"@")
      } else 
    pattern <- c(pattern,"#")
    pattern <- c(pattern,"$")
    pattern <- c(pattern,"&") {
    print(pattern,quote=FALSE)
}

# I'm going to be completely honest, I couldn't figure this out to save my life! I tried for hours and google was no help either
    
# Question 5
    
   
      
      number <- 12321
      reverse <- 12321
      
      if (reverse == number)
      {
        print(paste("Number is palindrome :", number))
      } else if (reverse != number) {
        print(paste("Number is not palindrome :" ))
      }
    
      # If I was able to use other funtions I would use "rev", "num" and "as.integer" 
