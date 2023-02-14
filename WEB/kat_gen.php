<?php

function kat_gen(){
    $db = (new Database())->connect();
    $kategorie = (new Kategorie($db))->get();
    $count = count($kategorie);
    echo "<nav>";
    for($i = 1; $i <= $count; $i++){
        echo("<a>$kategorie[$i]</a>");
    }
    echo "</nav>";
}