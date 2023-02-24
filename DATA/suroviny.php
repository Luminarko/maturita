<?php

class Surovina{

private $suroviny;
private $arr;
private $query;

public function __construct($db_connect){
    $this->query = "SELECT nazev FROM suroviny";
    return $this->query = mysqli_query($db_connect, $this->query);
}
public function get_data(){
    foreach($this->query as $this->suroviny){
        $nazev = $this->suroviny["nazev"];
        $arr[] = $nazev;
    }
    return $arr;
}
}