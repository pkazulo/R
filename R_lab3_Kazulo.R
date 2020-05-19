library(fields)
library(Hmisc)
rm(list=ls())

#wczytanie danych
data("ChickWeight")
ChickWeight <- subset(ChickWeight, Diet==1)
x <- ChickWeight$Time
y <- ChickWeight$weight

#zbinowanie danych
xy.sb <- stats.bin(x, y)
x.sb <- xy.sb$centers
y.sb <- xy.sb$stats[2,]
e.sb <- xy.sb$stats[3,]
N.sb <- xy.sb$stats[1,]

#wykonanie regresji liniowej
xy.lm <- lm(y.sb ~ x.sb)
a.xy <- xy.lm$coefficients[2]
b.xy <- xy.lm$coefficients[1]

#wykreœlenie danych, zbinowanych danych oraz dopasowanej prostej
plot(x,y, xlab = "dzieñ", ylab = "waga [g]", col = "gray")
errbar(x.sb, y.sb, y.sb+e.sb/sqrt(N.sb), y.sb-e.sb/sqrt(N.sb), col = "red", errbar.col = "red", xlab = "dzieñ", ylab = "waga [g]", xlim = c(-1,22))
points(x, y, col="gray", pch=19)
lines(x.sb, a.xy*x.sb+b.xy, col="blue")

#zapsanie danych do pliku
d <- data.frame(X = x.sb, Y = y.sb, std.err = e.sb)
write.table(d, "kurczaki.dat")