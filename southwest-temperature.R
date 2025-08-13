# Map example
# Jeff Oliver
# jcoliver@arizona.edu
# 2025-07-30

library(terra)

if(!file.exists("southwest-temperature.tif")) {
  temp <- terra::rast(x = "https://raw.githubusercontent.com/jcoliver/learn-r/gh-pages/data/global-temperature.tif")
  sw_ext <- terra::ext(c(-125, -100, 30, 43))
  sw_temp <- terra::crop(temp, sw_ext)
  writeRaster(x = sw_temp, filename = "southwest-temperature.tif")
}

sw_temp <- terra::rast(x = "southwest-temperature.tif")
plot(sw_temp)

# Lajolla is another option
plot(sw_temp, col = hcl.colors(n = 50, palette = "Geyser"))

# No axes or legend:
plot(sw_temp, col = hcl.colors(n = 50, palette = "Geyser"),
     legend = FALSE, axes = FALSE)

# Write the plot to a png file
png(filename = "output/temperature.png",
    units = "mm",
    width = 148,
    height = 105,
    res = 300)
plot(sw_temp, col = hcl.colors(n = 50, palette = "Geyser"),
     legend = FALSE, axes = FALSE)
dev.off()

# For future plots, consider replacing the diamond plot with one that has 
# temperature and precipitation. Would be good to get another variable 
# (elevation?) for color, too.
prec <- terra::rast(x = "https://raw.githubusercontent.com/jcoliver/learn-r/gh-pages/data/global-precipitation.tif")
sw_prec <- terra::crop(prec, sw_ext)
plot(sw_prec)

prec_df <- as.data.frame(sw_prec, xy = TRUE)
temp_df <- as.data.frame(sw_temp, xy = TRUE)

plot_df <- cbind(prec_df, temp_df[, 1])
colnames(plot_df) <- c("lon", "lat", "prec", "temp")

ggplot2::ggplot(data = plot_df,
                mapping = aes(x = temp, y = prec, color = lat)) + 
  geom_point(alpha = 0.75) + 
  scale_color_gradientn(colours = hcl.colors(10, palette = "Geyser")) +
  theme_bw() +
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.text = element_blank())

  