<?php

$party_id  = $_GET['party_id'];
$conn = mysqli_connect('localhost', 'root', '', 'lbdb');
$sql = "DELETE FROM PARTY WHERE id = '".$party_id."';";
$conn->query($sql);
$sql = "DELETE FROM USER_IN_PARTY WHERE party_id = '".$party_id."';";
$conn->query($sql);

$conn->close();