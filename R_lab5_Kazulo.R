rm(list=ls())

#wczytanie danych
goats <- read.table("goats.txt", header = TRUE)
#A
alpha <- 0.05
mu <- 23
n <- length(goats$WeightInitial)
wynik <- t.test(goats$WeightInitial, alternative = "greater", mu=mu)
ifelse(wynik$p.value>alpha, print("Œrednia waga nie przekracza 23kg"), print("Œrednia waga przekracza 23kg"))
#B
mu1 <- 24
moc <- power.t.test(n, delta=mu1-mu, sd=sd(goats$WeightInitial), sig.level = alpha, type="one.sample", alternative = "one.sided")
cat("Prawdopodobieñstwo b³êdnego uznania, ¿e waga kóz nie przekracza 23kg: ", 1-moc$power, "\n")
#C
moc2 <- power.t.test(delta=mu1-mu, sd=sd(goats$WeightInitial), sig.level = alpha, type="one.sample", alternative = "one.sided", power = 0.8)
cat("Iloœæ pomiarów potrzebnych do tego, aby test wykrywa³ z prawd. >= 0.8, ¿e waga kóz > 23kg: ", ceiling(moc2$n), "\n")

