<?php
class Con extends PDO {
    public function __construct() {
        parent::__construct("mysql:host=localhost;dbname=test", "root", "12302112");
    }
}
?>