package pmf.imi.geometrija;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import static org.junit.jupiter.api.Assertions.*;

public class TrougaoSteps {
    public Trougao stranicaZaUnosTrougla;
    String oblikTrougla;
    String ispis;

    @Given("Korisnik je na stranici za unos trougla")
    public void korisnikJeNaStraniciZaUnosTrougla() {
        stranicaZaUnosTrougla = new Trougao();
    }

    @When("Korisnik unese stranice trougla: {string}, {string}, {string}")
    public void korisnikUneseStraniceTrouglaStranicaAStranicaBStranicaC(String stranicaA, String stranicaB, String stranicaC) {
        stranicaZaUnosTrougla.setTesktualnoPoljeA(stranicaA);
        stranicaZaUnosTrougla.setTesktualnoPoljeB(stranicaB);
        stranicaZaUnosTrougla.setTesktualnoPoljeC(stranicaC);

    }
    @And("Korisnik potvrdi unos")
    public void korisnikPotvrdiUnos() {
        stranicaZaUnosTrougla.potvrdiUnos();
        oblikTrougla = stranicaZaUnosTrougla.proveriTrougao();
        ispis = stranicaZaUnosTrougla.tekstIspisa();
        System.out.println(ispis);
    }

    @Then("Trebalo bi da vidi kategoriju trougla {string}")
    public void trebaloBiDaVidiKategorijuTrouglaKategorija(String kategorija) {
        assertEquals(kategorija, oblikTrougla);
    }

    @And("Trebalo bi da vidi obim trougla {int}")
    public void trebaloBiDaVidiObimTrouglaObim(int obim){
        String ocekivanFormatirano = "Obim trougla je: " + obim;
        assertEquals(ocekivanFormatirano, ispis);
    }



    @Then("Ispis poruke o gresci {string}")
    public void ispisPorukeOGresciGreska(String greska) {
        assertNotNull(ispis);

        //  assertTrue(greska.equalsIgnoreCase(ispis));

        // ova varijanta moze tacno da nam pokaze koji stringovi su u pitanju, ukoliko su razliciti,
        // za razliku od prethodne koja nam daje samo true ili false
        // assertEquals(greska.toLowerCase(), ispis.toLowerCase());

        assertEquals(greska, ispis);
    }
}
