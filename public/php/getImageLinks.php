<?php

ini_set('display_errors', 1);

$conn = mysqli_connect('localhost', 'root', '', 'lbdb');
$sql = "DELETE FROM CHAMPION";
    $conn->query($sql);
  $curl = curl_init();

  curl_setopt_array($curl, array(
    CURLOPT_URL => "http://ddragon.leagueoflegends.com/cdn/11.13.1/data/de_DE/champion.json",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
  ));
  
  $champions = json_decode(curl_exec($curl), true)['data'];

  curl_close($curl);

  foreach($champions as $champ){ 
    $name = mysqli_escape_string($conn, $champ['name']);
    $id = $champ['key'];
    $image_name = $champ['image']['full'];
    $image = "https://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/" . $image_name;
    $sql = "INSERT INTO CHAMPION VALUES('$id','$image','$name','$image_name')";
    $conn->query($sql);
  }
  $conn->close();


