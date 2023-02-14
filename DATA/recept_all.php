<?php

    $db_connect = (new Database)->connect();
    $kategorie = (new Kategorie($db_connect))->get();
    $recept = (new Recept($db_connect))->get();
    $recept_has = (new Recept_suroviny($db_connect, $input))->get_data();
    $suroviny = "";

    $recept_data = explode("/", $recept[$input]); //id_recept
    $kategorie_req = $kategorie[$recept_data[4]];
    for($i = 0; $i < count($recept_has); $i++){
        $suroviny .= "<li>".$recept_has[$i]."</li>";
    }

//var_dump($recept_data);

    echo("<ul><li>"."\nNázev: ".$recept_data[1]."</li>"."\n<li>Postup: ".$recept_data[2]."</li>"."\n<li>Časová náročnost: ".$recept_data[3]." minut</li>"."\n<li>Kategorie: ".$kategorie_req."</li>".$suroviny);