<?php 
    require_once("DATA/recept.php");
    require_once("DATA/recept_shared.php");
    require_once("DB/database.php");
    require_once("DATA/kategorie.php");

    $page = $_GET["page"];
    $conn = (new Database)->connect();
    $data = (new Recept_suroviny($conn))->get_data();
    $recept = (new Recept($conn))->get_data();
    $kategorie = (new Kategorie($conn))->get_data();
    foreach($kategorie as $kat_row){
        $kat_rows[] = explode("/", $kat_row);
    }
    foreach($recept as $recept_row){
        $recept_rows[] = explode("/", $recept_row);
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
        echo "<div class='kat_menu'>";
            foreach($kat_rows as $row){
                echo "<div class='kat_button'><a href='?page=$row[0]'>$row[1]</div>";
            }
        echo "</div>";
        echo "<div class='recept_list'>";
            foreach($recept_rows as $recept){
                echo "<div class='recept_button'><a href='?page=$recept[1]'>$recept[1]</div>";
            }
    }
    if(is_numeric($page)){
        echo "<div class='recept_list'>";
        $query = mysqli_query($conn, "SELECT nazev FROM recept WHERE kategorie_id = $page");
        foreach($query as $recept){
            echo "<a href='?page=$recept[nazev]'>$recept[nazev]</a>";
        }
    }else "<a href='?page=home'>";
    if($page == in_array($page, array("Brokolicová polévka", "Květákové makarony"))){
        echo "kokot";
    }
    echo "</div>";
    ?>
</body>
</html>