<?php

$tool_type = $_GET['tool_type'];
$tool_name = $_GET['tool_name'];
$party_id = $_GET['party_id'];

$conn = mysqli_connect('localhost', 'root', '', 'lbdb');
$sql = "INSERT INTO `TOOL`(`name`, `party_id`, `type_id`) VALUES ('".$tool_name."', '".$party_id."', '".$tool_type."')";
$conn->query($sql);

if($tool_type == "3"){

    $sql = "INSERT INTO `comp`(`role`, `champion`) VALUES ('0','0')";
    $conn->query($sql);

    $sql = "SELECT * FROM COMP ORDER BY id DESC";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $comp_id=$row['id'];
    }

    $sql = "SELECT * FROM TOOL WHERE name ='$tool_name' AND type_id='$tool_type' AND party_id='$party_id' ORDER BY id DESC";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $id=$row['id'];
    }
    $sql = "INSERT INTO CONCEPT_ROOM VALUES('', '$id','$comp_id')";
    $conn->query($sql);
}

echo "200";
$conn->close();