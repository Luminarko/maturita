<?php

class Kategorie{
    
    private $kategorie_id;
    private $kategorie;
    private $data;
    private $id;
    private $nazev;


    public function __construct($db_connect)
    {
        $this->kategorie_id = mysqli_query($db_connect, "SELECT * FROM kategorie");
    }
    public function get(){
        foreach($this->kategorie_id as $this->data){
            $this->id[] = $this->data["id"];
            $this->nazev[] = $this->data["nazev"];
        };
        return $this->kategorie[] = array_combine($this->id, $this->nazev);
    }
}