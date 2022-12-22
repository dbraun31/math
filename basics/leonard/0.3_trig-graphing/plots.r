library(tidyverse)

d <- data.frame(x = seq(0,10, by = .001))

f <- function(x) {
    return(sin(x))
}

g <- function(x) {
    return(2 * sin(4 * x))
}

d$no_coeff <- f(d$x)

d$coeff <- g(d$x)

d %>%
  gather(method, y, no_coeff:coeff) %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = method)) + 
  theme_bw()

ggsave('fig1.pdf', height = 3, width = 5)
