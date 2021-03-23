
library(httr)
library(jsonlite)
library(plotly)
library(ggplot2)

#Tabla #1 (la base de dato es:https://datamexico.org/en/profile/geo/mexico)
#Tube que usar esta base de datos(https://datamexico.org/en/profile/geo/mexico),
# ya que con la de datos libres gob RD no me dejaba trabajar

recurso = GET("https://datamexico.org/api/data.jsonrecords?Covid+Result=1&Nation=mex&cube=gobmx_covid&drilldowns=Age+Range,Time&locale=en&measures=Cases&parents=false&time=time.latest")
recurso

rawToChar(recurso$content) 

Tabla_1 = fromJSON(rawToChar(recurso$content))
names(Tabla_1)

Tabla_1<-Tabla_1$data
Tabla_1 <- data.frame(Tabla_1)
head(Tabla_1)
View(Tabla_1)




#Tabla nuimero #2
#En esta tabla muestro los dacto de la una universidad
recurso = GET("https://datamexico.org/api/data?Nation=mex&Economically+Active+Population=1&cube=inegi_enoe&drilldowns=Nation,Quarter&measures=Workforce&locale=en&parents=false")
recurso

rawToChar(recurso$content) 

Tabla_2 = fromJSON(rawToChar(recurso$content))

names(Tabla_2)

Tabla_2<-Tabla_2$data

Tabla_2 <- data.frame(Tabla_2)
head(Tabla_2)
View(Tabla_2)





#Tabla nuimero #3
recurso = GET("https://datamexico.org/api/data.jsonrecords?Nation=mex&Year=2016,2018&cube=inegi_enigh_income&drilldowns=Decile,Year&measures=Quarterly+Income&locale=en&parents=false&sparse=false")
recurso

rawToChar(recurso$content) 

Tabla_3 = fromJSON(rawToChar(recurso$content))

names(Tabla_3)

Tabla_3<-Tabla_3$data

Tabla_3 <- data.frame(Tabla_3)
head(Tabla_3)
View(Tabla_3)



#Tabla nuimero #4
#En esta tabla muestro los dacto de Empleo
recurso = GET("https://datamexico.org/api/data?Security+Perception+in+their+State=1&Nation=mex&Year=2019&cube=inegi_envipe&drilldowns=Sociodemographic+Stratum%2CSex&locale=en&measures=People&parents=false&sparse=false")
recurso

rawToChar(recurso$content) 

Tabla_4 = fromJSON(rawToChar(recurso$content))

names(Tabla_4)

Tabla_4<-Tabla_4$data

Tabla_4 <- data.frame(Tabla_4)
head(Tabla_4)
View(Tabla_4)

















#Graficas
#Grafica #1
#Esta grafica corresponde a la tabla numero 1
#Esta grafica representa los casos en un periodo de 4 Años


Casos <- select(Tabla_1, Cases) %>% unlist
head(Casos)
pie(Casos)
#Para poder realizar la grafica uso la funcion unlist





#Grafica #2
#En esta grafica represente todos los id y con su numeor de caso de la tabla numero 1

Casos <- select(Tabla_1, Cases) %>% unlist
head(Casos)

Id <- select(Tabla_1, Age.Range.ID) %>% unlist
head(Id)
plot(Casos, Id)
#Para poder realizar la grafica uso la funcion unlist



#Grafica #3
#En esta grafica represento los años con sus respectivos Decline de la tabla numero 3


Años <- select(Tabla_3,Year) %>% unlist
head(Años)

Quarterly.Income <- select(Tabla_3,Quarterly.Income) %>% unlist
head(Quarterly.Income)

plot(Años, Quarterly.Income, panel.first = grid())

#Para poder realizar la grafica uso la funcion unlist





#Grafica #4
#En esta grafica represente el Quarter.ID y el Workforce de la tabla numero 2

Quarter.ID <- select(Tabla_2,Quarter.ID) %>% unlist
Workforce <- select(Tabla_2,Workforce) %>% unlist

plot(x = Quarter.ID,
     y = Workforce,
     xlab = '',
     ylab ='',
     col = 'blue',
     pch=16,
     panel.first = grid())

#Para poder realizar la grafica uso la funcion unlist




#Grafica #5
#En esta grafica represente en una grafica el Sex.ID y el People de la tabla numero 4

Sex.ID <- select(Tabla_4,Sex.ID) %>% unlist
head(Sex.ID)

People <- select(Tabla_4,People) %>% unlist
head(People)

plot( Sex.ID, People,panel.first = grid() )

#Para poder realizar la grafica uso la funcion unlist