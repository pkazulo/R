rm(list=ls())

#wczytanie danych
data <- read.table("http://www.if.pw.edu.pl/~paluch/MSR/data/zad6.txt")

#wykonanie testu na zgodnoœæ z rozk³adem normalnym
print(shapiro.test(data$V1))
print("P-value testu jest mniejsze od 0.05, a wiêc s¹ podstawy do odrzucenia hipotezy zerowej, ¿e dane podlegaj¹ rozk³adowi normalnemu")

#wykonanie testu na zgodnoœæ z rozk³adem Poissona, gdzie lambda = 4
h <- hist(data$V1)
print(chisq.test(h$counts, p = dpois(h$mids, lam = 4), rescale.p = TRUE))
print("P-value testu jest mniejsze od 0.05, a wiêc s¹ podstawy do odrzucenia hipotezy zerowej, ¿e dane podlegaj¹ rozk³adowi Poissona o parametrze lambda = 4")

#wykonanie testu na zgodnoœæ z rozk³adem wyk³adniczym, gdzie lambda = 0.25
print(ks.test(data$V1, "pexp", rate = 0.25))

#wykreœlenie empirycznej i teoretycznej gêstoœci prawdopodobieñstwa
print("P-value testu jest wiêksze od 0.05, a wiêc nie ma podstaw do odrzucenia hipotezy zerowej, ¿e dane podlegaj¹ rozk³adowi wyk³adniczemu o prametrze lambda = 0.25")
plot(h$mids, h$density, xlab = "x", ylab = "p(x)",pch = 19, main = "Wykres empirycznej i teoretycznej gêstoœci prawdopodobieñstwa" )
lines(seq(0,30,0.1), dexp(seq(0,30,0.1), rate = 0.25), col="blue", lwd = 2)
