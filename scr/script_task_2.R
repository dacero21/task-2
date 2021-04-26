#==============================================================================#
# Autores: David Acero Acero: 201228148 Andres Cembrano:201630829 Jorge Lozano: 201816744
# Colaboradores:
# Fecha elaboracion: 25 de abril de 2021
# Ultima modificacion: 25 de abril de 2021
# Version de R: 4.0.3
#==============================================================================#

rm(list = ls()) # Limpiar el ambiente 
pacman::p_load(tidyverse,data.table) #Cargar los paquetes necesarios 

#TALLER A 

# 1. Loops

lista_df=readRDS("data/input/lista.rds") # 1.0. Cargar la base de datos.

for (i in 1:length(lista_df)) {
  lista_df[[i]]=subset(lista_df[[i]],is.na(...2)==FALSE) #Eliminar las filas con Nas.
  colnames(lista_df[[i]])=tolower(as.character(lista_df[[i]][1,])) #Renombrar las columnas con los nombres de la primera fila en minuscula.
  lista_df[[i]]=lista_df[[i]][-1,] #Remover la primera fila que contenia los nombres de las columnas.
  lista_df[[i]]$tipo_delito=names(lista_df)[i] #Crear una variable que contenga el tipo de delito (sera limpiada mas adelante)
} #Loop para puntos 1.1. y 1.2. 

df=rbindlist(lista_df,fill = TRUE) # 1.3. Crear un dataframe unico con los dataframe de la lista
df$tipo_delito=str_remove_all(df$tipo_delito,"[0123456789_]") %>% str_remove(.,"--primeraparte") %>% str_remove(.,"--segundaparte") %>% str_remove(.,"-$") %>% str_remove(.,"-$") %>% str_replace(.,"huto","hurto")# 1.2. Estandarizar la columna de tipo de delito, seguro se puede optimizar pero es trabajo honesto jaja

# 2. Familia apply

