rm(list=ls())
library(car)
library(carData)
library(ggplot2)

#wczytanie danych
sal <- Salaries[,c(1,2,5,6)]
salfem <- sal[sal$sex == "Female",]
salmal <- sal[sal$sex == "Male",]

#tabelaryzacja danych
tabfem <- table(salfem$rank, salfem$discipline)
print("Tabela kobiety")
print(tabfem)
tabmal <- table(salmal$rank, salmal$discipline)
print("Tabela m�czy�ni")
print(tabmal)
print("Na podstawie tabel mo�na wnioskowa�, �e grupy nie s� r�wnoliczne")

#wizualizacja danych za pomoc� wykres�w pude�kowych (podzia� na kobiety i m�czyzn)
theme_set(theme_bw())
gfem <- ggplot(salfem)
show(gfem + geom_boxplot(aes(x=rank, y=salary, color=discipline)) + labs(x="rank", y="salary", color="discipline") + ggtitle("Zarobki profesor�w-kobiet w USA"))
gmal <- ggplot(salmal)
show(gmal + geom_boxplot(aes(x=rank, y=salary, color=discipline)) + labs(x="rank", y="salary", color="discipline") + ggtitle("Zarobki profesor�w-m�czyzn w USA"))

#wieloczynnikowa analiza wariancji przy za�o�eniu r�wnoliczno�ci grup

#tr�jczynnikowa analiza wariancji bez interakcji
sal.aov.noint <- aov(salary ~ sex+rank+discipline, data=sal)
print(summary(sal.aov.noint))

#tr�jczynnikowa analiza wariancji z interakcjami
sal.aov.int <- aov(salary ~ sex*rank*discipline, data=sal)
print(summary(sal.aov.int))

#wieloczynnikowa analiza wariancji przy za�o�eniu nier�wnoliczno�ci grup

#tr�jczynnikowa analiza wariancji bez interakcji
unbal.sal.aov.noint <- Anova(sal.aov.noint, type="III")
print(unbal.sal.aov.noint)

#tr�jczynnikowa analiza wariancji z interakcjami
unbal.sal.aov.int <- Anova(sal.aov.int, type="III")
print(unbal.sal.aov.int)

print("Analizy wariancji przy podej�ciu balanced design wykazuj� istotny wp�yw wszystkich zmiennych wyja�niaj�cych na zarobki, jednak nie wykazuj� interakcji pomi�dzy tymi zmiennymi.")
print("Najwi�kszy wp�yw ma posiadany stopie�, a najmniejszy p�e�. Mo�na tak swtierdzi� na podstawie warto�ci F.")
print("Analizy wariancji przy podej�ciu unbalanced design wykazuj� wp�yw stopnia naukowego oraz (w mniejszym stopniu) uprawianej dyscypliny na zarobki w przypadku braku interakcji, a tylko rangi w modelu z interakcjami.")
print("Przy podej�ciu unbalanced design nie wykazano istotnego wp�ywu p�ci na zarobki")
