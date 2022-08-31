#Question 1 - In class work

n <- 2
while ( n <= 1000 ) {
  n <- n * 2
}
print(n)

x <- 2
z <- 3
i <- 1
y <- x

while ( i < z ) {
  y <- y * x
  i <- i + 1
}
print(y)

#Question 2 - Linear Regression

#Really simple linear model
df = data.frame(x=c(1, 2, 4, 5, 5, 5, 6, 8, 10, 12),
                y=c(12, 14, 14, 16, 17, 19, 22, 26, 24, 22))

model <- lm(y ~ x, data=df)

summary(model)

#The chunk from my code for the linear model for my actual research. It is copy and pasted, but needs things in the code above it to run, just thought I'd share!

```{r, include = TRUE}
Species_list <- sp_sum_df_30$species

# Create empty data frame with 0 rows and 3 columns
df <- data.frame(matrix(ncol = 3, nrow = num_30))

# Provide column names
colnames(df) <- c("species", "pValue", "R2")

# Run a linear regression
for (i in 1:length(Species_list)) {
  df$species[[i]] <- Species_list[[i]]
  species_data <- data_csv %>% dplyr::filter(species == Species_list[i])
  sum <- summary(lm(Day.of.the.year ~ Year, data = species_data))
  df$pValue[[i]] <- round(sum$coefficients[8], 4)
  df$R2[[i]] <- round(sum$r.squared, 4)
}

# Sort the species by p value, lowest to highest
df <- df %>%
  dplyr::arrange(pValue)

write.csv(x = df,
          file = paste0(Results.fp, "/", location, "_LinearRegression_species.csv"))
```
#Question 3

#To determine the work flow of the algorithm I used for the super simple lm, I knew it would start with inputting the variables, determining x and y, then it flows to the linear model, where I define what is being tested on what, and where it is being pulled from. Then it outputs the model. 

