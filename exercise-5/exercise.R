# Exercise 5: large data sets: Baby Name Popularity Over Time

# Read in the female baby names data file found in the `data` folder into a
# variable called `names`. Remember to NOT treat the strings as factors!
names <- read.csv("data/female_names.csv", stringsAsFactors = FALSE)

# Create a data frame `names_2013` that contains only the rows for the year 2013
selector <- names$year == 2013
names_2013 <- data.frame(names[["X.1"]][selector], names$X[selector],
  names$name[selector], names$prop[selector],
  names$year[selector],
  stringsAsFactors = FALSE
)
colnames(names_2013) <- c("X.1", "X", "name", "prop", "year")

# What was the most popular female name in 2013?
names_2013$name[names_2013$prop == max(names_2013$prop)]

# Write a function `most_popular_in_year` that takes in a year as a value and
# returns the most popular name in that year
most_popular_in_year <- function(year) {
  these_names <- data.frame(names$name[names$year == year],
                            names$prop[names$year == year],
                            stringsAsFactors = FALSE
  )
  colnames(these_names) <- c("name", "prop")
  these_names$name[these_names$prop == max(these_names$prop)]
}

# What was the most popular female name in 1994?
most_popular_in_year(1994)

# Write a function `number_in_million` that takes in a name and a year, and
# returns statistically how many babies out of 1 million born that year have
# that name.
# Hint: get the popularity percentage, and take that percentage out of 1 million.
number_in_million <- function(tname, year) {
  selector <- names$year == year
  tnames <- data.frame(names[["X.1"]][selector], names$X[selector],
                       names$name[selector], names$prop[selector],
                       names$year[selector],
                       stringsAsFactors = FALSE
  )
  colnames(tnames) <- c("X.1", "X", "name", "prop", "year")
  number <- length(tnames$name[tnames$name == tname])
  percentage <- number / length(tnames$name)
  round(percentage * 1000000)
}

# How many babies out of 1 million had the name 'Laura' in 1995?
number_in_million("Laura", 1995)

# How many babies out of 1 million had your name in the year you were born?
number_in_million("Robin", 1999)

## Consider: what does this tell you about how easy it is to identify you with
## just your name and birth year?
# Pretty easy, although I am not a female.
