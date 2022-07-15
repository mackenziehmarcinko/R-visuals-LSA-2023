
#For Figure 3 LSA abstract.Includes title, scales by percentage, only includes means & no error bars and etc.

# library is ggplot2
library(ggplot2)

#creates the bitty dataset
VoiceLanguage <- c(rep("Quechua" , 2) , rep("Spanish" , 2) ) #remeber that the num of rows has to equal the num of columns (the length fn is good to check)
Dimension <- rep(c("Solidarity" , "Status") , 2)
Percentages <- c(.6548,.5743,.595,.677) #move decimal points over b/c scale continuous will multiply by 100
data <- data.frame(VoiceLanguage,Dimension,Percentages)

# Group it
MacsPlot <- ggplot(data, aes(fill=Dimension, y=Percentages, x=VoiceLanguage, label = scales::percent(Percentages))) + 
  geom_col(position = 'dodge') + 
  geom_text(position = position_dodge(width = .9),    # move to center of bars
            vjust = -0.5,    # nudge above top of bar
            size = 3) + 
  scale_y_continuous(labels = scales::percent)
#dodge makes the bars grouped, geom_col and geom_text add data labels


print(MacsPlot+ labs(y = "Percentage Rating", x = "Voice Language")) + ggtitle("Figure 3: Older Participants’ Percentage Ratings by Question Group & Voice Language")


##data pooled by gender, old participants only