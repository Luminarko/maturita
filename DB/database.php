<?php

class Database{
    
    private $hostname;
    private $database;
    private $username;
    private $password;
    private $port;
    private $conn;

    public function __construct()
    {
        $this->hostname = "127.0.0.1";
        $this->database = "chytra_kucharka";
        $this->username = "root";
        $this->password = "";
        $this->port = "3306";
    }
    public function connect(){
        $this->conn = mysqli_connect($this->hostname, $this->username, $this->password, $this->database, $this->port);
        if($this->conn == false){
            echo "Failed to connect: ".mysqli_connect_error();
            exit();
        }
        mysqli_query($this->conn, "SET CHARACTER SET UTF8");
        return $this->conn;
    }
}