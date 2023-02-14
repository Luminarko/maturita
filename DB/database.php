<?php
class Database{
    private $hostname;
    private $database;
    private $username;
    private $password;

    public function __construct()
    {
        $this->hostname = "127.0.0.1";
        $this->database = "chytra_kucharka";
        $this->username = "root";
        $this->password = "";
    }
    public function connect(){
        return mysqli_connect($this->hostname, $this->username, $this->password, $this->database);
    }
}