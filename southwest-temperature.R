# Map example
# Jeff Oliver
# jcoliver@arizona.edu
# 2025-07-30

library(terra)

sw_temp <- terra::rast(x = "southwest-temperature.tif")
plot(sw_temp)

# Lajolla
plot(sw_temp, col = rev(hcl.colors(n = 50, palette = "Geyser")))
?terra::plot