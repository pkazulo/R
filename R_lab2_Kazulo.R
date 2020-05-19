rm(list=ls())

#losowanie n liczb z rozk³adu normalnego okreœlonego m i s
n = 500
m = 3
s = 0.6
x <- rnorm(n,m,s)

#okreœlenie wspó³rzêdnych dla rozk³¹du teoretycznego oraz zakresu x na wykresie
#dziêki temu wykres bêdzie siê dostosowywa³ do podanych parametrów rozk³adu
lim <- seq(m - 4 * s, m + 4 * s, s/100)

#wykreœlenie danych z histogramu i teorii
h <- hist(x, breaks = 15)
plot(h$mids, h$density, xlim = lim[c(1,length(lim))], ylim = c(0,max(h$density)+0.3), pch = 19, xlab = "x", ylab = "f(x)")
lines(lim, dnorm(lim,m,s),col = "red")
legend("topleft", legend = c("data", "fit"), lty =  c(NA, 1) ,pch = c(19, NA), col = c("black", "red"))