<?php

class Jednotka{
    
    private $jednotka_id;
    private $jednotka;
    private $data;
    private $id;
    private $nazev;


    public function __construct($db_connect)
    {
        $this->jednotka_id = mysqli_query($db_connect, "SELECT * FROM jednotky");
    }
    public function get(){
        foreach($this->jednotka_id as $this->data){
            $this->id[] = $this->data["id"];
            $this->nazev[] = $this->data["nazev"];
        };
        return $this->jednotka[] = array_combine($this->id, $this->nazev);
    }
}