<?php

$id = $_GET['email'];

$rooms = array();

$connection = mysqli_connect('localhost', 'root', '', 'lbdb');

$sql = "SELECT * FROM USER_IN_PARTY WHERE user_email = '" . $id . "';";
$result = mysqli_query($connection, $sql);


while ($row = mysqli_fetch_assoc($result)) {
    $room_object = new stdClass();
    $room_object->id = $row['party_id'];
    $room_object->show = false;

    $party_id = $row['party_id'];

    $sql = "SELECT * FROM PARTY WHERE id='" . $party_id . "';";
    $result_1 = mysqli_query($connection, $sql);

    while ($row_1 = mysqli_fetch_assoc($result_1)) {
        $room_object->name = $row_1['name'];
        $room_object->owner = $row_1['owner_mail'];
        $room_object->invite = $row_1['invite_key'];
    }


    $tools = array();

    $sql = "SELECT * FROM TOOL WHERE TOOL.party_id = '" . $party_id . "';";
    $result_2 = mysqli_query($connection, $sql);


    while ($row_2 = mysqli_fetch_assoc($result_2)) {
        $tool_object = new stdClass();
        $tool_object->id = $row_2['id'];
        $tool_object->name = $row_2['name'];
        $tool_object->type = $row_2['type_id'];
        $tools[] = $tool_object;
    }

    $room_object->tools = $tools;
    $rooms[] = $room_object;
}

$connection->close();

print_r(json_encode($rooms, JSON_UNESCAPED_SLASHES));
