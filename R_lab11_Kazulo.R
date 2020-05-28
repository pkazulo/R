rm(list=ls())

library(MASS)
library(ggplot2)
library(caret)

data("iris")

#przeskalowanie danych (odjêcie œredniej i podzielenie przez odchylenie standardowe)
iris.scaled <- data.frame(scale(iris[, 1:4]))
iris.scaled <- cbind(iris.scaled,iris$Species)
colnames(iris.scaled)[5] <- "Class"

#uruchomienie klasyfikatora lda
iris.lda <- lda(Class ~ ., data = iris.scaled)
print(iris.lda)

#zrzutowanie danych na p³aszczyznê, która zapewnia najbardziej optymalny podzia³ w rozumieniu lda
#wykreœlenie danych w nowych wspó³rzêdnych
proj <- as.matrix(iris.scaled[,1:4]) %*% iris.lda$scaling
iris.proj <- data.frame(proj, Class=iris.scaled$Class)
g <- ggplot(iris.proj, aes(x=LD1, y=LD2))
show(g + geom_point(aes(color=Class), size=3))

#wykonanie 10-krotnej kroswalidacji
train.control <- trainControl(method = "cv", number=10)
iris.cv <- train(Class ~ ., data = iris.scaled, method = "lda", trControl = train.control)
print(iris.cv)
print("Walidacja krzy¿owa wykazuje dok³adnoœæ modelu = 0.98 ")
