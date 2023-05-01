library(ggplot2)
library(readxl)
library(tidyverse)
library(scales)
library(ggrepel)
library(geomtextpath)


GDP_data <- read_excel("C:/Users/hassa/Downloads/QNA-2022-Q4-Tables-1.xlsx", 
                       sheet = "GDP") %>% as_tibble()

year_labels <- seq(from=2004,to=2022,by=1)

head(GDP_data)


GDP_data %>% arrange(Year, Quarter) %>% select(1, 2, Tourism) %>%
  ggplot(aes(
    x = Year,
    y = Tourism,
    fill = GDP_data$Quarter,
    color = GDP_data$Quarter
  )) +
  geom_line(size = 1.5) +
  geom_point(size = 3.5) +
  # scale_y_continuous(
  #   breaks = seq(min(GDP_data$Tourism),max(GDP_data$Tourism)) )+
  scale_x_continuous(
    breaks = seq(min(GDP_data$Year),max(GDP_data$Year),by=2) )+
  theme_minimal()+
  theme(
    legend.background = element_blank(),
    legend.box.background = element_blank(),
    plot.margin = margin(50,50,20,20, "pt")
    
    
  )


ggsave(
  "GDPplot.pdf",
  plot = last_plot(),
  device = "pdf",
  dpi = 320,
  width = c(18,("cm")),
  height = c(18,("cm"))
)