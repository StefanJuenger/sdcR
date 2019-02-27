
# load package
library(magrittr)

# fancy comment
x <- 1
x
y # produces an error

# shoot, doesn't work
bla <- "bla"

plot(1:100)


y <-
  x %>%
  sum(c(., 2))
y

