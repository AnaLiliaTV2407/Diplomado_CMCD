library(rvest)

#---- Lectura de la página web #----

#El Web scraping se refiere a una técnica de recolección de datos
#a través de una página web por medio de código HTML


#Url de la pagina a ocupar
url="https://www.exchangerates.org.uk/EUR-USD-spot-exchange-rates-history-2016.html"

#Preguntar a Robots txt si esta permitido obtener datos de esa URL
paths_allowed(paths=c(url))

#Obtener el código HTML de la URL
pagina_web<- read_html(url)

#Se exiben los datos
pagina_web

#----Tasas de cambio #----
css_producto<-"em"  #selecciina el objeto que queremos de la pagina

#Lista de nodos: aqui tengo que dar la clase u el objeto y la pagina web
 producto_html<-html_nodes(pagina_web,css_producto) 

producto_texto<-html_text(producto_html)#Obtener los datos en texto

#Se obtienen los datos crudos
producto_texto

#---- Liempieza de los datos #----
texto_limpio<-gsub("","",producto_texto) #se crea un elemento para quitar los espacios
texto_limpio
texto_limpio2 = texto_limpio[texto_limpio != ""] #Se crea otro elemento para quitar los vacios del texto



#---- convertir a hoja de csv #----

#se crea un nuevo elemento y se obtiene cada 3 elemento de la información obtenida
new_text  = texto_limpio2[seq(3,length(texto_limpio2),3)] 

#Se escribe en archivo csv
write.csv(new_text, file = "eurl6.csv", row.names = FALSE)
