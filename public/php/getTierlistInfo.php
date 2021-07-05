<?php

ini_set('display_errors', 1);

$tool_id = $_GET['tool_id'];

$connection = mysqli_connect('localhost', 'root', '', 'lbdb');

$sql = "SELECT * from TIERLIST WHERE tool_id = '" . $tool_id . "';";

$result = mysqli_query($connection, $sql);

$tierlist = array();

$sp = new stdClass();
$sp->name = "S+";
$sp_champions = array();

$s = new stdClass();
$s->name = "S";
$s_champions = array();

$a = new stdClass();
$a->name = "A";
$a_champions = array();

$b = new stdClass();
$b->name = "B";
$b_champions = array();

$c = new stdClass();
$c->name = "C";
$c_champions = array();

$d = new stdClass();
$d->name = "D";
$d_champions = array();

$e = new stdClass();
$e->name = "E";
$e_champions = array();

$f = new stdClass();
$f->name = "F";
$f_champions = array();

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $id=$row['champion'];
        $sql = "SELECT * from CHAMPION WHERE id = '$id';";
        $result_2 = mysqli_query($connection, $sql);
        while ($row_2 = mysqli_fetch_assoc($result_2)) {  
            $champion = new stdClass();
            $champion->src = $row_2['src'];
            $champion->id = $row_2['id'];
            $champion->name = $row_2['name'];
            $champion->image_name = $row_2['image_name'];
        break;
        }
        if($row['rank'] == "S+"){
            $sp_champions[] = $champion;
        } else if($row['rank'] == "S"){
            $s_champions[] = $champion;
        } else if($row['rank'] == "A"){
            $a_champions[] = $champion;
        } else if($row['rank'] == "B"){
            $b_champions[] = $champion;
        } else if($row['rank'] == "C"){
            $c_champions[] = $champion;
        } else if($row['rank'] == "D"){
            $d_champions[] = $champion;
        } else if($row['rank'] == "F"){
            $f_champions[] = $champion;
        }
    }
}

$sp->champions = $sp_champions;
$s->champions = $s_champions;
$a->champions = $a_champions;
$b->champions = $b_champions;
$c->champions = $c_champions;
$d->champions = $d_champions;
$e->champions = $e_champions;
$f->champions = $f_champions;

$tierlist[] = $sp;
$tierlist[] = $s;
$tierlist[] = $a;
$tierlist[] = $b;
$tierlist[] = $c;
$tierlist[] = $d;
$tierlist[] = $e;
$tierlist[] = $f;

print_r(json_encode($tierlist, TRUE));
$connection->close();