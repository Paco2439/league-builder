<?php

$email = $_GET['email'];
$password = $_GET['password'];
$leaguename = $_GET['lname'];
$region = $_GET['region'];

$conn = mysqli_connect('localhost', 'root', '', 'lbdb');

$exists = false;

$sql = "SELECT * FROM USER WHERE EMAIL = '" . $email . "';";

$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
    $exists = true;
} 

if($exists){
    echo "201";
} else {

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://".$region.".api.riotgames.com/lol/summoner/v4/summoners/by-name/".rawurlencode($leaguename)."?api_key=RGAPI-0c694ee3-e244-4b10-9604-d46167ee3f85",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
      ));
      
      $response = curl_exec($curl);
      
      curl_close($curl);
      $icon_id = json_decode($response, TRUE)['profileIconId'];
      if(isset($icon_id)){
            if($icon_id == 21){
                $sql = "INSERT INTO `user`(`email`, `password`, `league_name`, `region`, `auth`) VALUES ('$email','$password','$leaguename','$region','0')";
                if ($conn->query($sql) === TRUE) {
                    echo "200";
                } else {
                    echo $conn->error;
                }
            } else {
                echo "202";
            }

      } else {
          echo "205";
      }
}

$conn->close();
