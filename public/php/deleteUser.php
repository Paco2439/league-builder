<?php

ini_set('display_errors', 1);

$party_id = $_GET['party_id'];
$user_id = $_GET['user_email'];

$conn = mysqli_connect('localhost', 'root', '', 'lbdb');

$sql = "DELETE FROM USER_IN_PARTY WHERE party_id='$party_id' AND user_email='$user_id'";
$conn->query($sql);

$conn->close();