<?php
    require_once '../dbconfig.php';
    class API {
        function getuser () {
            if (isset($_GET['id'])) {
                $id = $_GET['id'];
                $con = new Con;
                $users = array();
                $sql = "SELECT * FROM tbl_users WHERE id = '$id'";
                $stm = $con->prepare($sql);
                $stm->execute();
                $results = $stm->fetchAll(PDO::FETCH_ASSOC);
                if ($stm->rowCount() >= 1) {
                    foreach ($results as $row) {
                        // name, email, country and city fields
                        $name = $row['name'];
                        $email = $row['email'];
                        $country = $row['country'];
                        $city = $row['city'];
                        $output = array(
                            "name" => $name,
                            "email" => $email,
                            "country" => $country,
                            "city" => $city,
                        );
                    }
                }
                else {
                    $output = array(
                        "message" => "No user found.",
                    );
                }
            }
            else {
                $output = array(
                    "message" => "No user found.",
                );
            }
            return json_encode($output);
        }
    }

    $API = new API;
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    echo $API->getuser();
?>