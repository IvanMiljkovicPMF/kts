Feature: Trouglovi

  # Napomena: Generisanje definicija koraka (steps) preko IntelliJ-a nema ocekivano
  #           ponasanja u slucaju kada se u scenariju koristi Outline-Examples jer
  #           se placeholder (<>) detektuje kao regularni string pa ne dolazi do automatskog
  #           generisanja parametara i njihovog mapiranja u anotacijama.
  #
  # Opcija 1: Nakon napisanog scenarija ciji koraci nisu generisani, moze se doci do skeleton
  #           koda definicija koraka (step definition-a) tako sto se taj scenario pokrene.
  #           U ispisu ce biti ponudjena sugestija za implementaciju
  #
  # Opcija 2: Mozemo da dodjemo do skeletona i tako sto bismo koristili:
  #           Alt+Enter > Create all step definitions
  #           Nakon toga cemo dobiti definicije koraka bez mapiranih vrednosti i parametara pa je
  #           potrebno da ih zamenimo (<stranicaA> u {string}) i dodamo odgovarajuce parametre
  #
  # Opcija 3: Rucno kreiranje definicija koraka


  # Klase ekvivalencije koje se odnose na ulazne podatke
  #   u1 - A je celobrojna vrednost iz trazenog opsega
  #   u2 - A je vrednost koja je manja od 0
  #   u3 - A je vrednost koja je veca od 50

  #   u4 - B je celobrojna vrednost iz trazenog opsega
  #   u5 - B je vrednost koja je manja od 0
  #   u6 - B je vrednost koja je veca od 50

  #   u7 - C je celobrojna vrednost iz trazenog opsega
  #   u8 - C je vrednost koja je manja od 0
  #   u9 - C je vrednost koja je veca od 50

  #   u10 - u A je unet realan broj
  #   u11 - u A je unet alfabetski karakter

  #   u12 - u B je unet realan broj
  #   u13 - u B je unet alfabetski karakter

  #   u14 - u B je unet realan broj
  #   u15 - u B je unet alfabetski karakter

  # Klase ekvivalencije koje se odnose na izlazne podatke
  #   i1 - raznostragi trougao + obim
  #   i2 - jednakokraki trougao + obim
  #   i3 - jednakostranicni trougao + obim
  #   i4 - nije trougao (ne vazi nejednakost trouglova)

  #   i5 - vrednost za A nije u dozvoljenom opsegu
  #   i6 - vrednost za B nije u dozvoljenom opsegu
  #   i7 - vrednost za C nije u dozvoljenom opsegu

  #   i8 - nedozvoljeni unos (sadrzi realan broj ili alfabetski karakter)


  # Test slucaji sa prezentacije:
  #   TP1 (u1, u4, u7, i1); prvi red u examples
  Scenario Outline: raznostrani trougao
    Given Korisnik je na stranici za unos trougla
    When Korisnik unese stranice trougla: <stranicaA>, <stranicaB>, <stranicaC>
    And Korisnik potvrdi unos
    Then Trebalo bi da vidi kategoriju trougla <kategorija>
    And Trebalo bi da vidi obim trougla <obim>
    Examples:
      |stranicaA|stranicaB|stranicaC| kategorija | obim |
      |"3"     |"4"     |"5"     | "Raznostrani" | 12 |
#      |"4"     |"6"     |"9"    | "Raznostrani" | 19 |

  # Test slucaji sa prezentacije:
  #   TP2 (u1, u4, u7, i2); prvi red u examples
  Scenario Outline: jednakokraki trougao
    Given Korisnik je na stranici za unos trougla
    When Korisnik unese stranice trougla: <stranicaA>, <stranicaB>, <stranicaC>
    And Korisnik potvrdi unos
    Then Trebalo bi da vidi kategoriju trougla <kategorija>
    And Trebalo bi da vidi obim trougla <obim>
    Examples:
      |stranicaA|stranicaB|stranicaC| kategorija | obim |
      |"2"     |"2"     |"3"     | "Jednakokraki" | 7  |
