<?php

class Database{
    
    private $hostname; // Adresa hostitele, na kterém běží databázový server
    private $database; // Název databáze
    private $username; // Uživatelské jméno pro přihlášení do databáze
    private $password; // Heslo pro přihlášení do databáze
    private $port; // Číslo portu, na kterém běží databázový server
    private $conn; // Objekt představující spojení s databází

    public function __construct()
    {
        $this->hostname = "127.0.0.1"; // Adresa localhost
        $this->database = "chytra_kucharka"; // Název databáze, s níž se chceme spojit
        $this->username = "root"; // Uživatelské jméno pro přihlášení do databáze
        $this->password = ""; // Heslo pro přihlášení do databáze
        $this->port = "3306"; // Číslo portu, na kterém běží databázový server (výchozí pro MySQL)
    }
    public function connect(){
        $this->conn = mysqli_connect($this->hostname, $this->username, $this->password, $this->database, $this->port); // Pokusíme se připojit k databázi
        if($this->conn == false){ // Pokud se nepodařilo připojit
            echo "Failed to connect: ".mysqli_connect_error(); // Vypišeme chybovou hlášku
            exit(); // Ukončíme běh skriptu
        }
        mysqli_query($this->conn, "SET CHARACTER SET UTF8"); // Nastavíme kódování pro spojení na UTF-8
        return $this->conn; // Vrátíme objekt představující spojení s databází 
    }
}