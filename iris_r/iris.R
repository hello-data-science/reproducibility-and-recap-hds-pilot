# explore iris dataset

# plot petal length by petal width, colour species
library(ggplot2)

# Load the iris dataset
data(iris)

# Create the plot
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point() +
  labs(title = "Petal Length vs Petal Width by Species",
       x = "Petal Length",
       y = "Petal Width") +
  theme_minimal()

# logistic regression model to discriminate between virginica species and non-virginica
iris$IsVirginica <- ifelse(iris$Species == "virginica", 1, 0)
logreg_model <- glm(IsVirginica ~ Petal.Length + Petal.Width, data = iris, family = binomial)

# Re-do earlier plot, now with linear discrimination line from logreg model
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point() +
  labs(title = "Petal Length vs Petal Width by Species",
       x = "Petal Length",
       y = "Petal Width") +
  theme_minimal() +
  geom_abline(intercept = -coef(logreg_model)[1] / coef(logreg_model)[3], 
              slope = -coef(logreg_model)[2] / coef(logreg_model)[3], 
              color = "black", linetype = "dashed")

