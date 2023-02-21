<?php

class Kategorie{

    private $kategorie;
    private $arr;
    private $query;

    public function __construct($db_connect){
        $this->query = "SELECT id, nazev FROM kategorie";
        return $this->query = mysqli_query($db_connect, $this->query);
    }
    public function get_data(){
        foreach($this->query as $this->kategorie){
            $id = $this->kategorie["id"];
            $nazev = $this->kategorie["nazev"];
            $arr[] = $id."/".$nazev;
        }
        return $arr;
    }
}