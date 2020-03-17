## Funció que llanço un historic de valors dat val

# I retorna fitxer amb Prediccions equidistants mitjançant un Spline
interpelacio<-function(dt=dt_HB_id){
  # dt<-dt_HB_id
  dt<-dt %>% select(idp,dat,val)
  
  splineData<-
    data.frame(with(dt, spline(dat, val,method = "fmm")),idp=dt$idp,pred="pred") %>% 
    transmute(idp=as.character(idp),dat=as_date(x),val=y,tipo=as.character(pred))
  
  dt %>% bind_rows(splineData) %>% mutate(tipo=ifelse(is.na(tipo),"obs",tipo))
}


# Ho fa per cada id 
interpelacio_ids<-function(dt){
  dt %>% split(.$idp) %>% map_dfr(~interpelacio(.x))
}

