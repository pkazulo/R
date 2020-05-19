rm(list=ls())
library(MASS)

#wczytanie danych
train <- Pima.tr
test <- Pima.te

#wykonanie regresji
logreg <- glm(type~npreg+glu+bp+skin+bmi+ped+age, data=train, family=binomial(link = "logit"))
print(summary(logreg))
print("Zmienne istotne statystycznie to: poziom glukozy, bmi, ped(funkcja epizodów cukrzycy w rodzinie) oraz wiek")

#klasyfikacja danych ze zbioru testowego (wyznaczenie prawdopodobieñstwa bycia chorym)
pima.result <- predict(logreg, newdata = test, type = "response")

#zamiana typu danych na binarny
test$bin <- sapply(test$type,function(x){ifelse(x=="Yes", 1, 0)})
threshold <- 0.5
pima.result <- sapply(pima.result,function(x){ifelse(x>threshold, 1, 0)})

#wyznaczenie dok³adnoœci klasyfikatora
pima.accuracy <- 1-mean(abs(test[['bin']]-pima.result))
cat("Dok³adnoœæ klasyfikatora: ",pima.accuracy)