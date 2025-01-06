library(tidyverse)


# Read the dataset
df = read.table("https://users.stat.ufl.edu/~aa/glm/data/Crabs.dat", header = TRUE)

# Transform the dataset as in the description of the exercise
df_tr = df |> 
  mutate(y = ifelse(y >= 1, 1, 0))

# Fit the main-effect model
main_effect_logistic = glm(y ~ color + weight, data = df_tr, family = binomial)
summary(main_effect_logistic)

# Fit the interaction model
interaction_logistic = glm(y ~ color * weight, data = df_tr, family = binomial)
summary(interaction_logistic)

exp(-0.3378) / (1 + exp(-0.3378)) 