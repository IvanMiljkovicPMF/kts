# Zadaci

- [Equivalence Class Partitioning](#equivalence-class-partitioning)
- [Boundary Value Analysis](#boundary-value-analysis)
- [Cause-Effect Graph](#cause-effect-graph)
- [Coverage](#coverage)
  - [LCSAJ](#lcsaj)
  - [Dve ili više tehnike](#dve-ili-više-tehnike)

## Equivalence Class Partitioning

### Zadatak 1

Za program **Triangle Analysis** implementirati i ispitati test slučajeve definisane u [Excel fajlu][ecp - z1 - input].
Na kraju istog fajla se nalazi i zadatak u kome je potrebno osmisliti test scenario i implementirati ga.

Nakon što rešite zadatak, možete uporediti svoje rezultate sa [ponuđenim rezultatima][ecp - z1 - resenje], kao i kod
sa [ponuđenim rešenjem][ecp - z1 - resenje kod]


## Boundary Value Analysis


## Cause-Effect Graph

## Coverage

### LCSAJ

#### Zadatak 1

Za kod sa slike odredi tabelu LCSAJ sekvenci. Obavezno je dati kratak komentar za svaki unos
u tabeli. Nije potrebno kreirati test primere na osnovu kreirane tabele.

![Kod za primer - Najčešća reč][lcsaj - z1 - kod]

---

Odgovor:

Krećemo od definicije metode, što je u ovom kodu linija `1`.

Postoje 2 pristupa za obeležavanje skoka:
1. skok na prvi sledeći statement
2. skok na liniju koja sledi nakon linije koje završava scope date kontrole (najčešće nakon `}`)

Na ovom kursu koristimo 2. pristup. Tim pristupom je omogućeno da se skok izvrši na komentar ili
praznu liniju. 

Kada završimo inicijalnu identifikaciju sekvenci koje kreću od definicije metode, naredne sekvence započinjemo
od linija na koje je izvršen skok (u tabeli, to su vrednosti u koloni `Skok`).

Početne sekvence u nekim pristupima kreću od definicije metode, a u drugim od prve linije tela te metode. Radi jednostavnosti i usklađenosti,
na ovom kursu je izabran prvi pristup.

Kada iscrpimo sve mogućnosti za sekvence koje počinju sa jednom od tih vrednosti (iz kolone`Skok`), prelazimo na sledeću vrednost.

| Oznaka sekvence |	Početak sekvence | Kraj sekvence | Skok | Komentar |
|:---------------:|:----------------:|:-------------:|:----:|:--------|
| s01             | 01               | 05            | 20   | skok u 5. liniji jer uslov `i < words.size()` nije ispunjen |
| s02             | 01               | 09            | 14   | skok u 9. liniji jer uslov `j < words.size()` nije ispunjen |
| s03             | 01               | 10            | 13   | skok u 10. liniji jer uslov `word.equals(words.get(j))` nije ispunjen |
| s04             | 01               | 13            | 09   | došlo je do linearnog izvršenja kroz oba `for`-a i `if`. Pošto je izvršeno telo unutrašnje petlje, imamo skok na njen početak radi provere uslova         |
| s05             | 20               | 23            | -1   | `return`-om na 23. liniji izlazimo iz metode |
| s06             | 14               | 15            | 19   | skok u 15. liniji jer uslov `count > maxCount` nije ispunjen |
| s07             | 14               | 19            | 05   | uslov `count > maxCount` je ispunjen pa se kod izvršava do kraja petlje, nakon čega sledi skok na 5. liniju radi provere uslova        |
| s08             | 13               | 13            | 09   | sekvenca kreće od 13. linije, ali pošto je reč o kraju petlje, samo vršimo skok na početak petlje, tj. na 9. liniju         |
| s09             | 09               | 09            | 14   | izvršava se 9. linija, utvrđuje se da uslov `j < words.size()` nije ispunjen pa sledi skok |
| s10             | 09               | 10            | 13   | skok u 10. liniji jer uslov `word.equals(words.get(j))` nije ispunjen |
| s11             | 09               | 13            | 09   | cela unutrašnja petlja je izvršena pa se vrši skok sa njenog kraja na početak |
| s12             | 19               | 19            | 05   | sekvenca kreće od 19. linije, ali pošto je reč o kraju petlje, samo vršimo skok na početak petlje, tj. na 5. liniju         |
| s13             | 05               | 05            | 20   | izvršava se 5. linija, utvrđuje se da uslov `i < words.size()` nije ispunjen pa sledi skok |
| s14             | 05               | 09            | 14   | skok u 9. liniji jer uslov `j < words.size()` nije ispunjen |
| s15             | 05               | 10            | 13   | skok u 10. liniji jer uslov `word.equals(words.get(j))` nije ispunjen |
| s16             | 05               | 13            | 09   | kod se linearno izvršavao do kraja unutrašnje petlje nakon čega je usledio skok na 13. liniji (povratak na proveru uslova) |

##### Česte greške

| Oznaka greške |	Greška | Opis | Rešenje / Savet |
|:-------------:|:-------|:-----|:--------|
| e01           | Završavanje sekvence u poslednjoj liniji nekog bloka (npr. pre `}` u `if`-u) | Sekvence: (1, 11, 13), (9, 11, 13), (14, 17, 19), ... | Kada se linije izvršavaju jedna za drugom, kao što je slučaj pri prolazu kroz `if` u datom primeru, nema prekida sekvence kada je uslov ispunjen. Ispravne sekvence iz primera (respektivno): s04, s11, s07 |
| e02           | Skok na liniju koja se nalazi pre linije na koju treba skočiti | Sekvenca (1, 5, 19) nije ispravna jer je 19. linija deo koda koji se preskače | Sekvenca (1, 5, 20) je ispravna jer kod preskače 19. liniju koja je deo datog iskaza i skače na 20. liniju, od koje neka naredna sekvenca treba da nastavi izvršenje koda | 
| e03           | Ignorisanje `return` iskaza na kraju metoda | `return mostCommonWord` na 23. liniji iz datog primera. Loše identifikovana sekvenca: (20, 24, -1) | (20, 23, -1) je ispravna sekvenca zato što dolazi do izlaska iz metode nakon izvršenja ovog iskaza. Ovo je slična situacija sa primerom koji sadrži `break`, dolazi do skoka pa se na tom mestu završava sekvenca | 
| e04           | Izostavljena sekvenca za `true` odluku | Pronađu se sekvence s01, s02, ali ne i sekvence u kojima je `j < words.size()` ispunjeno | Uzeti u obzir situaciju kada je `j < words.size()` ispunjeno. Tada možemo ući u telo petlje koje sadrži `if`. On može imati skok ukoliko njegov uslvo nije ispunjen pa imamo 2 moguće sekvence: jednu u kojoj dolazi do tog skoka i drugu u kojoj ne dolazi do njega, tj. s03 i s04 | 
| e05           | Nisu identifikovane sekvence koje se nastavljaju na neki skok | Identifikovali smo sekvencu s02, tj. (1, 9, 14), ali nismo identifikovali sekvence koje nastavljaju na ovu sekvencu, počevši od 14. linije | Tamo gde jedna linearna sekvenca treba da skoči, druga počinje. Tačnije, mi skačemo sa jedne na drugu. Ako trebamo da skočimo dalje na 14. liniju, to onda znači da ćemo imati barem jednu sekvencu koja će početi od ove linije. Primer sekvenci koje možemo identifikovati: s06, s07 | 
| e06           | Linearna sekvenca je nemoguća jer sadrži skok | Sekvenca (5, 15, 19) nije moguća jer nije reč o linearnoj sekvenci | Da bismo došli do 15. linije, potrebno je da prođemo `for`, a on sadrži uvek skok: skok koji zaobilazi telo petlje (kada je uslov `false`) i skok kojim se nakon izvršenog tela petlje vraćamo na proveru uslova (kada je uslov `true`). To znači da nikada ne bismo imali linearnu sekvencu do 15. linije | 
| e07           | Nije identifikovana sekvenca čija početna linija sadrži odluku | Neka je identifikovana sekvenca s16, tj. (5, 13, 9). To znači da treba da se nastavi na sekvencu koja počinje sa 9. linijom. Jedna od takvih sekvenci je sekvenca s09, tj. (9, 9, 14). U toj sekvenci izvršavamo 9. liniju, ali pošto uslov `j < words.size()` nije ispunjen, dolazi do skoka na 14. liniju  | Obratiti pažnju kod ovakvih slučajeva. Ukoliko se kreće od linije koja sadrži odluku, uvek ćemo imati sekvencu dužine 1 (slučaj kada se taj iskaz odluke evaluira na `false` )
| e08           | Nije identifikovana sekvenca koja počinje i završava se sa krajem petlje | Sekvenca s08, tj. (13, 13, 9) je sekvenca u kojoj nemamo nikakav konkretan kod. Sadrži samo `}` koje predstavlja kraj scope-a tela petlje i nakon njegovog izvršavanje potrebno je izvršiti skok nazad na početak petlje.  | Ove sekvence se najčešće javljaju kada sledeća linija nakon izlaska iz nekog bloka skokom predstavlja liniju kojom se završava petlja. Tada je početak ujedno i kraj, a onda se vrši skok na početak petlje kako bi se proverio uslov
| e09           | Nevalidno definisanje skoka za izlazak iz metode | Sekvence (20, 24, 24) ili (20, 23, 24) nisu validne jer tada nije potrebno da se izvršenje vrati na 24. liniju, koja je deo tela metode, već da se preusmeri pozivaocu date metode. Dolazi do izlaska iz metode | Ukoliko imamo skok iz metode, kao što je `return` ili dolazak do kraja tela te metode (`}`), taj skok obeležavamo sa `-1`, `END` ili `kraj`. Sekvenca se završava skokom | 
| e10           | Skok na pogrešan deo koda | Vrši se skok na deo koda koji nije u blizini odgovarajuće linije na koju treba skočiti. Na primer, sekvenca od 1 do 13 se greškom skoči na 5. liniju umesto na 9. liniju pošto se dati skok odnosi na unutrašnju petlju. | Ovakve greške se najčešće javljaju slučajno kada pomešamo kontekste / scope u žurbi. Zbog toga ovakve situacije u kojima imamo neke skokove na neke ranije linije treba pažljivo analizirati. Praćenje linije koju crta IDE između početka i kraja bloka može da nam olakša ovakve situacije | 
| e11           | Izostavljena sekvenca za `false` odluku |  |  | 
| e12           | Sekvenca se završava na pogrešnoj liniji | (1, 9, 13) umesto (1, 10, 13) |  | 
| e13           | Više sekvenci koje se razlikuju samo po skoku | (1. 9, 13) i (1. 9, 15) |  | 
| e14           | Skok je linija nakon kraja sekvence (ne odnosi se na GOTO) |  |  | 
| e15           | Nije definisana sekvenca, tj. trojka `(početak, kraj, skok)` |  |  | 


### Dve ili više tehnike

#### Zadatak 1

Koliko nam testova treba za 100% **Statement Coverage**, a koliko za 100% **Decision Coverage**?

```Java
if (a > b) {                                              // L1; O1
    if (a > c) {                                          // L2; O2
        if (a > d) {                                      // L3; O3
            if (a > e) {                                  // L4; O4
                System.out.println("a je najveci broj");  // L5
            }                                             // L6
        }                                                 // L7
    }                                                     // L8
}                                                         // L9
```

<details>
  <summary>
  <b>
    Odgovor
  </b>
  </summary>
  <u>Za Statement Coverage</u>: 1 test (TP1) <br>

  &nbsp; TP1: (a, b, c, d, e) = (15, 14, 13, 12, 11) <br>
  &nbsp; &nbsp; &nbsp; Obuhvate sve linije 
  {<b>L1</b>, <b>L2</b>, <b>L3</b>, <b>L4</b>, <b>L5</b>, <b>L6</b>, <b>L7</b>, <b>L8</b>, <b>L9</b>} 
  i grane {<b>O1-true</b>, <b>O2-true</b>, <b>O3-true</b>, <b>O4-true</b>} <br>
  <br>
  <u>Za Decision Coverage</u>: 5 testova (TP1, TP2, TP3, TP4, TP5)  <br>

  &nbsp; TP2: (a, b, c, d, e) = (1, 4, 3, 2, 1) <br>
  &nbsp; &nbsp; &nbsp; Obuhvata linije {L1, L9} i grane {<b>O1-false</b>} <br>

  &nbsp; TP3: (a, b, c, d, e) = (5, 4, 7, 7, 7) <br>
  &nbsp; &nbsp; &nbsp; Obuhvata linije {L1, L2, L8, L9} i grane {O1-true, <b>O2-false</b>} <br>

  &nbsp; TP4: (a, b, c, d, e) = (6, 3, 4, 10, 9) <br>
  &nbsp; &nbsp; &nbsp; Obuhvata linije {L1, L2, L3, L7, L8, L9} i grane {O1-true, O2-true, <b>O3-false</b>} <br>

  &nbsp; TP5: (a, b, c, d, e) = (5, 4, 3, 2, 1) <br>
  &nbsp; &nbsp; &nbsp; Obuhvata linije {L1, L2, L3, L4, L6, L7, L8, L9} i grane {O1-true, O2-true, O3-true, <b>O4-false</b>} <br>

  TP1 test je iskorišćen u obe tehnike. Kod prve pokriva sve statement-e, a kod druge sve true grane. 
  <b>TP2-TP5 pokrivaju else grane iako ne postoje</b> jer Decision Coverage-a zahteva njihovo pokrivanje.

</details> 


[#]: / (---------------------------------------------------------)

[ecp - z1 - input]: ./z1/klase_ekvivalencije.xlsx
[ecp - z1 - resenje]: ./z1/klase_ekvivalencije_resenje.xlsx
[ecp - z1 - resenje kod]: ./z1/kod
[lcsaj - z1 - kod]: ../slike/zadaci-lcsaj-z-01.png