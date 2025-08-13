# Diamond plot as data science example
# Jeff Oliver
# jcoliver@arizona.edu
# 2025-07-30

library(ggplot2)
library(dplyr)

# Note uses slice_sample, so each plot may differ slightly
diamond_plot <- ggplot(data = diamonds %>% 
         filter(x > 3) %>% # drop rows with x = 0
         slice_sample(n = 10000),
       mapping = aes(x = x, y = price, color = color)) + 
  geom_point(mapping = aes(size = carat), alpha = 0.75) + 
  discrete_scale(aesthetics = "color",
                 palette = \(x) hcl.colors(n = 7, palette = "Geyser")) + 
  theme_bw() +
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.text = element_blank())
diamond_plot
ggsave(filename = "output/diamonds.png",
       plot = diamond_plot,
       units = "mm",
       width = 148,
       height = 105)

# Earlier attempts with different palettes & variables
ggplot(data = diamonds %>% slice_sample(n = 100), 
       mapping = aes(x = x, y = y)) + 
  geom_density_2d_filled(contour_var = "count") + 
  geom_density_2d(color = "#000033", linewidth = 0.05) + 
  scale_fill_viridis_d(option = "mako", direction = -1) + 
  theme_bw() + 
  theme(legend.position = "none", 
        axis.title = element_blank())

ggplot(data = diamonds %>% slice_sample(n = 100), 
       mapping = aes(x = x, y = y)) + 
  geom_density_2d_filled(contour_var = "count") + 
  geom_density_2d(color = "#000033", linewidth = 0.05) + 
  # discrete_scale(aesthetics = "fill", 
  #                palette = \(x) rev(hcl.colors(x, 'Lajolla'))) +
  discrete_scale(aesthetics = "fill", 
                 palette = \(x) rev(hcl.colors(x, 'YlGn'))) +
  theme_bw() + 
  theme(legend.position = "none", 
        axis.title = element_blank())

# Want a palette based on one half of the Geyser palette
geyser_left <- hcl.colors(n = 5, palette = "Geyser")[1:3]

ggplot(data = diamonds %>% slice_sample(n = 100), 
       mapping = aes(x = x, y = y)) + 
  geom_density_2d_filled(contour_var = "count") + 
  geom_density_2d(color = "#000033", linewidth = 0.05) + 
  discrete_scale(aesthetics = "fill",
                 palette = \(x) rev(colorRampPalette(geyser_left)(x))) +
  theme_bw() + 
  theme(legend.position = "none", 
        axis.title = element_blank())

ggplot(data = diamonds %>% slice_sample(n = 1000),
       mapping = aes(x = x, y = price, color = color)) + 
  geom_point() + 
  discrete_scale(aesthetics = "color",
                 palette = \(x) rev(colorRampPalette(geyser_left)(x)))



