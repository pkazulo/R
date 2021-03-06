rm(list=ls())

#losowanie n liczb z rozk�adu normalnego okre�lonego m i s
n = 500
m = 3
s = 0.6
x <- rnorm(n,m,s)

#okre�lenie wsp�rz�dnych dla rozk��du teoretycznego oraz zakresu x na wykresie
#dzi�ki temu wykres b�dzie si� dostosowywa� do podanych parametr�w rozk�adu
lim <- seq(m - 4 * s, m + 4 * s, s/100)

#wykre�lenie danych z histogramu i teorii
h <- hist(x, breaks = 15)
plot(h$mids, h$density, xlim = lim[c(1,length(lim))], ylim = c(0,max(h$density)+0.3), pch = 19, xlab = "x", ylab = "f(x)")
lines(lim, dnorm(lim,m,s),col = "red")
legend("topleft", legend = c("data", "fit"), lty =  c(NA, 1) ,pch = c(19, NA), col = c("black", "red"))