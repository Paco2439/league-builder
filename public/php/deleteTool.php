<?php

$tool_type = $_GET['tool_type'];
$tool_id = $_GET['tool_id'];
$conn = mysqli_connect('localhost', 'root', '', 'lbdb');

if ($tool_type == 0) {
    $sql = "DELETE FROM TIERLIST WHERE tool_id = '".$tool_id."';";

    $conn->query($sql);
} else {
    $sql = "SELECT * FROM CONCEPT_ROOM WHERE tool_id ='$tool_id'";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $comp_id=$row['comp_id'];
    }
    $sql = "DELETE FROM COMP WHERE id = '".$comp_id."';";
    $conn->query($sql);
    $sql = "DELETE FROM CONCEPT_ROOM WHERE tool_id = '".$tool_id."';";
    $conn->query($sql);
}

$sql = "DELETE FROM TOOL WHERE id = '".$tool_id."';";
$conn->query($sql);


$conn->close();