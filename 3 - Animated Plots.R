
# Install Packages (if needed) & Load Librares ----------------------------

# install.packages("tidyr")
# install.packages("gganimate")
# install.packages("psych")
# install.packages("remotes")
# remotes::install_github("R-CoderDotCom/ggcats@main")

library(tidyr)
library(ggplot2)
library(gganimate)
library(ggcats)
library(psych)

# Make an Animated Plot for each Response Option --------------------------

# Define Function
Anim_plot_SepResponses<-function(Title, File_name, PropTable){
  
  
  # Reshape the data
  long <- pivot_longer(PropTable,
                       cols = -Year,
                       names_to = "Group",
                       values_to = "Percentage")
  
  long$Year<-as.numeric(long$Year)
  # Plotting
  p <- ggplot(long, aes(x = Year, y = Percentage, color = Group)) +
    geom_line(aes(group = Group)) +
    geom_point() +
    scale_color_discrete() +
    ggtitle(Title) +
    theme_minimal(base_size = 16) +
    theme(plot.title = element_text(hjust = 0.5)) +
    ylab("Percent") +
    ylim(0, 100) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 8)) +
    transition_reveal(Year) +
    facet_wrap(~ Group) +
    shadow_wake(.9, size = .5, colour = 'darkslateblue')
  
  # View the plot
  animate(p, height = 800, width =1200, fps = 10, duration = 12)
  
  
  
  anim_save(File_name)
  
}

# Specify Function Parameters
Title = "Considered Suicide in the Past Year"
File_name = "Considered_suicide_Sep.gif"

Anim_plot_SepResponses(Title, File_name, Consid_suicide_prop)



# Make an Animated Plot with all response options on the same plot --------

# Define Function
Anim_plot_AllinOne<-function(Title, File_name, Consid_suicide_prop){
  
  # Reshape the data
  long <- pivot_longer(Consid_suicide_prop,
                       cols = -Year,
                       names_to = "Group",
                       values_to = "Percentage")
  
  long$Year<-as.numeric(long$Year)
  
  p<-long %>%
    ggplot(aes(x = Year, y = Percentage, color = Group)) +
    geom_line() +
    geom_point() +
    scale_color_discrete() +
    ggtitle(Title) +
    theme_minimal(base_size = 16) +
    theme(plot.title = element_text(hjust = 0.5)) +
    ylab("Percent") +
    ylim(0,100) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 8)) +
    transition_reveal(Year) +
    shadow_wake(.9, size = .5, colour = 'darkslateblue')
  
  
  animate(p, height = 800, width =1200, fps = 10, duration = 12)
  
  anim_save(File_name)
  
}

# Specify Function Parameters
Title = "Considered Suicide in the Past Year"
File_name = "Considered_suicide_Allinone.gif"
Anim_plot_AllinOne(Title, File_name, Consid_suicide_prop)






# GGCATS!!!! --------------------------------------------------------------

cat_data<- as.matrix(data[data$year==2000, "Alc_Aca_Perf"])
cat_data<-na.omit(cat_data)

unique(cat_data)



freq_data<-as.data.frame(matrix(data=NA, nrow=length(unique(cat_data)), ncol = 2))
colnames(freq_data)<-c("Category", "Frequency")
freq_data$Category<-c("None","Little","Some","Alot","Substantial")

for(i in 1:length(unique(cat_data))){
  freq_data[i,2]<-length(na.omit(cat_data[cat_data==i,]))
}

freq_data

cat_plot<-ggplot(freq_data, aes(x = Category, y = Frequency)) +
  geom_point(size = 3) +
  geom_cat(aes(cat = "mouth")) +  # Adding cat images (example: 'grumpy' cat)
  theme_minimal() +
  labs(title = "Alc_Aca_Perf with Cats (Year 2000)",
       x = "Level of Impact on Academics",
       y = "Frequency")
print(cat_plot)
