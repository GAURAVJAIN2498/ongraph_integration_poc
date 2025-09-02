<?php
$host = "172.31.21.118";
$user = "testapp";
$password = "testpass";
$dbname = "loginapp";

$conn = new MYSQLi($host, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
