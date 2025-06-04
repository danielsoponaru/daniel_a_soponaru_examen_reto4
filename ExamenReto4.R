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

cuenta_nas_min <- datos %>% 
  group_by(Minutes) %>% 
  summarize(conteo = n())

cuenta_nas_sea <- datos %>% 
  group_by(Seasons) %>% 
  summarize(conteo = n())

sd(datos$Minutes, na.rm = T)
sd(datos$Seasons, na.rm = T)

# Elementos unicos

tipos <- unique(datos$type)
paises <- unique(datos$country)
director <- unique(datos$director)

