<?php 

// Načtení tříd a souborů
    require_once("DATA/recept.php");
    require_once("DATA/recept_shared.php");
    require_once("DB/database.php");
    require_once("DATA/kategorie.php");
    require_once("DATA/suroviny.php");

// Získání parametru page z URL adresy nebo nastavení výchozí hodnoty "home"
    $page = $_GET["page"] ?? "home";

// Připojení k databázi
    $conn = (new Database)->connect();

// Získání dat receptů, kategorií a surovin
    $recept = (new Recept($conn))->get_data();
    $kategorie = (new Kategorie($conn))->get_data();
    $suroviny = (new Surovina($conn))->get_data();

// Rozdělení řetězců kategorie na ID a název
    foreach($kategorie as $kat_row){
        $kat_rows[] = explode("/", $kat_row);
    }

// Rozdělení řetězců receptů na ID, název, kategorii, počet porcí, přípravu a obrázek
    foreach($recept as $recept_row){
        $recept_rows[] = explode("/", $recept_row);
        foreach($recept_rows as $recept_nazev){
            $nazev_recept[] = $recept_nazev[1];
        }
    }
?>
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="STYLE/style.css">
    <title>Chytrá kuchařka</title>
</head>
<body>
    <?php
    //<div class="checkbox">
    //<input id="toggle" type="checkbox">
    //<label for="toggle"></label>

// Tlačítko pro zobrazení nebo skrytí filtru a logo s odkazem na úvodní stránku
    echo "<header><div class='filtr_button' id='toggle' class='filtr' onclick='toggle_filtr()' value='filtr'><div id='one' class='one'></div><div id='two' class='two'></div><div id='three' class='three'></div></div><img src='PICS/logo.png' class='logo' onclick=\"location.href='?page=home'\"></header>";

// Formulář pro výběr surovin pro filtraci receptů
    echo "<div id='checkboxes' class='checkboxes'><form class='form' id='form' method='POST' action=?page=filtr>";
    $i = 0;
        foreach($suroviny as $surovina){
            $i++;
            echo "<label for='$surovina'>$surovina</label><div class='checkbox'><input type='checkbox' id='$surovina' name='$surovina' value='$surovina'><label for='$surovina'></label></div>";
        }
        echo "<div class='submit' onclick='this.parentNode.submit()' value='Filtr'>Filtrovat</div>";
        echo "</form></div>";

// Výpis tlačítek pro jednotlivé kategorie receptů
    echo "<div class='kat_menu'>";
            foreach($kat_rows as $row){
                echo "<div class='kat_button' onclick=\"location.href ='?page=$row[0]'\">$row[1]</div>";
            }
        echo "</div>";

// Zobrazení seznamu receptů na hlavní stránce
    if($page == "home"){
        echo "<div class='body'>";
        echo "<div class='recept_list'>";
            foreach($recept_rows as $recept){
                echo "<div class='recept_button' onclick=\"location.href ='?page=$recept[1]'\"><img src='PICS/$recept[5]' class='recept_pic'>$recept[1]</div>";
            }
    }
// Filtr receptů podle surovin
    if($page == "filtr"){
        $i = 1;
        if(!empty($_POST)){
            $query = "SELECT DISTINCT recept.nazev AS NÁZEV, recept.obrazek AS OBRAZEK FROM recept INNER JOIN recept_has_suroviny ON recept.id = recept_has_suroviny.recept_id INNER JOIN suroviny ON suroviny.id = recept_has_suroviny.suroviny_id WHERE suroviny.nazev = ";    
            foreach($_POST as $value){
                if($i == 1){
                    $query .= "'$value'";
                }else{$query .= " OR suroviny.nazev = '$value'";}
                $i++;  
            }
            $data = mysqli_query($conn, $query);
            echo "<div class='recept_list'>";

            foreach($data as $rows){
                echo "<div class='recept_button' onclick=\"location.href ='?page=$rows[NÁZEV]'\"><img src='PICS/$rows[OBRAZEK]' class='recept_pic'>$rows[NÁZEV]</div>";
            };
            echo "</div>";
            }
            else{ 
            echo "<div class='no_list'>";
            echo "<h1>Žádné výsledky hledání...</h1><br><p>Vraťte se zpět na hlavní stránku</p>";
            echo "</div>";
        }
    }
// Zobrazení seznamu receptů v dané kategorii
    if(is_numeric($page)){
        echo "<div class='recept_list'>";
        $query = mysqli_query($conn, "SELECT DISTINCT nazev, obrazek FROM recept WHERE kategorie_id = $page");
        foreach($query as $recept_data){
            echo "<div class='recept_button' onclick=\"location.href ='?page=$recept_data[nazev]'\"><img src='PICS/$recept_data[obrazek]' class='recept_pic'>$recept_data[nazev]</div>";
        }
    }
// Zobrazení detailů receptu
    if($page == in_array($page,$nazev_recept)){
        $data = (new Recept_suroviny($conn, $page))->get_data();
        $query = mysqli_query($conn, "SELECT postup, casova_narocnost FROM recept WHERE nazev = '$page'");
        echo "<div class='back_button' onclick='history.back()'>Zpět</div>";
        echo "<div class='recept_info'><h1>$page</h1>";
        echo "<div class='data'><ul>";
        foreach($data as $dats){
            echo "<li>".$dats."</li>";
        }
        echo "</ul>";
        foreach($query as $data){
            echo "<p><b>Postup:</b> ".$data["postup"]."</p><br>";
            echo "<p><b>Časová náročnost:</b> ".$data["casova_narocnost"]." minut</p>";
        }
        echo "</div></div>";
    }
    echo "</div>";
    ?>
</body>
<script src="JS/script.js"></script>
</html>