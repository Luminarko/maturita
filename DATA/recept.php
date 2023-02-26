<?php

class Recept{
    
    private $recept_data;
    private $data;
    private $query;

    public function __construct($db_connect)
    {
        $this->query = "SELECT recept.id AS ID, recept.nazev AS NÁZEV, recept.postup AS POSTUP, recept.casova_narocnost AS ČAS, kategorie.nazev AS KATEGORIE, recept.obrazek AS OBRAZEK FROM recept INNER JOIN kategorie ON recept.kategorie_id = kategorie.id";
        $this->recept_data = mysqli_query($db_connect, $this->query);
    }
    public function get_data(){
        foreach($this->recept_data as $this->data){
            $id = $this->data["ID"];
            $nazev = $this->data["NÁZEV"];
            $postup = $this->data["POSTUP"];
            $cas = $this->data["ČAS"];
            $kategorie = $this->data["KATEGORIE"];
            $obrazek = $this->data["OBRAZEK"];
            $recept[] = $id."/".$nazev."/".$postup."/".$cas."/".$kategorie."/".$obrazek;
        }
        return $recept;
    }
}