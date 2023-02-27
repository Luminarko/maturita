<?php

class Recept_suroviny{

    private $data;  // Proměnná pro ukládání dat z databáze
    private $recept_data;   // Proměnná pro ukládání dat o receptu
    private $jednotky;  // Proměnná pro ukládání jednotek surovin
    private $mnozstvi;  // Proměnná pro ukládání množství surovin
    private $suroviny;  // Proměnná pro ukládání názvů surovin
    private $recept_has;    // Pole pro ukládání surovin a jejich množství v receptu

    public function __construct($db_connect, $name)
    {
        // SQL dotaz pro získání surovin a jejich množství pro daný recept
        $this->data = mysqli_query($db_connect,"SELECT jednotky.nazev AS jednotky, suroviny.nazev AS suroviny, recept_has_suroviny.mnozstvi FROM recept_has_suroviny INNER JOIN jednotky ON recept_has_suroviny.jednotky_id = jednotky.id INNER JOIN suroviny ON recept_has_suroviny.suroviny_id = suroviny.id INNER JOIN recept ON recept_has_suroviny.recept_id = recept.id WHERE recept.nazev = '$name'");
    }

    public function get_data(){
        // Cyklus pro procházení dat z databáze a ukládání informací do pole $recept_has
        foreach($this->data as $this->recept_data){
            $this->jednotky = $this->recept_data["jednotky"];
            $this->mnozstvi = $this->recept_data["mnozstvi"];
            $this->suroviny = $this->recept_data["suroviny"];
            $this->recept_has[] = $this->mnozstvi." ".$this->jednotky." ".$this->suroviny;
        }
        // Vrácení pole s informacemi o receptech
        return $this->recept_has;
    }
}