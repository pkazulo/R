rm(list=ls())

library(carData)
library(caret)
library(ROCit)

#wczytanie danych
greene <- Greene

#przetasowanie danych i podzia� PU/PT = 75/25
N <- nrow(greene)
greene <- greene[sample(1:N),]
PU <- greene[1:(N*0.75),]
PT <- greene[(N*0.75+1):N,]

#ten blok kodu uniemo�liwia wyst�pienie b��du spowodowanego obecno�ci� innych element�w factora w PT ni� w PU
#istnieje tylko 1 rekord z narodowo�ci� Fiji, a wi�c gdy klasyfikator nie by� na nim trenowany, a pojawi� si� w pr�bie testowej, to wy�wietla� si� b��d
PU <- droplevels(PU)
PUlevs <- levels(PU$nation)
PT <- droplevels(PT)
PTlevs <- levels(PT$nation)
difflevs <- setdiff(PTlevs,PUlevs)
PT <- droplevels(PT[!PT$nation %in% difflevs,])

#regresja logistyczna
logreg <- glm(decision~., data=PU[,1:6], family=binomial(link = "logit"))
print(summary(logreg))

#klasyfikacja pr�by testowej
PT.predict <- predict(logreg, newdata = PT[,1:6], type = "response")
PT.true <- PT[,4]

#krzywa ROC
rocit.obj <- rocit(score=PT.predict,class=PT.true)
summary(rocit.obj)
plot(rocit.obj)

#wyznaczenie najlepszego punktu podzia�u
best.yi.index <- which.max(rocit.obj$TPR-rocit.obj$FPR)
best.cutoff <- rocit.obj$Cutoff[best.yi.index]
best.tpr <- rocit.obj$TPR[best.yi.index]
best.fpr <- rocit.obj$FPR[best.yi.index]
cutoff <- sprintf("Best Cutoff = %.2f (TPR = %.3f, FPR = %.3f)", best.cutoff, best.tpr, best.fpr)
print(cutoff)

#macierz pomy�ek i skuteczno�� klasyfikacji dla najlepszego punktu podzia�u
PT.result <- ifelse(PT.predict>best.cutoff, "yes", "no")
PT.conf <- confusionMatrix(as.factor(PT.result),PT.true, positive = "yes")
print("Macierz pomy�ek dla klasyfikatora z optymalnym punktem podzia�u")
print(PT.conf);
PT.accuracy <- PT.conf$overall[["Accuracy"]]
s <- sprintf("Skuteczno�� klasyfikacji wynosi %.2f",PT.accuracy)
print(s)
