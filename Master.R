# Programme maitre de génération de documents multiples (Sweave)
# 11/03/2013 : Création et test avec fichier réduit...
# 27/03/2013 : Création de répertoires spécifiques pour chaque secteur (conservation sources tex!)

# Remove all 
rm(list=ls())

## Second change the working directory

setwd("D:/progs/EPI/Ocad")   
#setwd("C:/Chris/zprogs/EPI/Ocad/")   

#Sec <-c("D151A","D151C","D155A", "D155C", "D156A",  "D157A", "D158A")
#Sec <-c("D151E", "D152Z", "D153E")
# All - les 3 premiers 
Sec <-c("D158K", "D158V",  "D159F", "D159G","D151A","D151C","D155A", "D155C", "D156A",  "D157A", "D158A")

#All
Sec <-c("D151E", "D152Z", "D153E", "D158K", "D158V",  "D159F", "D159G","D151A","D151C","D155A", "D155C", "D156A",  "D157A", "D158A")

for (s in 1:length(Sec)) {
  #On nourrit le fichier seravnt pour la def du secteur dans le Sweave 
  write(Sec[s], file="Secteur.dat", append=FALSE)
  # Partie Sweave 
  Sweave("AnalyseMultiSecteur.Rnw")    
  tools::texi2dvi("AnalyseMultiSecteur.tex",  clean = TRUE, pdf = TRUE) 
  
  #On créée et on remplit les répertoires des fichiers sources .tex, etc...
  dir.create(paste("Rapports/sec",Sec[s], sep =""), showWarnings = FALSE)
  file.copy("Graphics", paste("Rapports/sec",Sec[s], sep =""), recursive=TRUE)
  file.copy("Sweave.sty", paste("Rapports/sec",Sec[s],"/Sweave.sty", sep =""), overwrite = TRUE)
  
  file.copy("AnalyseMultiSecteur.tex", paste("Rapports/sec",Sec[s],"/AnalyseSecteurNew",Sec[s],".tex", sep =""), overwrite = TRUE)
  file.copy("AnalyseMultiSecteur.pdf", paste("Rapports/sec",Sec[s],"/AnalyseSecteurNew",Sec[s],".pdf", sep =""), overwrite = TRUE)
  
  # On garde une copie dans le répertoire Global...     
  file.copy("AnalyseMultiSecteur.pdf", paste("Rapports/AnalyseSecteurNew",Sec[s],".pdf", sep =""), overwrite = TRUE)
  
}


