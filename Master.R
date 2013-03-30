# Programme maitre de génération de documents multiples (Sweave)
# 11/03/2013 : Création

# Remove all 
rm(list=ls())

## Second change the working directory

setwd("D:/progs/EPI/Ocad")   
#setwd("C:/Chris/zprogs/EPI/Ocad/")   



# 151A 151C 155A 155C 156A 157A 158A
# 151E 152Z 153E 158K  158V 159F 159G

x <-c("D151A","D151C","D155A", "D155C", "D156A",  "D157A", "D158A")

for (i in 1:length(x)) {
      write(x[i], file="Secteur.dat", append=FALSE)
      Sweave("AnalyseMultiSecteur.Rnw")    
      tools::texi2dvi("AnalyseMultiSecteur.tex",  clean = TRUE, pdf = TRUE) 
      file.copy("AnalyseMultiSecteur.pdf", paste("Rapports/AnalyseSecteur",x[i],".pdf", sep =""), overwrite = TRUE)
 
}
