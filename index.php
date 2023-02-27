<?php 
    require_once("DATA/recept.php");
    require_once("DATA/recept_shared.php");
    require_once("DB/database.php");
    require_once("DATA/kategorie.php");
    require_once("DATA/suroviny.php");

    $page = $_GET["page"] ?? "home";
    $conn = (new Database)->connect();
    $recept = (new Recept($conn))->get_data();
    $kategorie = (new Kategorie($conn))->get_data();
    $suroviny = (new Surovina($conn))->get_data();
    foreach($kategorie as $kat_row){
        $kat_rows[] = explode("/", $kat_row);
    }
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
    <link rel="stylesheet" href="STYLE/style.scss">
    <title>Chytrá kuchařka</title>
</head>
<body>
    <?php
    echo "<header><div class='filtr_button' id='toggle' class='filtr' onclick='toggle_filtr()'>Filtr</div><img src='PICS/logo.png' class='logo' onclick=\"location.href='?page=home'\"></header>";
    echo "<div id='checkboxes' class='checkboxes'><form class='form' id='form' method='POST' action=?page=filtr>";
    $i = 0;
        foreach($suroviny as $surovina){
            $i++;
            echo "<label for='$surovina'>$surovina</label><input id='$surovina' type='checkbox' name='$i' value='$surovina'></input>";
        }
        echo "<button class='submit' type='submit' onclick='clear()' value='Filtr'>Filtrovat</button>";
        echo "</form></div>";
    echo "<div class='kat_menu'>";
            foreach($kat_rows as $row){
                echo "<div class='kat_button' onclick=\"location.href ='?page=$row[0]'\">$row[1]</div>";
            }
        echo "</div>";
    if($page == "home"){
        echo "<div class='body'>";
        echo "<div class='recept_list'>";
            foreach($recept_rows as $recept){
                echo "<div class='recept_button' onclick=\"location.href ='?page=$recept[1]'\"><img src='PICS/$recept[5]' class='recept_pic'>$recept[1]</div>";
            }
    }
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
            echo "<h1>Žádné výsledky hledání...</h1><br><p>Vraťte se zpět na hlavní stránku</p>";
        }
    }
    if(is_numeric($page)){
        echo "<div class='recept_list'>";
        $query = mysqli_query($conn, "SELECT DISTINCT nazev, obrazek FROM recept WHERE kategorie_id = $page");
        foreach($query as $recept_data){
            echo "<div class='recept_button' onclick=\"location.href ='?page=$recept_data[nazev]'\"><img src='PICS/$recept_data[obrazek]' class='recept_pic'>$recept_data[nazev]</div>";
        }
    }
    if($page == in_array($page,$nazev_recept)){
        $data = (new Recept_suroviny($conn, $page))->get_data();
        $query = mysqli_query($conn, "SELECT postup, casova_narocnost FROM recept WHERE nazev = '$page'");
        echo "<div class='recept_info'><h1>$page</h1>";
        echo "<div class='data'><ul>";
        foreach($data as $dats){
            echo "<li>".$dats."</li>";
        }
        echo "</ul>";
        foreach($query as $data){
            echo "<p>Postup: ".$data["postup"]."</p><br>";
            echo "<p>Časová náročnost: ".$data["casova_narocnost"]." minut</p>";
        }
        echo "</div></div>";
    }
    echo "</div>";
    //hnědá, žlutá, oranžová
    ?>
</body>
<script src="JS/script.js"></script>
</html>