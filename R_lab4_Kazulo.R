library(ggplot2)
rm(list=ls())

#wczytanie danych
data("mtcars")
cars <- subset(mtcars)

#stworzenie kolumny typu character
t <- c("automatic", "manual")
cars$transmission <- ifelse(cars$am == 0, t[1], t[2])

#rysowanie wykresu
plot <- ggplot(cars)
show(plot + geom_point(aes(x = hp, y = qsec, fill = transmission, size = mpg), shape = 21) + xlab("Moc [KM]") + 
ylab("Czas na 1/4 mili [s]") + ggtitle("Dane z magazynu Motor Trend (1974)"))
