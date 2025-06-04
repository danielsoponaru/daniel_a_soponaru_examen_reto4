library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)

datos <- read.csv("netflix.csv")

# Exploracion
max(datos$Minutes, na.rm = T)
max(datos$Seasons, na.rm = T)

quantile(datos$Minutes, 0.75, na.rm = T)
quantile(datos$Seasons, 0.75, na.rm = T)

median(datos$Minutes, na.rm = T)
median(datos$Seasons, na.rm = T)

mean(datos$Minutes, na.rm = T)
mean(datos$Seasons, na.rm = T)

quantile(datos$Minutes, 0.25, na.rm = T)
quantile(datos$Seasons, 0.25, na.rm = T)

min(datos$Minutes, na.rm = T)
min(datos$Seasons, na.rm = T)

miss_var_summary(datos)

sd(datos$Minutes, na.rm = T)
sd(datos$Seasons, na.rm = T)

# Elementos unicos

tipos <- unique(datos$type)
paises <- unique(datos$country)
director <- unique(datos$director)

# Analisis y limpieza de NAs

miss_var_summary(datos)
vis_miss(datos, cluster = T)

# cas <- filter(datos, type == "TV Show")
# miss_var_summary(cas)

# Eliminaremos los valores faltantes de release_year debido a su poco impacto en el df
which_na(datos$release_year)
datos_filtrados <- datos[-c(which_na(datos$release_year)),]
miss_var_summary(datos_filtrados)

peliculas <- datos_filtrados %>% 
  filter(type == "Movie")
miss_var_summary(peliculas)
peliculas <- peliculas[-c(which_na(peliculas$Minutes)),]

show <- datos_filtrados %>% 
  filter(type == "TV Show")
miss_var_summary(show)
show <- show[-c(which_na(show$Seasons)),]
