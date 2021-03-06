rm(list=ls())

#wczytanie danych
data <- read.table("http://www.if.pw.edu.pl/~paluch/MSR/data/zad6.txt")

#wykonanie testu na zgodno�� z rozk�adem normalnym
print(shapiro.test(data$V1))
print("P-value testu jest mniejsze od 0.05, a wi�c s� podstawy do odrzucenia hipotezy zerowej, �e dane podlegaj� rozk�adowi normalnemu")

#wykonanie testu na zgodno�� z rozk�adem Poissona, gdzie lambda = 4
h <- hist(data$V1)
print(chisq.test(h$counts, p = dpois(h$mids, lam = 4), rescale.p = TRUE))
print("P-value testu jest mniejsze od 0.05, a wi�c s� podstawy do odrzucenia hipotezy zerowej, �e dane podlegaj� rozk�adowi Poissona o parametrze lambda = 4")

#wykonanie testu na zgodno�� z rozk�adem wyk�adniczym, gdzie lambda = 0.25
print(ks.test(data$V1, "pexp", rate = 0.25))

#wykre�lenie empirycznej i teoretycznej g�sto�ci prawdopodobie�stwa
print("P-value testu jest wi�ksze od 0.05, a wi�c nie ma podstaw do odrzucenia hipotezy zerowej, �e dane podlegaj� rozk�adowi wyk�adniczemu o prametrze lambda = 0.25")
plot(h$mids, h$density, xlab = "x", ylab = "p(x)",pch = 19, main = "Wykres empirycznej i teoretycznej g�sto�ci prawdopodobie�stwa" )
lines(seq(0,30,0.1), dexp(seq(0,30,0.1), rate = 0.25), col="blue", lwd = 2)
