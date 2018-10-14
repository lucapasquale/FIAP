


train %>% 
  group_by(pickup.cell.x, pickup.cell.y) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) -> train.cell.count

terminal.lat = c(40.6472841, -73.8143184)



ggplot(train.cell.count, aes(pickup.cell.x, pickup.cell.y)) +
  geom_tile(aes(fill = count), color = "red") +
  scale_fill_gradient(low = "white", high = "steelblue") +
  coord_cartesian(xlim=c(2350, 2550), ylim=c(775, 975)) +
  # ylab("List of genes ") +
  # xlab("List of patients") +
  theme(legend.title = element_text(size = 10),
        legend.text = element_text(size = 12),
        plot.title = element_text(size=16),
        axis.title=element_text(size=14,face="bold"),
        axis.text.x = element_text(angle = 90, hjust = 1))
  # labs(fill = "Expression level")


train %>% 
  filter(between(pickup_latitude, 40.64, 40.65)) %>% 
  filter(between(pickup_longitude, -73.78, -73.79)) -> train.jfk

jfk_map <- get_map(location = c(lon = 40.6441666667, lat = -73.7822222222), maptype = "roadmap", zoom = 11)

ggmap(jfk_map, extent = "device") +
  geom_point(aes(x=pickup_longitude, y=pickup_latitude), colour="red", alpha=0.1, size=1, data=train.jfk)
