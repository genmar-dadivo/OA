<?php
    /* table users for POST request
    SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
    START TRANSACTION;
    SET time_zone = "+00:00";

    CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `ip_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    */
    

    require_once '../dbconfig.php';
    class API {
        function postUser() {
            // Create a POST API endpoint that accepts 3 parameters: name, email, ip_address.
           // echo $_POST['name'];
            if (isset($_POST['name'], $_POST['email'], $_POST['ip_address'])) {
                $name = $_POST['name'];
                $email = $_POST['email'] ? $_POST['email'] : null;
                $ip_address = $_POST['ip_address'] ? $_POST['ip_address'] : null;
                $con = new Con;
                $users = array();
                $sql = "INSERT INTO tbl_users (name, email, ip_address) VALUES ('$name', '$email', '$ip_address')";
                $stm = $con->prepare($sql);
                $stm->execute();
                $results = $stm->fetchAll(PDO::FETCH_ASSOC);
                if ($stm->rowCount() == 1) {
                    $output = array(
                        "message" => "Successfully Inserted!",
                    );
                }
                else {
                    $output = array(
                        "message" => "Error Occured.",
                    );
                }
            }
            else {
                $output = array(
                    "message" => "Empty field(s) detected.",
                );
            }
            return json_encode($output);
        }
    }

    $API = new API;
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    echo $API->postUser();

    
?>