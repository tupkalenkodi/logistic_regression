library(tidyverse)


# Create the lung cancer data frame with counts for each cancer/smoking case
df = data.frame(
  lung_cancer = c(1, 1, 0, 0),  # 1 = lung cancer, 0 = control
  smoking_status = c(1, 0, 1, 0),  # 1 = smoker, 0 = non-smoker
  count = c(688, 21, 650, 59)  # Counts
)

# Expand it for fitting
expanded_df = df |> 
  uncount(count)

# Fit the model
logistic = glm(lung_cancer ~ smoking_status, 
                      data = expanded_df, 
                      family = binomial)
summary(logistic)
