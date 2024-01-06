# WAMP

[wamp download]

1. Preuzimanje WAMP-a 
2. Instalacija WAMP-a
   * Instalacija zavisnosti (Visual C++) ukoliko nisu instalirane. Mogu se naći na [WAMP-ovoj stranica za fajlove][deps - main] 
   ili [kao upakovana celnia koja sadrži sve neophodne zavisnosti na jednom mestu][deps - VisualCppRedist AIO]
3. Dodavanje sajta u `www` folder: `c:\wamp\www` (nije uvek ovde, zavisi od verzije i podešavanja)
4. Posećivanje phpMyAdmin-a na adresi: http://localhost/phpmyadmin
5. Prijava phpMyAdmin
   * username: `root`
   * password:  prazno polje (blank)
6. Import baze preko phpMyAdmin-a

---

Indikator WAMP-a ima više boja kojima se prikazuje status servisa:
* Crvena: ni jedan servis nije pokrenut
* Žuta: neki servisi su pokrenuti
* Zelena: svi servisi su pokrenuti

![Boje taskbar indikatora za WAMP](../slike/wamp-indicator.png)

---

Nekada može postojati potreba za promenom podrazumevanih portova. Koristi sledeće portove:
* `80` za Apache
* `3306` za MariaDB
* `3308` za MySQL

![Opcije za portove na WAMP-u](../slike/wamp-ports.png)

[#]: / (---------------------------------------------------------)

[wamp download]: https://sourceforge.net/projects/wampserver
[deps - main]: https://wampserver.aviatechno.net
[deps - VisualCppRedist AIO]: https://github.com/abbodi1406/vcredist/releases/latest

