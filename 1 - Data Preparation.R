
# Step 1 - Download the DEMO and AOD Clean.xlsx into the working directory  --------

# I named mine "DEMO and AOD Clean_7.3.24.xlsx"

Data_file_name = "DEMO and AOD Clean_7.17.24.xlsx"

# Step 2 - Install Packages (if needed) and Load Libraries  ------------------------

# install.packages("readxl")
# install.packages("xlsx")

library(readxl)
library(xlsx)




# Step 3 - Load XLSX Spreadsheet ---------------------------------------------------


sheets <- excel_sheets(Data_file_name)

dfs <- list()
for (sheet in sheets) {
  dfs[[sheet]] <- read_excel(Data_file_name, sheet = sheet)
}


# Create a new dataframe with each spreadsheet

df_00_04<-as.data.frame(dfs[[1]])
df_06<-as.data.frame(dfs[[2]])
df_07<-as.data.frame(dfs[[3]])
df_08<-as.data.frame(dfs[[4]])
df_09<-as.data.frame(dfs[[5]])
df_10<-as.data.frame(dfs[[6]])
df_11<-as.data.frame(dfs[[7]])
df_12<-as.data.frame(dfs[[8]])
df_13<-as.data.frame(dfs[[9]])
df_14<-as.data.frame(dfs[[10]])
df_15<-as.data.frame(dfs[[11]])
df_16<-as.data.frame(dfs[[12]])
df_17<-as.data.frame(dfs[[13]])
df_18<-as.data.frame(dfs[[14]])
df_19<-as.data.frame(dfs[[15]])
df_20<-as.data.frame(dfs[[16]])
df_21<-as.data.frame(dfs[[17]])
df_22<-as.data.frame(dfs[[18]])


# Remove SEQ cols for each
df_00_04<-df_00_04[,-c(1)]
df_06<-df_06[,-c(1)]
df_07<-df_07[,-c(1)]
df_08<-df_08[,-c(1)]
df_09<-df_09[,-c(1)]
df_10<-df_10[,-c(1)]
df_11<-df_11[,-c(1)]
df_12<-df_12[,-c(1)]
df_13<-df_13[,-c(1)]
df_14<-df_14[,-c(1)]
df_15<-df_15[,-c(1)]
df_16<-df_16[,-c(1)]
df_17<-df_17[,-c(1)]
df_18<-df_18[,-c(1)]
df_19<-df_19[,-c(1)]
df_20<-df_20[,-c(1)]
df_21<-df_21[,-c(1)]
df_22<-df_22[,-c(1)]

df_list <- list(df_00_04, df_06, df_07, df_08, df_09, df_10, df_11, df_12, df_13,
                df_14, df_15, df_16, df_17, df_18, df_19, df_20, df_21, df_22)
for(df in df_list){
  print(dim(df))
  readline("Pres Enter to Continue")
}

# Update Column Names
column_names<-colnames(df_22)


colnames(df_00_04)<-column_names
colnames(df_06)<-column_names
colnames(df_07)<-column_names
colnames(df_08)<-column_names
colnames(df_09)<-column_names
colnames(df_10)<-column_names
colnames(df_11)<-column_names
colnames(df_12)<-column_names
colnames(df_13)<-column_names
colnames(df_14)<-column_names
colnames(df_15)<-column_names
colnames(df_16)<-column_names
colnames(df_17)<-column_names
colnames(df_18)<-column_names
colnames(df_19)<-column_names
colnames(df_20)<-column_names
colnames(df_21)<-column_names
colnames(df_22)<-column_names




# Create a list of data frames
df_list <- list(df_00_04, df_06, df_07, df_08, df_09, df_10, df_11, df_12, df_13,
                df_14, df_15, df_16, df_17, df_18, df_19, df_20, df_21, df_22)


# Merge all data frames into one long dataframe
merged_df <- do.call(rbind, df_list)

# Reset row names to NULL
rownames(merged_df) <- NULL



# Prepare Data for Proportion Tables --------------------------------------


# Convert Year to a factor to ensure correct ordering
merged_df$year <- as.factor(merged_df$year)
ColNames<-as.data.frame(colnames(merged_df))

Years<-unique(merged_df$year)
Years<-as.list(Years)

AOD_cols<-colnames(merged_df[,32:40])
AOD_cols<-c(AOD_cols)

SexOrient_cols<-colnames(merged_df[,c(7:12,27:31)])
SexOrient_cols<-c(SexOrient_cols)

Gender_cols<-colnames(merged_df[,c(3:6,23:26)])
Gender_cols<-c(Gender_cols)

Race_cols<-colnames(merged_df[,13:22])
Race_cols<-c(Race_cols)

Age_col<-list("Age")


data<-merged_df
colnames(data)


colnames(data)
dim(data)




############
# OPTIONAL #
############

# Selecting only demographics and the newly cleaned vars
# data<-data[,c(1:31, 41:49)]
colnames(data)