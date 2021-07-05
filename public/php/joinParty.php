<?php

$key = $_GET['key'];
$email = $_GET['email'];
$conn = mysqli_connect('localhost', 'root', '', 'lbdb');

$sql = "SELECT * FROM PARTY WHERE invite_key = '$key'";

$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
        $id = $row['id'];
        $sql = "INSERT INTO USER_IN_PARTY VALUES('$id','$email')";
        if($conn->query($sql)==TRUE){
            echo "200";
        } else {
            echo "201";
        }
    break;
    }
} else {
    echo "404";
}
$conn->close();
