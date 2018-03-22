# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste("Employee", 1:100)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries_2017 <- runif(100, 40000, 50000)

# Create a vector of 100 salaries in 2018 that have changed from 2017
# Use `runif()` to add a random number between -5000 and 10000 to each of 2017's
# salaries (the negative number means that a salary may have decreased!)
salaries_2018 <- salaries_2017 + runif(100, -5000, 10000)

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salaries_2017, salaries_2018, stringsAsFactors=FALSE)

# Create a column 'change' that stores each person's change in salary between
# 2017 and 2018
salaries$change <- salaries_2018 - salaries_2017

# Create a column 'got_raise' that is TRUE if the person got a raise (their
# salary went up)
salaries$got_raise <- salaries$change > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of employee 57
salary_57 <- salaries[salaries$employees == "Employee 57", "salaries_2018"]

# How many employees got a raise?
nrow(salaries[salaries$got.raise == TRUE, ])

# What was the dollar value of the highest raise?
highest_raise <- max(salaries$change)

# What was the "name" of the employee who received the highest raise?
got_biggest_raise <- salaries[salaries$change == highest_raise, "employees"]

# What was the largest decrease in salaries between the two years?
biggest_paycut <- min(salaries$change)

# What was the name of the employee who recieved largest decrease in salary?
got_biggest_paycut <- salaries[salaries$change == biggest_paycut, "employees"]

# What was the average salary change?
avg_increase <- mean(salaries$change)

# For people who did not get a raise, how much money did they lose on average?
avg_loss <- mean(salaries$change[salaries$got_raise == FALSE])

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv(salaries, 'salaries.csv')
