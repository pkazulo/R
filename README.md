Lab 2
Wylosuj n liczb z rozkładu normalnego o średniej m i odchyleniu standardowym s 
(n,m,s powinny być zmiennymi których wartość będzie można zmieniać w skrypcie). 
Następnie wykonaj histrogram z tych danych i umieść na wykresie empiryczną gęstość prawdopodobieństwa w postaci punktów.
Dodaj drugą serię do wykresu (czerwona linia), która będzie przedstawiać teoretyczną gęstość prawdopodobieństwa. 
Podpisz osie i dodaj legendę.

Lab 3
Wczytaj do pamięci zbiór danych ChickWeight i zapoznaj się z nim, a następnie stwórz ramkę danych zawierającą wyłacznie te rekordy, 
dla których wartość zmiennej Diet wynosi 1. Wykonaj wykres wagi kur od długości ich życia. 
Zbinuj dane i umieść na wykresie w postaci czerwonych punktów ze słupkami błędów odpowiadającymi niepewności standardowej. 
Dla zbinowanych danych wykonaj regresję liniową i wykreśl prostą najlepszego dopasowania w kolorze niebieskim. 
Zapisz do pliku tekstowego ramkę danych zawierającą trzy kolumny: współrzędne x i y punktów oraz niepewność standardową. 

Lab 4
Przedstaw zbiór danych mtcars na wykresie czasu na 1/4 mili w zależności od mocy. 
Samochody podziel ze względu na rodzaj skrzyni biegów. Rozmiar punktów jest propocjonalny do zużycia paliwa. 

Lab 5
W kolumnie WeightInitial w pliku http://www.if.pw.edu.pl/~paluch/MSR/data/goats.txt zapisano wagę (w kg) losowo wybranych młodych kóz hodowanych w Australii. 
Wiadomo, że rozkład badanej cechy jest normalny.
  1. Na poziomie istotności 0.05 przetestować hipotezę, że średnia waga młodych kóz hodowanych w Australii przekracza 23 kg.
  2. Zakładając, że rzeczywista średnia waga młodych kóz hodowanych w Australii wynosi 24 kg, wyznaczyć prawdopodobieństwo, 
     że przeprowadzając test na poziomie istotności 0.05 i na podstawie 40 obserwacji, błędnie uznamy, 
     że średnia waga takich kóz nie przekracza 23 kg.
  3. Załóżmy, że rzeczywista średnia waga młodych kóz hodowanych w Australii wynosi 24 kg. 
     Ile trzeba by zebrać pomiarów wag takich kóz, by test (przeprowadzony na poziomie istotności 0.05) wykrywal, 
     z prawdopodobieństwem nie mniejszym niż 0.8, że średnia waga takich kóz przekracza 23 kg?

Lab 6
Wczytaj dane z pliku http://www.if.pw.edu.pl/~paluch/MSR/data/zad6.txt zawierającego 200 liczb losowych z pewnego rozkładu. 
Zweryfikuj następujące hipotezy:
  1. dane pochodzą z rozkładu normalnego
  2. dane pochodzą z rozkładu Poissona o parametrze λ=4 
  3. dane pochodzą z rozkładu wykładniczego o parametrze λ=0.25
Następnie wykonaj histogram w oparciu o te dane, umieść empiryczną gęstość prawdopodobieństwa na wykresie w postaci punktów 
i teoretyczną gęstość prawdopodobieństwa w postaci linii ciągłej.

Lab 7
Wczytaj zbiór danych iris z biblioteki datasets i zapoznaj się z nim. 
Następnie sprawdź (wykonując testy normalności i równości wariancji międzygrupowej), 
która cecha kwiatów spełnia najlepiej założenia jednoczynnikowej analizy wariancji. 
Dla tej cechy wykonaj ANOVA, skomentuj wynik analizy i wykonaj wykres pudełkowy.
  
Lab 8
Wczytaj zbiory danych Pima.tr i Pima.te z biblioteki MASS i zapoznaj się z nim. 
Dla zbioru Pima.tr wykonaj model regresji logistycznej i określ które cechy są statystycznie istotne przy określaniu cukrzycy. 
Następnie sprawdź skuteczność predykcyjną modelu przy użyciu zbioru Pima.te. 
Niech metoda predict zwraca prawdopodobieństwo bycia chorym na cukrzyce, 
które następnie przy pomocy funkcji ifelse należy zamienić na odpowiedź binarną (chory=1, zdrowy=0). 
Jako próg prawdopodobieństwa powyżej którego uznajemy osobnika za chorego przyjąć 0.5. 
Oblicz skuteczność modelu według poniższego wzoru. 
  
Lab 9
Wczytaj zbiór danych Salaries z biblioteki carData i zapoznaj się z nim. Potraktuj zmienną salary jako odpowiedź,
a zmienne rank, discipline, sex jako zmienne wyjaśniające. Przy pomocy funkcji table sprawdź czy grupy są równoliczne. 
Wykonaj dwa wykresy skrzynkowe, jeden dla mężczyzn a drugi dla kobiet. 
Porównaj ze sobą wyniki trójczynnikowych analiz wariancji wykonanych bez interakcji oraz z interakcjami. Zinterpretuj wyniki. 
Zadanie wykonaj dwukrotnie, za pierwszym razem przy założeniu balanced design, a za drugim razem dla unbalanced design.
  
Lab 10
Wczytaj zbiór danych Greene z biblioteki carData i zapoznaj się z nim. 
Potraktuj zmienną decision jako odpowiedź, a pozostałe zmienne za wyjątkiem kolumny success jako zmienne wyjaśniające. 
Podziel zbiór na podzbiór uczący (75%) i treningowy (25%). Wykonaj regresję logistyczną a następnie wykreśl krzywą ROC. 
Znajdź optymalny punkt podziału i wykonaj dla niego macierz pomyłek oraz oblicz skuteczność klasyfikacji.

Lab 11
Wczytaj zbiór danych iris z biblioteki datasets i zapoznaj się z nim. 
Przeskaluj wektory numeryczne w tej ramce danych odejmując wartość średnią i dzieląc przez odchylenie standardowe. 
Wykonaj liniową analizę dyskryminacyjną na całym zbiorze, a następnie zrzutuj wszystkie obserwacje (oryginalnie czterowymiarowe) 
na płaszczyznę dwuwymiarową określoną przez proste wyznaczone w LDA. 
Dokonaj wizualizacji tak przetransformowanych obserwacji w pakiecie ggplot2. 
Sprawdź skuteczność klasyfikacji wykonując dowolną walidację krzyżową.





  
  
