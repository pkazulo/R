rm(list=ls())

library(datasets)
library(car)

data("iris")

print(shapiro.test(iris$Sepal.Length))
print(shapiro.test(iris$Sepal.Width))
print(shapiro.test(iris$Petal.Length))
print(shapiro.test(iris$Petal.Width))
print("Tylko dla zmiennej Sepal.Width nie mo�na odrzuci� hipotezy o podleganiu rozk�adowi normalnemu")

print(leveneTest(iris$Sepal.Width ~ iris$Species, iris))
print("P-value > 0.05, a wi�c nie ma podstaw, by odrzuci� hipotez� o jednorodno�ci wariancji")

print("Wyniki test�w na normalno�� rozk�adu zmiennej i jednorodno�� wariancji wskazuj� na to, �e mo�na wykona� ANOVA dla cechy Sepal.Width")

iris.aov <- aov(iris$Sepal.Width ~ iris$Species, iris)
print(summary(iris.aov))
print(TukeyHSD(iris.aov))

print("Jednoczynnikowa analiza wariancji daje podstawy do odrzucenia hipotezy zerowej o r�wnych �rednich warto�ciach Sepal.Width w�r�d trzech badanych gatunk�w, poniewa� p-value < 0.05")
print("Dodatkowo, na podstawie testu TukeyHSD, mo�na stwierdzi�, �e r�nice wyst�puj� pomi�dzy wszystkimi grupami, poniewa� dla ka�dej kombinacji p-value < 0.05")

boxplot(Sepal.Width~Species, iris, ylab="Sepal.Width", col=c("red","green","blue"))