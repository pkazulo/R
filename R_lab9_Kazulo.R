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
print("Tabela mê¿czyŸni")
print(tabmal)
print("Na podstawie tabel mo¿na wnioskowaæ, ¿e grupy nie s¹ równoliczne")

#wizualizacja danych za pomoc¹ wykresów pude³kowych (podzia³ na kobiety i mê¿czyzn)
theme_set(theme_bw())
gfem <- ggplot(salfem)
show(gfem + geom_boxplot(aes(x=rank, y=salary, color=discipline)) + labs(x="rank", y="salary", color="discipline") + ggtitle("Zarobki profesorów-kobiet w USA"))
gmal <- ggplot(salmal)
show(gmal + geom_boxplot(aes(x=rank, y=salary, color=discipline)) + labs(x="rank", y="salary", color="discipline") + ggtitle("Zarobki profesorów-mê¿czyzn w USA"))

#wieloczynnikowa analiza wariancji przy za³o¿eniu równolicznoœci grup

#trójczynnikowa analiza wariancji bez interakcji
sal.aov.noint <- aov(salary ~ sex+rank+discipline, data=sal)
print(summary(sal.aov.noint))

#trójczynnikowa analiza wariancji z interakcjami
sal.aov.int <- aov(salary ~ sex*rank*discipline, data=sal)
print(summary(sal.aov.int))

#wieloczynnikowa analiza wariancji przy za³o¿eniu nierównolicznoœci grup

#trójczynnikowa analiza wariancji bez interakcji
unbal.sal.aov.noint <- Anova(sal.aov.noint, type="III")
print(unbal.sal.aov.noint)

#trójczynnikowa analiza wariancji z interakcjami
unbal.sal.aov.int <- Anova(sal.aov.int, type="III")
print(unbal.sal.aov.int)

print("Analizy wariancji przy podejœciu balanced design wykazuj¹ istotny wp³yw wszystkich zmiennych wyjaœniaj¹cych na zarobki, jednak nie wykazuj¹ interakcji pomiêdzy tymi zmiennymi.")
print("Najwiêkszy wp³yw ma posiadany stopieñ, a najmniejszy p³eæ. Mo¿na tak swtierdziæ na podstawie wartoœci F.")
print("Analizy wariancji przy podejœciu unbalanced design wykazuj¹ wp³yw stopnia naukowego oraz (w mniejszym stopniu) uprawianej dyscypliny na zarobki w przypadku braku interakcji, a tylko rangi w modelu z interakcjami.")
print("Przy podejœciu unbalanced design nie wykazano istotnego wp³ywu p³ci na zarobki")
