#Instagram analysis
require(ggplot2)
require(ggthemes)
require(chron)
library(scales)
names(zoo)[1] <- "Date"
zoo$Date2 <- as.Date(zoo$Date, format = "%m/%d/%Y")
ggplot(zoo, aes(x=Date2, y=Likes)) + 
  geom_point(colour = "mediumseagreen") + 
  #geom_line() +
  geom_smooth(method="loess", se=F) + 
  #xlim(c(0, 0.1)) + 
  ylim(c(0, 6000)) + 
  labs(subtitle="(taking note of the death of Harambe)", 
       y="Number of Likes", 
       x="Month", 
       title="Number of Instagram Likes over time (April 1st, 2016 - July 30th, 2016)", 
       caption = "Source: Cincinnati Zoo Instagram")+
  theme_light() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  geom_vline(data=zoo,aes(xintercept=as.numeric(as.Date("2016-05-28"))), color = "skyblue")
  
#Circling before and after Harambe
library(ggalt)
zoo_afterharambe <- zoo[zoo$Date2 > "2016-05-28" & 
                            zoo$Date2 <= "2016-07-30" & 
                            zoo$Likes > 0 & 
                            zoo$Likes < 6000, ]

ggplot(zoo, aes(x=Date2, y=Likes)) + 
  geom_point(colour = "mediumseagreen") + 
  #geom_line() +
  #geom_smooth(method="loess", se=F) + 
  #xlim(c(0, 0.1)) + 
  ylim(c(0, 6000)) + 
  labs(subtitle="(taking note of the death of Harambe)", 
       y="Number of Likes", 
       x="Month", 
       title="Number of Instagram Likes over time (April 1st, 2016 - July 30th, 2016)", 
       caption = "Source: Cincinnati Zoo Instagram")+
  geom_encircle(aes(x=Date2, y=Likes), 
                data=zoo_afterharambe, 
                color="red", 
                size=2, 
                expand=0.03) +
  theme_light() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  geom_vline(data=zoo,aes(xintercept=as.numeric(as.Date("2016-05-28"))), color = "skyblue")

zoo_beforeharambe <- zoo[zoo$Date2 >= "2016-04-01" & 
                          zoo$Date2 <= "2016-05-28" & 
                          zoo$Likes > 0 & 
                          zoo$Likes < 6000, ]

ggplot(zoo, aes(x=Date2, y=Likes)) + 
  geom_point(colour = "mediumseagreen") + 
  #geom_line() +
  #geom_smooth(method="loess", se=F) + 
  #xlim(c(0, 0.1)) + 
  ylim(c(0, 6000)) + 
  labs(subtitle="(taking note of the death of Harambe)", 
       y="Number of Likes", 
       x="Month", 
       title="Number of Instagram Likes over time (April 1st, 2016 - July 30th, 2016)", 
       caption = "Source: Cincinnati Zoo Instagram")+
  geom_encircle(aes(x=Date2, y=Likes), 
                data=zoo_beforeharambe, 
                color="red", 
                size=2, 
                expand=0.03) +
  theme_light() +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  geom_vline(data=zoo,aes(xintercept=as.numeric(as.Date("2016-05-28"))), color = "skyblue")

