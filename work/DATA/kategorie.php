<?php

class Kategorie{

    private $kategorie; // Vlastnost pro uchování dat o kategorii
    private $arr; // Vlastnost pro uchování pole kategorií
    private $query; // Vlastnost pro uchování dotazu na kategorie

    public function __construct($db_connect){
        $this->query = "SELECT id, nazev FROM kategorie"; // Nastavení SQL dotazu
        return $this->query = mysqli_query($db_connect, $this->query); // Vykonání dotazu a vrácení výsledku
    }

    public function get_data(){
        foreach($this->query as $this->kategorie){ // Procházení výsledků dotazu
            $id = $this->kategorie["id"]; // Získání ID kategorie
            $nazev = $this->kategorie["nazev"]; // Získání názvu kategorie
            $arr[] = $id."/".$nazev; // Vytvoření řetězce ID/název kategorie a přidání ho do pole kategorií
        }
        return $arr; // Vrácení pole kategorií
    }
}