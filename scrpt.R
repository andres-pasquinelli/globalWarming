mea_c <- c("Argentina")
mea<-data_country %>%filter(Country %in% mea_c)%>%group_by(year,Country)%>%mutate(no=length(year))%>%filter(no==12)%>%arrange(month)

ggplot(mea,aes(month,AverageTemperature, group=year,color =as.numeric(year))) + geom_line(alpha= 0.5) +
  theme(axis.line = element_line(color = "orange",size=1))+
  theme(panel.background=element_blank())+ scale_color_viridis(option="D")+
  scale_x_discrete()+labs(color="year") +
  facet_wrap(~Country)+
  xlab("Month")+ylab("Average Temperature")+
  theme(legend.position = "bottom",
        axis.text = element_text(size = 10,face="bold"),
        plot.title = element_text(size=16,face = "bold")) + 
  ggtitle("Average Temperature increasing in Argentina") 