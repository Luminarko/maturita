<?php

class Recept{
    
    private $recept_data; // Proměnná pro uložení dat o receptech
    private $data;
    private $query; // Proměnná pro SQL dotaz

    public function __construct($db_connect)
    {
        // Nastavení SQL dotazu pro získání dat o receptech a připojení tabulky kategorie
        $this->query = "SELECT recept.id AS ID, recept.nazev AS NÁZEV, recept.postup AS POSTUP, recept.casova_narocnost AS ČAS, kategorie.nazev AS KATEGORIE, recept.obrazek AS OBRAZEK FROM recept INNER JOIN kategorie ON recept.kategorie_id = kategorie.id";
        // Provedení dotazu a uložení výsledků do proměnné recept_data
        $this->recept_data = mysqli_query($db_connect, $this->query);
    }
    public function get_data(){
        foreach($this->recept_data as $this->data){
            // Uložení jednotlivých položek receptu do proměnných
            $id = $this->data["ID"];
            $nazev = $this->data["NÁZEV"];
            $postup = $this->data["POSTUP"];
            $cas = $this->data["ČAS"];
            $kategorie = $this->data["KATEGORIE"];
            $obrazek = $this->data["OBRAZEK"];
            // Uložení informací o receptu do pole recept
            $recept[] = $id."/".$nazev."/".$postup."/".$cas."/".$kategorie."/".$obrazek;
        }
        // Vrácení pole s informacemi o receptech
        return $recept;
    }
}