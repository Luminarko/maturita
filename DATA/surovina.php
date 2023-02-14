<?php

class Surovina{
    
    private $suroviny_id;
    private $surovina;
    private $data;
    private $id;
    private $nazev;


    public function __construct($db_connect)
    {
        $this->suroviny_id = mysqli_query($db_connect, "SELECT * FROM suroviny");
    }
    public function get(){
        foreach($this->suroviny_id as $this->data){
            $this->id[] = $this->data["id"];
            $this->nazev[] = $this->data["nazev"];
        };
        return $this->surovina[] = array_combine($this->id, $this->nazev);
    }
}