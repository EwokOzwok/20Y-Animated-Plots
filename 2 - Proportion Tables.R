
# Proportion Table Function -----------------------------------------------


# Create Function
Generate_PropTable_df<-function(Response_Categories, Variable_col_number, data){
  
  Ordered_years<-matrix(sort(unique(data$year), decreasing = F))
  
  prop_col<-c("Year", Response_Categories)
  proportions<-as.data.frame(matrix(data=NA, ncol=length(prop_col), nrow=length(Ordered_years)))
  colnames(proportions)<-prop_col
  proportions$Year<-Ordered_years
  
  loop_cols<-c(length(Response_Categories):ncol(proportions))
  
  for(i in 1:length(Ordered_years)){
    
    PropTableOutput<-prop.table(table(data[data$year==as.numeric(Ordered_years[[i]]), Variable_col_number]))
    
    
    if(length(PropTableOutput)==2){
      proportions[i,loop_cols]<-PropTableOutput
      
    } else {
      proportions[i,loop_cols]<-NA
    } # CLOSE else
    
    
    
    
  } # Close 1st For Loop
  
  
  for(i in loop_cols){
    proportions[,i]<-proportions[,i]*100
  } # CLOSE 2nd For Loop
  
  
  return(proportions)
} # CLOSE FUNCTION



# Specify Response Categories for Considered Suicide
Response_Categories <- c("No", "Yes")

# Specify the column number of your variable of interest
colnames(data)
Variable_col_number = 32

# Generate Proportion Table with Function
Consid_suicide_prop<-Generate_PropTable_df(Response_Categories, Variable_col_number, data)
Consid_suicide_prop



# Manual Mean Imputation for Missing Blocks
Consid_suicide_prop[4,2]<-mean(Consid_suicide_prop[3,2],Consid_suicide_prop[5,2])
Consid_suicide_prop[4,3]<-mean(Consid_suicide_prop[3,3],Consid_suicide_prop[5,3])

Consid_suicide_prop[6,2]<-mean(Consid_suicide_prop[1:5,2],Consid_suicide_prop[9,2])
Consid_suicide_prop[6,3]<-mean(Consid_suicide_prop[1:5,3],Consid_suicide_prop[9,3])

Consid_suicide_prop[7,2]<-mean(Consid_suicide_prop[1:6,2],Consid_suicide_prop[9,2])
Consid_suicide_prop[7,3]<-mean(Consid_suicide_prop[1:6,3],Consid_suicide_prop[9,3])

Consid_suicide_prop[8,2]<-mean(Consid_suicide_prop[1:7,2],Consid_suicide_prop[9,2])
Consid_suicide_prop[8,3]<-mean(Consid_suicide_prop[1:7,3],Consid_suicide_prop[9,3])

Consid_suicide_prop
