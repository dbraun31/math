library(tidyverse)

#### tangent line ####

d <- data.frame(x = 0:10)

f <- function(x) {
    return(x^2)
}

d$y <- f(d$x)

## pick two points 
points <- data.frame(label = c('p', 'g'), x = c(2, 6))
points$y <- f(points$x)

## find the line for those points

find_slope <- function(point1, point2) {
    return((point2[2] - point1[2]) / (point2[1] - point1[1]))
}

slope <- find_slope(unlist(points[1,2:3]), unlist(points[2,2:3]))

## y = mx + b
## y - mx = b
find_intercept <- function(point, slope) {
    return(point[2] - slope * point[1])
}

intercept <- find_intercept(unlist(points[1,2:3]), slope)

linear <- function(x, intercept, slope) {
    return(intercept + x * slope)
}

calculate_secant <- function(x, point1, point2) {
    slope <- find_slope(point1, point2)
    intercept <- find_intercept(point1, slope)
    return(linear(x, intercept, slope))
}
d$secant <- linear(d$x, intercept, slope)

plot_all <- function(d) {
    d %>% 
        ggplot(aes(x = x, y = y)) + 
        geom_line(size = 2) + 
        geom_line(aes(y = secant), color = 'blue') + 
        geom_point(data = points, size = 2.5, color = 'yellow') + 
        ggrepel::geom_label_repel(data = points, aes(label = paste0(label, ': (', x, ', ', y, ')')), 
                   vjust = .5, hjust = -.75) + 
        theme_bw()
}

plot_all(d)

ggsave('secant.pdf', height = 3.5, width = 3.5)


## move the lines close together

x <- 2.1
points[2,] <- data.frame(label = 'g', x = x, y = f(x))
d$secant <- calculate_secant(d$x, unlist(points[1,2:3]), unlist(points[2,2:3]))

plot_all(d)

ggsave('updated_secant.pdf', height = 3.5, width = 3.5)

## plot tangent line at (1,1)

d$tangent <- 2 * d$x -1
points <- data.frame(x = 1, y = 1)

d %>% 
    ggplot(aes(x = x, y = y)) + 
    geom_line(size = 2) + 
    geom_line(aes(y = tangent), color = 'blue') + 
    geom_point(data = points, size = 2.5, color = 'yellow') + 
    theme_bw()

ggsave('tangent.pdf', height = 3.5, width = 3.5)

## i used to have code here plotting the function 1/x but i didnt save it whoops