#      |"1"     |"2"     |"2"     | "Jednakokraki" | 5  |
#      |"4"     |"5"     |"5"     | "Jednakokraki" | 14 |
#      |"2"     |"8"     |"8"     | "Jednakokraki" | 18 |

  # Test slucaji sa prezentacije:
  #   TP3 (u1, u4, u7, i3); prvi red u examples
  Scenario Outline: jednakostranicni trougao
    Given Korisnik je na stranici za unos trougla
    When Korisnik unese stranice trougla: <stranicaA>, <stranicaB>, <stranicaC>
    And Korisnik potvrdi unos
    Then Trebalo bi da vidi kategoriju trougla <kategorija>
    And Trebalo bi da vidi obim trougla <obim>
    Examples:
    |stranicaA|stranicaB|stranicaC| kategorija | obim |
    |"5"     |"5"      |"5"      | "Jednakostranicni" | 15 |
#    |"10"    |"10"     |"10"     | "Jednakostranicni" | 30 |


  # Test slucaji sa prezentacije:
  #   TP4 (u1, u4, u7, i4); prvi red u examples
  Scenario Outline: Uneti podaci ne ispunjavaju uslov nejednakosti trougla
    Given Korisnik je na stranici za unos trougla
    When Korisnik unese stranice trougla: <stranicaA>, <stranicaB>, <stranicaC>
    And Korisnik potvrdi unos
    Then Trebalo bi da vidi kategoriju trougla <kategorija>
    Examples:
      |stranicaA|stranicaB|stranicaC| kategorija |
      |"4"     |"1"     |"2"     | "Nije trougao" |
#      |"1"     |"5"     |"1"     | "Nije trougao" |

  # Test slucaji sa prezentacije:
  #   TP5 (u2, i5); prvi red u examples
  #   TP6 (u3, i5); drugi red u examples
  #   TP7 (u5, i6); treci red u examples
  #   TP8 (u6, i6); cetvrti red u examples
  #   TP9 (u8, i7); peti red u examples
  #   TP10 (u9, i7); sesti red u examples
  Scenario Outline: Vrednost polja nije u opsegu
    Given Korisnik je na stranici za unos trougla
    When Korisnik unese stranice trougla: <stranicaA>, <stranicaB>, <stranicaC>
    And Korisnik potvrdi unos
    Then Ispis poruke o gresci <greska>
    Examples:
      |stranicaA|stranicaB|stranicaC| greska |
      |"-1"     |"5"     |"5"     | "Greska! A nije u opsegu." |
      |"51"     |"5"     |"5"     | "Greska! A nije u opsegu." |
      |"5"      |"-3"    |"5"     | "Greska! B nije u opsegu." |
      |"5"      |"55"    |"5"     | "Greska! B nije u opsegu." |
      |"5"      |"5"     |"-5"    | "Greska! C nije u opsegu." |
      |"5"      |"5"     |"100"   | "Greska! C nije u opsegu." |


  # Test slucaji sa prezentacije:
    #   TP11 (u10, i7); prvi red u examples
    #   TP12 (u12, i8); drugi red u examples
    #   TP13 (u14, i8); treci red u examples
    #   TP14 (u11, i8); cetvrti red u examples
    #   TP15 (u13, i8); peti red u examples
    #   TP16 (u15, i8); sesti red u examples
    Scenario Outline: Vrednost polja nije ceo broj
      Given Korisnik je na stranici za unos trougla
      When Korisnik unese stranice trougla: <stranicaA>, <stranicaB>, <stranicaC>
      And Korisnik potvrdi unos
      Then Ispis poruke o gresci <greska>
      Examples:
        |stranicaA|stranicaB|stranicaC| greska |
        |"3.5"    |"4"     |"5"     | "Greska! Nedozvoljeni ulaz" |
        |"4"      |"4.2"   |"5"     | "Greska! Nedozvoljeni ulaz" |
        |"3"      |"4"     |"5.1"   | "Greska! Nedozvoljeni ulaz" |
        |"e"      |"3"     |"4"     | "Greska! Nedozvoljeni ulaz" |
        |"3"      |"j"     |"5"     | "Greska! Nedozvoljeni ulaz" |
        |"3"      |"4"     |"a"     | "Greska! Nedozvoljeni ulaz" |
