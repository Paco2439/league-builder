<?php

function generateRandomString($length = 10)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

$party_name = $_GET['party_name'];
$owner = $_GET['owner'];
$conn = mysqli_connect('localhost', 'root', '', 'lbdb');

$rand = generateRandomString();

$sql = "INSERT INTO `PARTY`(`invite_key`, `name`, `owner_mail`) VALUES ('" . $rand . "', '" . $party_name . "','" . $owner . "')";
$conn->query($sql);

$id = 0;
$sql = "SELECT * FROM PARTY WHERE name='".$party_name."' AND invite_key='".$rand."'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
        $id = $row['id'];
    }
}

$sql = "INSERT INTO `USER_IN_PARTY`(`party_id`, `user_email`) VALUES ('".$id."', '".$owner."')";
$conn->query($sql);

echo "200";
$conn->close();