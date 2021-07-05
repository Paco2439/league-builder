<?php

ini_set('display_errors', 1);

$email = $_GET['email'];
$password = $_GET['password'];

$connection = mysqli_connect('localhost', 'root', '', 'lbdb');

$password = mysqli_real_escape_string($connection, $password);
$email = mysqli_real_escape_string($connection, $email);

$sql = "SELECT USER.email FROM USER WHERE USER.email = '" . $email . "' AND USER.password = '" . $password . "';";
$result = mysqli_query($connection, $sql);

if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
        echo $row['email'];
    }
} else {
    echo "none";
}

$connection->close();