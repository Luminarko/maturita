<?php

class Recept{
    
    private $recept_id;
    private $data;
    private $id;
    private $id_count;
    private $nazev;
    private $recept;
    private $postup;
    private $casova_narocnost;
    private $kategorie;
    private $num_arr;


    public function __construct($db_connect)
    {
        $this->recept_id = mysqli_query($db_connect, "SELECT * FROM recept");
    }
    public function get(){
        foreach($this->recept_id as $this->data){
            $this->id = $this->data["id"];
            $this->id_count[] = $this->data["id"];
            $this->num_arr = range(1, count($this->id_count));
            $this->nazev = $this->data["nazev"];
            $this->postup = $this->data["postup"];
            $this->casova_narocnost = $this->data["casova_narocnost"];
            $this->kategorie = $this->data["kategorie_id"];
            $this->recept[] = $this->id."/".$this->nazev."/".$this->postup."/".$this->casova_narocnost."/".$this->kategorie;
        };
        return array_combine($this->num_arr, $this->recept);
    }
}