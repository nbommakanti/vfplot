# Generate grid of coordinates
x <- seq(-27, 21, by = 6)
y <- seq(-21, 21, by = 6)
vf_map <- expand.grid(x = x, y = y)

# Number starting at the top left and going by rows
vf_map <- with(vf_map, vf_map[order(-y, x),])

# Add location numbers
rownames(vf_map) <- c() # reset row names
vf_map$location <- as.factor(seq(1:nrow(vf_map)))
