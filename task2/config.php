<?php
$servername = "172.17.0.2";
$username = "testapp";
$password = "testpass";
$dbname = "loginapp";

$conn = new MYSQLi($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
