# datos <- read.csv("netflix.csv")
# 
# which_na(datos$release_year)
# datos_filtrados <- datos[-c(which_na(datos$release_year)),]
# miss_var_summary(datos_filtrados)
# 
# peliculas <- datos_filtrados %>% 
#   filter(type == "Movie")
# miss_var_summary(peliculas)
# peliculas <- peliculas[-c(which_na(peliculas$Minutes)),]

library(plumber)

#* @apiTitle API Examen Reto_04
#* @apiDescription Esta API genera un histograma en base a la variable Minutes del dataframe peliculas. El histograma se generará escalado si el usuario introduce "T" o se generará segun su distribución original si el ususario introduce "F". En caso de no mantener el environment del archivo principal del examen, cargar los comentados.
#* 


#* Histograma de la variable Minutes
#* @serializer png
#* @param input
#* @get /histograma
function(input) {
    if (input == "T") {
      x <- scale(peliculas$Minutes, center = T)
      hist(x)
    } else if (input == "F") {
      hist(peliculas$Minutes)
    }
}


# Programmatically alter your API
#* @plumber
function(pr) {
    pr %>%
        # Overwrite the default serializer to return unboxed JSON
        pr_set_serializer(serializer_unboxed_json())
}
