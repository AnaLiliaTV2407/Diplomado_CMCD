pais<- "Colombia"
nchar(pais)

tolower(pais)
#stringi
edad <-c(15,19,13,NA,20)
deporte<-c(TRUE, TRUE, NA, FALSE, TRUE)
comic_fav<-c(NA, "Superman","Batman", NA, "Batman")
is.integer(edad)
is.character(comic_fav)
length(edad)
edad[1]
edad[-c(1,3)]

#filas x columnas no te olvides primero filas y luego columnas
miarray<-array(data=letters[1:24], dim = c(3,4,2))
miarray
mimacro<-data.frame(edad,deporte,comic_fav)
mimacro


#listas para datos heterogeneos distintos datos
#el data frame puede ser de diferente tipo dentro de una columna
# 

str(mimacro)
identical(1,1.0)
subset(mimacro, subset == deporte == TRUE)
set.seed(12345)

test<- function(x)
{if(!is.numeric(x)) return(0)
  return(2*x)
}
test("Hola")

#libreria (microbechmark)
}
mivector<-runif(n=5)
milista