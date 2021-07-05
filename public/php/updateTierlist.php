<?php

ini_set('display_errors', 1);

$new_list = json_decode($_GET['new_list'], TRUE);
$tool_id = $_GET['tool_id'];

$sqls = "";

$conn = mysqli_connect('localhost', 'root', '', 'lbdb');

$sql = "DELETE FROM TIERLIST WHERE tool_id ='".$tool_id."'";
if ($conn->query($sql) === TRUE) {
    foreach($new_list as $ob){
            foreach($ob['champions'] as $champ){
                $rank_name = $ob['name'];
                if($rank_name == "S "){
                    $rank_name = "S+";
                }
                $sqls .= "('".$tool_id."', '".$rank_name."', '".$champ['id']."'),";
            }
    }
    $sql = "INSERT INTO TIERLIST VALUES".substr($sqls, 0, strlen($sqls)-1);
    $conn->query($sql);
} 
$conn->close();


