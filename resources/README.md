# Salon samochodowy

| Nazwisko i imię| Kierunek          | Przedmiot   | Semestr | Rok akademicki |
| Piotr Paruch   | Informatyka EAIIB | Bazy danych | 4		 | 2019/2020      |
| :-------------:| :---------------: | :---------: | :-----: | :------------: |

## Struktura projektu
```bash
.
├── /resources/    # Pliki zasobów w projekcie (SS, rysunki, schematy)
│   └── /README.md # Opis projektu w formie pliku markdown
├── /src/          # Katalog główny projektu
│   ├── /app/      # Kod źródłowy aplikacji
│   └── /sql/      # Zapytania SQL
├── /.gitignore    # Pliki i foldery pomijane przy commitowaniu do repozytorium
└── /README.md     # Opis projektu: wytyczne
```
### Projekt bazy danych

![Alt text](/resources/Diagram1.svg)
<img src="/resources/Diagram1.svg">

### Implementacja zapytań SQL
1. Wyszukiwanie klientów: wszystkich, wg nazwiska lub wg przedziału id:
    ```sql
    select * from klienci;
	
	select * from salon.klienci where Nazwisko = ?;
	
	select * from salon.klienci where idKlienta between min and max;
    ```
2. Dodaj / usuń / aktualizuj klienta z bazy:
    ```sql
    insert into salon.klienci (imie, nazwisko) values (?, ?);
	
	delete from salon.klienci where idKlienta = ?;
	
	update salon.klienci set Imie = ?, Nazwisko = ? where idKlienta = ?;
    ```
3. Wyświetl zamówienia wszystkie / wg id klienta / aktualizuj zamówienie: 
    ```sql
	select * from salon.zamowienia;
	
    select * from salon.zamowienia where idKlienta = ?;
	
	update salon.zamowienia set idKlienta = ?, idSamochodu = ?, data_zamowienia = ?, metoda_platnosci = ? where idZamowienia = ?;
    ```
4. Dodaj zamówienie: 
	```sql
	insert into salon.zamowienia(idKlienta, idSamochodu, data_zamowienia, metoda_platnosci) values (?, ?, ?, ?);
	```
5. Wyświetl dostępne samochody:
	```sql
	select mar.nazwa as Marka, mo.nazwa as Model, nad.nazwa as Nadwozie, sil.rodzaj_paliwa as Paliwo, sil.pojemnosc as Pojemnosc, sil.uklad as Uklad, sil.moc as Moc, sil.moment_obrotowy as Moment_obrotowy, kon.kolor as Kolor, sm.sztuk as Dostepnych_Szt from samochody s inner join marki mar on s.idMarki = mar.idMarki inner join modele mo on s.idModelu = mo.idModelu inner join konfiguracje kon on s.idKonfiguracji = kon.idKonfiguracji inner join nadwozia nad on kon.idNadwozia = nad.idNadwozia inner join silniki sil on kon.idSilnika = sil.idSilnika inner join stan_magazynowy sm on s.idSamochodu = sm.idSamochodu where sm.sztuk > 0 order by ?;
	```
### Aplikacja
Aplikacja konsolowa - do prezentacji podczas oddawania projektu.