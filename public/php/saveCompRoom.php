<?php

ini_set('display_errors', 1);

$tool_id = $_GET['tool_id'];
$new_list = json_decode($_GET['new_list'], TRUE);
$note = $_GET['note'];

$connection = mysqli_connect('localhost', 'root', '', 'lbdb');

$sql = "SELECT * FROM CONCEPT_ROOM WHERE tool_id ='$tool_id'";
$result = mysqli_query($connection, $sql);
while ($row = mysqli_fetch_assoc($result)) {
    $comp_id=$row['comp_id'];
}

$sql = "UPDATE CONCEPT_ROOM SET note = '$note' WHERE tool_id='$tool_id' AND comp_id='$comp_id'";
$connection->query($sql);

$sql = "DELETE FROM COMP WHERE id='$comp_id'";
$connection->query($sql);

foreach($new_list as $ob){
    foreach($ob['champions'] as $champ){
        $id=$champ['id'];
        $role = "";
        if($ob['name']=="TOP"){
            $role=0;
        } else if($ob['name']=="JGL"){
            $role=1;
        } else if($ob['name']=="MID"){
            $role=2;
        } else if($ob['name']=="ADC"){
            $role=3;
        } else if($ob['name']=="SUP"){
            $role=4;
        }
        $sql = "INSERT INTO COMP VALUES ('$comp_id','$role','$id')";
        $connection->query($sql);
    }
}

$connection->close();

