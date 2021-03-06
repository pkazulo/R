rm(list=ls())

#wczytanie danych
goats <- read.table("goats.txt", header = TRUE)
#A
alpha <- 0.05
mu <- 23
n <- length(goats$WeightInitial)
wynik <- t.test(goats$WeightInitial, alternative = "greater", mu=mu)
ifelse(wynik$p.value>alpha, print("�rednia waga nie przekracza 23kg"), print("�rednia waga przekracza 23kg"))
#B
mu1 <- 24
moc <- power.t.test(n, delta=mu1-mu, sd=sd(goats$WeightInitial), sig.level = alpha, type="one.sample", alternative = "one.sided")
cat("Prawdopodobie�stwo b��dnego uznania, �e waga k�z nie przekracza 23kg: ", 1-moc$power, "\n")
#C
moc2 <- power.t.test(delta=mu1-mu, sd=sd(goats$WeightInitial), sig.level = alpha, type="one.sample", alternative = "one.sided", power = 0.8)
cat("Ilo�� pomiar�w potrzebnych do tego, aby test wykrywa� z prawd. >= 0.8, �e waga k�z > 23kg: ", ceiling(moc2$n), "\n")

