rm(list=ls())

library(datasets)
library(car)

data("iris")

print(shapiro.test(iris$Sepal.Length))
print(shapiro.test(iris$Sepal.Width))
print(shapiro.test(iris$Petal.Length))
print(shapiro.test(iris$Petal.Width))
print("Tylko dla zmiennej Sepal.Width nie mo¿na odrzuciæ hipotezy o podleganiu rozk³adowi normalnemu")

print(leveneTest(iris$Sepal.Width ~ iris$Species, iris))
print("P-value > 0.05, a wiêc nie ma podstaw, by odrzuciæ hipotezê o jednorodnoœci wariancji")

print("Wyniki testów na normalnoœæ rozk³adu zmiennej i jednorodnoœæ wariancji wskazuj¹ na to, ¿e mo¿na wykonaæ ANOVA dla cechy Sepal.Width")

iris.aov <- aov(iris$Sepal.Width ~ iris$Species, iris)
print(summary(iris.aov))
print(TukeyHSD(iris.aov))

print("Jednoczynnikowa analiza wariancji daje podstawy do odrzucenia hipotezy zerowej o równych œrednich wartoœciach Sepal.Width wœród trzech badanych gatunków, poniewa¿ p-value < 0.05")
print("Dodatkowo, na podstawie testu TukeyHSD, mo¿na stwierdziæ, ¿e ró¿nice wystêpuj¹ pomiêdzy wszystkimi grupami, poniewa¿ dla ka¿dej kombinacji p-value < 0.05")

boxplot(Sepal.Width~Species, iris, ylab="Sepal.Width", col=c("red","green","blue"))