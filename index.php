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
    <link rel="stylesheet" href="STYLE/style.css">
    <title>Chytrá kuchařka</title>
</head>
<body>
    <?php
    echo "<div class='body'>";
    if($page == "home"){
        echo "<div class='checkboxes'><form class='checkboxes' method='POST' action=?page=filtr>";
        $i = 0;
        foreach($suroviny as $surovina){
            $i++;
            echo "<input type='checkbox' name='$i' value='$surovina'>$surovina</input>";
        }
        echo "<input type='submit' value='Filtr'>";
        echo "</form></div>";
        echo "<div class='kat_menu'>";
            foreach($kat_rows as $row){
                echo "<div class='kat_button'><input type='button' onclick=location.href='?page=$row[0]' value=$row[1]></div>";
            }
        echo "</div>";
        echo "<div class='recept_list'>";
            foreach($recept_rows as $recept){
                echo "<div class='recept_button'><input type='button' onclick=location.href='?page=$recept[1]' value=$recept[1]></div>";
            }
    }
    if($page == "filtr"){
        $i = 1;
        $query = "SELECT recept.nazev FROM recept INNER JOIN recept_has_suroviny ON recept.id = recept_has_suroviny.recept_id INNER JOIN suroviny ON suroviny.id = recept_has_suroviny.suroviny_id WHERE suroviny.nazev = ";
        foreach($_POST as $value){
            if($i == 1){
                $query .= "'$value'";
            }else{$query .= " OR suroviny.nazev = '$value'";}
            $i++;     
        }
        echo "<div class='recept_list'>";
        $data = mysqli_query($conn, $query);
        echo "</div>";
        foreach($data as $row){
            foreach($row as $recept){
                $recepts[] = $recept;
                $_recepts = array_unique($recepts);
            };
        }
        foreach($_recepts as $data){
            echo "<input type='button' onclick=location.href='?page=$data' value=$data></br>";
        }
    }
    if(is_numeric($page)){
        echo "<div class='recept_list'>";
        $query = mysqli_query($conn, "SELECT nazev FROM recept WHERE kategorie_id = $page");
        foreach($query as $recept_data){
            echo "<input type='button' onclick=location.href='?page=$recept_data[nazev]' value='$recept_data[nazev]'>";
        }
    }
    if($page == in_array($page,$nazev_recept)){
        $data = (new Recept_suroviny($conn, $page))->get_data();
        $query = mysqli_query($conn, "SELECT postup, casova_narocnost FROM recept WHERE nazev = '$page'");
        echo "<h1>$page</h1>";
        echo "<ul>";
        foreach($data as $dats){
            echo "<li>".$dats."</li>";
        }
        echo "</ul>";
        foreach($query as $data){
            echo "<p>Postup: ".$data["postup"]."</p><br>";
            echo "<p>Časová náročnost: ".$data["casova_narocnost"]." minut</p>";
        }
    }
    echo "</div>";
    ?>
</body>
</html>