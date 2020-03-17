# Carregar funcions i llibreries necessaries

# CArrego funcions -------------------
link_source<-paste0("https://github.com/jrealgatius/Stat_codis/blob/master/funcions_propies.R","?raw=T")
devtools::source_url(link_source)


source("codi/global_funcions.R")

library(lubridate)

# lectura de dades (historic)
load("dades/dades_historic.Rdata")


# Seleccionar pacients d'una determinació  
dades_mostra<- dades_historic %>% filter(agr=="HBA1C") %>% mostreig_ids(n_mostra=3) 

# Graficar evolució de paramtere
MAP_valor_ggplot(dades_mostra,Nmostra = 3)


# Interpolar 
dades_interpelades<-dades_mostra %>% interpelacio_ids()

# Graficar dades interpolades 
MAP_valor_ggplot(dades_interpelades %>% filter(tipo=="pred"),grup_color = "tipo",Nmostra = 3)


