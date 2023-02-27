<?php

class Surovina{

    private $suroviny; // Proměnná pro uložení dat z SQL
    private $arr;
    private $query; // Proměnná pro SQL dotaz

    public function __construct($db_connect){
        // Nastavení dotazu pro získání názvů surovin z databáze
        $this->query = "SELECT nazev FROM suroviny";
        // Výsledek dotazu se uloží do vlastnosti objektu
        return $this->query = mysqli_query($db_connect, $this->query);
    }
    public function get_data(){
        // Projdeme všechny řádky výsledku dotazu
        foreach($this->query as $this->suroviny){
            // Pro každou surovinu získáme její název a uložíme ho do pole
            $nazev = $this->suroviny["nazev"];
            $arr[] = $nazev;
        }
        // Vrátíme pole s názvy surovin
        return $arr;
    }
}