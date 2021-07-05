<?php

ini_set('display_errors', 1);

$new_list = json_decode($_GET['new_list'], TRUE);

$conn = mysqli_connect('localhost', 'root', '', 'lbdb');
$sql = "SELECT * FROM CHAMPION ORDER BY name ASC";
$result = mysqli_query($conn, $sql);

$champions = array();

while ($row = mysqli_fetch_assoc($result)) {
    $same = false;
    foreach($new_list as $champ){
        if($champ == $row['name']){
        $same=true;
        unset($new_list[array_search($champ ,$new_list)]);
        break;
        }
    }
    if(!$same){
        $champion = new stdClass(); 
        $champion->id = $row['id']; 
        $champion->src = $row['src']; 
        $champion->name = $row['name']; 
        $champion->image_name = $row['image_name']; 
        $champions[] = $champion;
    }
}

print_r(json_encode($champions, JSON_UNESCAPED_SLASHES));

$conn->close();


