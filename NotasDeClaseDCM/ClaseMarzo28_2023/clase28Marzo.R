library(rvest)
library(xml2)
library(robotstxt)
library(selectr)
library(dplyr)
library(stringr)
library(forcats)
library(magrittr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(tibble)
library(purrr)
library(rvest)
library(readr)
library(readxl)

#####
library(data.table)
datoss<-fread("C:/Users/altovar/Downloads/datos.csv")
#####
mtcars1<-mtcars
rownames(mtcars1)
mtcars1$modelo<-rownames(mtcars1)

mtcars2<-mtcars
# mtcars2 <- mutate(mtcars2, modelo=rownames(mtcars2), modelo_lower=tolower(modelo), doble_mpg =2*mpg)
#Lo puedo usar agrego columna con nombre
### operador Pie %>%
filter(mtcars2, mpg>20)#me filtra
#mtcars2[mtcars$mpg >20 & mtcars$hp >100]
filter(iris, Sepal.Length>5.1) #109

filter(iris, Petal.Length<=1.5) #37

iris %>%  group_by(Species) %>% 
  summarise(mean_i=mean(Sepal.Width))

iris %>%  group_by(Species) %>% 
  summarise(median_i=median(Sepal.Width))

iris %>%  group_by(Species) %>% 
  summarise(max_i=max(Petal.Length))

iris %>%  group_by(Species) %>% 
  summarise(min_i=min(Petal.Length))

#select(mtcars2,mpg, cyl)
#
order_by(mtcars2, mpg)
arrange(mtcars2, -mpg)
arrange(mtcars2, cyl, -mpg)
#### 
mtcars2 %>% 
  summarise(mean_hp=mean(hp), max_hp =max(hp), min_hp=min(hp))
####
mtcars2 %>%  group_by(cyl) %>%  
  summarise(mean_hp=mean(hp))

#### filtrar  #arrange solo datos numericos

dt_mtcars <-as.data.table(mtcars)
dt_mtcars[mpg>=20]
###
filter(mtcars2,mpg>20)

### agregar columnas
mutate2<-mutate(mtcars2,double_hp=2*hp) #dplyr
dt_mtcars[, double_hp:=2*hp] #se agrega al espacio de memoria data.table
###summari
summarise(mtcars2,mean_hp=mean(hp))#dplyr
dt_mtcars[, .(mean_hp=mean(hp))]#data.table

mtcars 
iris
nrow(iris) #cuantos renglones tiene algo
ncol(iris)
dim(iris)
str(iris)#que es
iris$Species
write.csv(iris,"C:/Users/altovar/OneDrive - Euronet Worldwide/Documents/Downloads/iris.csv", row.names = FALSE)
read.csv(skip=2, range: C1:E7, range=cell_rows(102:105),cell_cols("B:D"))# skip es decir que salte dos renglones :D


cell_cols("B:D")
fread(iris)
library(data.table)
fread("C:/Users/altovar/Downloads/datos.csv")
#readxl::read_excel(documento ,sheet=1)