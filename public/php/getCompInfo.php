<?php

ini_set('display_errors', 1);

$tool_id = $_GET['tool_id'];

$connection = mysqli_connect('localhost', 'root', '', 'lbdb');

$sql = "SELECT * FROM CONCEPT_ROOM WHERE tool_id='$tool_id'";
$result = mysqli_query($connection, $sql);

$concept_room = new stdClass();

$top = new stdClass();
$top->name="TOP";
$top_champions= array();

$jgl = new stdClass();
$jgl->name="JGL";
$jgl_champions= array();

$mid = new stdClass();
$mid->name="MID";
$mid_champions= array();

$adc = new stdClass();
$adc->name="ADC";
$adc_champions= array();

$sup = new stdClass();
$sup->name="SUP";
$sup_champions= array();


while ($row = mysqli_fetch_assoc($result)) {
        $note = $row['note'];
        $comp_id= $row['comp_id'];

        $sql = "SELECT * FROM COMP WHERE id='$comp_id'";
        $result_2 = mysqli_query($connection, $sql);
        while ($row_2 = mysqli_fetch_assoc($result_2)) {
            
            $role = $row_2['role'];
        $champ_id = $row_2['champion'];

        $sql = "SELECT * FROM `champion` WHERE id='$champ_id'";
        $result_3 = mysqli_query($connection, $sql);
        while ($row_3 = mysqli_fetch_assoc($result_3)) {
            $champion = new stdClass();
            $champion->src = $row_3['src'];
            $champion->id = $row_3['id'];
            $champion->name = $row_3['name'];
            $champion->image_name = $row_3['image_name'];

            if($role == 0){
                $top_champions[] = $champion;
            } else if($role == 1){
                $jgl_champions[] = $champion;
            } else if($role == 2){
                $mid_champions[] = $champion;
            } else if($role == 3){
                $sup_champions[] = $champion;
            } else if($role == 4){
                $adc_champions[] = $champion;
            } 
        }
    
        }
}

$concept_room->note = $note;

$top->champions = $top_champions;
$jgl->champions = $jgl_champions;
$mid->champions = $mid_champions;
$adc->champions = $adc_champions;
$sup->champions = $sup_champions;

$data = array();
$data[] = $top;
$data[] = $jgl;
$data[] = $mid;
$data[] = $adc;
$data[] = $sup;

$concept_room->data = $data;

$connection->close();

print_r(json_encode($concept_room, JSON_UNESCAPED_SLASHES));