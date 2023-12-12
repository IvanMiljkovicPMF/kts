# Plan predavanja i upustva za predavača

## TestNG

1. Opisivanje **zašto se koristi i prednosti u odnosu na JUnit**
2. Spominjanje nekih **feature**-a
3. Dodavanje potrebnih **dependency**-a (TestNG i logeri)
4. **Pravljenje novog projekta** (klasična student klasa sa br. ispita do kraja, custom toString-om i daLiJePolozioSveIspite)
5. **Kreiranje test-a** za datu klasu
6. **Pokretanje testa i napomena za Default Suite**
7. Pokretanje testa koji **ima neki print** i koji treba da padne kako bi se **video izveštaj**
8. Demonstriranje **korišćenja logera** i opisivanje **zašto je bolje** koristiti njih (format, ...)
9. Kreiranje novog testa radi demonstriranja **rada anotacija `@BeforeMethod` i `@AfterMethod`**
10. Demonstriranje načina **rada anotacija `@BeforeClass`, `@AfterClass` i `@BeforeTest`**
11. **Opisati hijerarhiju** koja je deo izvrštaja sa leve strane (Suite > Test > Metodi...)
12. Kratak **opis konfiguracionog fajla**, njegovih mogućnosti i njegovo kreiranje
13. Definisanje **suite-a, test-a i niza klasa sa jednom testnom klasom** i pokretanje (Run) tog konfiguracionog fajla
14. **Komentarisanje izveštaja** (promena Default Suite-a)
15. Kreiranje više testnih klasa sa više test metoda radi **demonstriranja selekcije klasa preko XML-a**
16. Komentarisanje dobijenog izveštaja (hijerarhije)
17. Demonstriranje **isključivanja/uključivanja metoda** neke klase

18. Napomena da nazivi **parametara ne moraju da budu isti kao nazivi parametara metoda** nad kojim je anotacija postavljena
19. **Definisanje parametara u XML-u**
20. Napomena za **scope parametara** (važe u scope-u u kome su definisani)

21. Kratko opisivanje **zašto je korisno generisanje izveštaja**
22. Demonstriranje **generisanja izveštaja** u TestNG preko IntelliJ-a

## Selenium

1. **Kratak opis Seleniuma**
2. **Napomena oko pokretanja WAMP servera** (zbog kolokvijuma na kom je sajt pokrenut lokalno)
3. Opis opcija za **uključivanje zavisnosti koje se odnose na Web Driver**
4. **Kreiranje projekta i opis setup-a** (@BeforeSuite i @BeforeMethod)
5. Kreiranje testa koji **posećuje neku stranicu**
6. Demonstriranje **automatskog gašenja web browser-a** nakon testa
7. **Opis i napomene za klasu By**
8. Kreiranje testa koji se **pronalazi određeno search polje i proverava redirect**
9. Napomena da se neki **URL-ovi rezultata interakcija mogu iskoristiti**
10. Kreiranje testa kojim se dobija **više elemenata kao rezultat** (By.className)
11. Kreiranje testa kojim se **preko CSS selektora dobija i validira tekst paragrafa**
12. Kreiranje testa kojim se **pronalazi padajući meni i bira neka od opcija**
13. Kreiranje testa kojim se **pronalazi i klikće link na osnovu dela teksta**
14. Kreiranje testa kojim se **otvare meni**

**Nedovršeno!*