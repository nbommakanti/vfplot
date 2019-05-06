# Generate 24-2 map
# -------------------------------------------------
# Generate grid of coordinates
x <- seq(-27, 21, by = 6)
y <- seq(-21, 21, by = 6)
vf_map <- expand.grid(x = x, y = y)

# Number starting at the top left and going by rows
vf_map <- with(vf_map, vf_map[order(-y, x),])

# Add location numbers
rownames(vf_map) <- c() # reset row names
vf_map$location <- as.factor(seq(1:nrow(vf_map)))

# Keep vf_map for legacy. Also save 24-2 version
vf_map_24d2 <- vf_map

##==============================================================
# Generate 10-2 map
# -------------------------------------------------
# Generate grid of coordinates
x <- seq(-9, 9, by = 2)
y <- seq(-9, 9, by = 2)
vf_map_10d2 <- expand.grid(x = x, y = y)

# Number starting at the top left and going by rows
vf_map_10d2 <- with(vf_map_10d2, vf_map_10d2[order(-y, x),])

# Add location numbers
rownames(vf_map_10d2) <- c() # reset row names
vf_map_10d2$location <- as.factor(seq(1:nrow(vf_map_10d2)))

##==============================================================
# Generate 30-2 map
# Generate grid of coordinates
x <- seq(-27, 27, by = 6)
y <- seq(-27, 27, by = 6)
vf_map_30d2 <- expand.grid(x = x, y = y)

# Number starting at the top left and going by rows
vf_map_30d2 <- with(vf_map_30d2, vf_map_30d2[order(-y, x),])

# Add location numbers
rownames(vf_map_30d2) <- c() # reset row names
vf_map_30d2$location <- as.factor(seq(1:nrow(vf_map_30d2)))


##==============================================================
# Save
usethis::use_data(vf_map_10d2, overwrite = T)
usethis::use_data(vf_map_24d2, overwrite = T)
usethis::use_data(vf_map_30d2, overwrite = T)


