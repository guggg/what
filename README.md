---
  title: "NBA 2014-2015球季 各隊分析"
  output: html_document
---
  
  
```r
  #install.packages("SportsAnalytics")
  library(SportsAnalytics)
  NBA1415<-fetch_NBAPlayerStatistics("14-15")
```
## **各隊最辛苦的球員**
  
  ---各隊上場分鐘數最多的球員---

```r
  MaxPlayed<-aggregate(TotalMinutesPlayed~Team,NBA1415,max)
  #tapply(NBA1415$TotalPoints,NBA1415$Team,max)
  NBA1415MaxPlayed<-merge(NBA1415,MaxPlayed)
  output<-NBA1415MaxPlayed[order(NBA1415MaxPlayed$TotalMinutesPlayed,decreasing = T),c("Team","Name","TotalMinutesPlayed")]
  library(knitr)
  kable(output, digits=2)
```

|   |Team |Name             | TotalMinutesPlayed|
|:--|:----|:----------------|------------------:|
|11 |HOU  |James Harden     |               2979|
|18 |MIN  |Andrew Wiggins   |               2971|
|25 |POR  |Damian Lillard   |               2928|
|13 |LAC  |Chris Paul       |               2860|
|30 |WAS  |John Wall        |               2841|
|24 |PHO  |Eric Bledsoe     |               2799|
|3  |BRO  |Joe Johnson      |               2787|
|6  |CLE  |Kyrie Irving     |               2735|
|7  |DAL  |Monta Ellis      |               2698|
|19 |NOR  |Tyreke Evans     |               2695|
|15 |MEM  |Marc Gasol       |               2690|
|5  |CHI  |Pau Gasol        |               2682|
|26 |SAC  |Ben Mclemore     |               2674|
|8  |DEN  |Ty Lawson        |               2668|
|16 |MIA  |Goran Dragic     |               2641|
|29 |UTA  |Gordon Hayward   |               2618|
|10 |GSW  |Stephen Curry    |               2613|
|9  |DET  |Ke Caldwell-pope |               2591|
|22 |ORL  |Victor Oladipo   |               2572|
|17 |MIL  |G Antetokounmpo  |               2542|
|2  |BOS  |Avery Bradley    |               2427|
|28 |TOR  |Kyle Lowry       |               2422|
|1  |ATL  |Kyle Korver      |               2418|
|12 |IND  |Solomon Hill     |               2380|
|4  |CHA  |Gerald Henderson |               2323|
|23 |PHI  |Nerlens Noel     |               2311|
|27 |SAN  |Danny Green      |               2311|
|21 |OKL  |Russel Westbrook |               2302|
|14 |LAL  |Wesley Johnson   |               2244|
|20 |NYK  |Shane Larkin     |               1864|
  
## **各隊得分王**
  
  ---**各隊得分最多的球員**---
  
```r 
  MaxPoint<-aggregate(TotalPoints~Team,NBA1415,max)
  
  NBA1415MaxPoint<-merge(NBA1415,MaxPoint)
  output<-NBA1415MaxPoint[order(NBA1415MaxPoint$TotalPoints,decreasing = T),c("Team","Name","TotalPoints")]
  library(knitr)
kable(output, digits=2)
```
 
## **各隊最有效率球員**
 
  ---**各隊總得分/出戰分鐘數 最高的球員**---
  
```r
  EFFMax<-aggregate(TotalPoints/TotalMinutesPlayed~Name,NBA1415,max)
  NBA1415EFFMax<-merge(NBA1415,EFFMax)
  FinalEFFMax<-aggregate(TotalPoints/TotalMinutesPlayed~Team,NBA1415EFFMax,max)
  NBA1415FinalEFFMax<-merge(NBA1415EFFMax,FinalEFFMax)
  output<-NBA1415FinalEFFMax[order(NBA1415FinalEFFMax$`TotalPoints/TotalMinutesPlayed`,decreasing = T),c("Team","Name","TotalPoints/TotalMinutesPlayed")]
  library(knitr)
  kable(output, digits=2)
```
  
  
## **各隊三分球出手最準的球員**
  
---**各隊三分球命中/出手三分球 最高的球員**---
  
```r 
  Shoter<-aggregate(ThreesMade/ThreesAttempted~Name,NBA1415,max)
  NBA1415Shoter<-merge(NBA1415,Shoter)
  FinalShoter<-aggregate(ThreesMade/ThreesAttempted~Team,NBA1415Shoter,max)
  NBA1415FinalShoter<-merge(NBA1415Shoter,FinalShoter)
  output<-NBA1415FinalShoter[order(NBA1415FinalShoter$`ThreesMade/ThreesAttempted`,decreasing = T),c("Team","Name","ThreesMade/ThreesAttempted")]
  library(knitr)
  kable(output, digits=2)
```