# Diamond plot as data science example
# Jeff Oliver
# jcoliver@arizona.edu
# 2025-07-30

library(ggplot2)
library(dplyr)

# Note uses slice_sample, so each plot may differ slightly
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
