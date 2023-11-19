# Zadaci

- [Equivalence Class Partitioning](#equivalence-class-partitioning)
- [Boundary Value Analysis](#boundary-value-analysis)
- [Cause-Effect Graph](#cause-effect-graph)
- [Coverage](#coverage)
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
  **TP2-TP5 pokrivaju else grane iako ne postoje** jer Decision Coverage-a zahteva njihovo pokrivanje.

</details> 


[#]: / (---------------------------------------------------------)

[ecp - z1 - input]: ./z1/klase_ekvivalencije.xlsx
[ecp - z1 - resenje]: ./z1/klase_ekvivalencije_resenje.xlsx
[ecp - z1 - resenje kod]: ./z1/kod