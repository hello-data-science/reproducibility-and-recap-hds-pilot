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
