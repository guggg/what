
library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")


MaxPlayed<-aggregate(TotalMinutesPlayed~Team,NBA1415,max)
#tapply(NBA1415$TotalPoints,NBA1415$Team,max)
NBA1415MaxPlayed<-merge(NBA1415,MaxPlayed)
output<-NBA1415MaxPlayed[order(NBA1415MaxPlayed$TotalMinutesPlayed,decreasing = T),c("Team","Name","TotalMinutesPlayed")]
library(knitr)
kable(output, digits=2)


MaxPoint<-aggregate(TotalPoints~Team,NBA1415,max)

NBA1415MaxPoint<-merge(NBA1415,MaxPoint)
output<-NBA1415MaxPoint[order(NBA1415MaxPoint$TotalPoints,decreasing = T),c("Team","Name","TotalPoints")]
library(knitr)
kable(output, digits=2)



  
  
EFFMax<-aggregate(TotalPoints/TotalMinutesPlayed~Name,NBA1415,max)
NBA1415EFFMax<-merge(NBA1415,EFFMax)
FinalEFFMax<-aggregate(TotalPoints/TotalMinutesPlayed~Team,NBA1415EFFMax,max)
NBA1415FinalEFFMax<-merge(NBA1415EFFMax,FinalEFFMax)
output<-NBA1415FinalEFFMax[order(NBA1415FinalEFFMax$`TotalPoints/TotalMinutesPlayed`,decreasing = T),c("Team","Name","TotalPoints/TotalMinutesPlayed")]
library(knitr)
kable(output, digits=2)


Shoter<-aggregate(ThreesMade/ThreesAttempted~Name,NBA1415,max)
NBA1415Shoter<-merge(NBA1415,Shoter)
FinalShoter<-aggregate(ThreesMade/ThreesAttempted~Team,NBA1415Shoter,max)
NBA1415FinalShoter<-merge(NBA1415Shoter,FinalShoter)
output<-NBA1415FinalShoter[order(NBA1415FinalShoter$`ThreesMade/ThreesAttempted`,decreasing = T),c("Team","Name","ThreesMade/ThreesAttempted")]
library(knitr)
kable(output, digits=2)