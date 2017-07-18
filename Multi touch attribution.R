library(dplyr)
library(reshape2)
library(ChannelAttribution)
library(markovchain)
library(ggplot2)

df1<-data_frame(path=c('c1>c2>c3','c1','c2>c3'),conv=c(1,0,0),conv_null=c(0,1,1))

mod1<-markov_model(df1,var_path = 'path',var_conv = 'conv',var_null = 'conv_null',out_more = TRUE)

mod1

df_res1<-mod1$result

df_trans1<-mod1$transition_matrix

transition_probability<-c(0,1,1)

df_dummy<-data.frame(channel_from=c('start','conversion','null'),channel_to=c('start','conversion','null',transition_probability))
                     
df_trans1<-dcast(df_trans1,channel_from~channel_to,value.var = 'transition_probability')

df_trans<-mod1$transition_matrix

df_trans<-rbind(df_trans,df_dummy)


