<?php
$host = "172.17.0.2";
$user = "testapp";
$password = "testpass";
$dbname = "loginapp";

$conn = new MYSQLi($host, $user, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
