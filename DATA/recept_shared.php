<?php

class Recept_suroviny{

    private $data;
    private $recept_data;
    private $jednotky;
    private $mnozstvi;
    private $suroviny;
    private $recept_has;

    public function __construct($db_connect, $recept_id)
    {
        $this->data = mysqli_query($db_connect,"SELECT jednotky.nazev AS jednotky, suroviny.nazev AS suroviny, recept_has_suroviny.mnozstvi FROM recept_has_suroviny INNER JOIN jednotky ON recept_has_suroviny.jednotky_id = jednotky.id INNER JOIN suroviny ON recept_has_suroviny.suroviny_id = suroviny.id WHERE recept_has_suroviny.recept_id = $recept_id");
    }
    public function get_data(){
        foreach($this->data as $this->recept_data){
            $this->jednotky = $this->recept_data["jednotky"];
            $this->mnozstvi = $this->recept_data["mnozstvi"];
            $this->suroviny = $this->recept_data["suroviny"];
            $this->recept_has[] = $this->mnozstvi." ".$this->jednotky." ".$this->suroviny;
        }
        return $this->recept_has;
    }
}