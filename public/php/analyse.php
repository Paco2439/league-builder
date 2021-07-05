<?php
$curl = curl_init();
$id = $_GET['name'];
$start = $_GET['start'];
$end = $_GET['end'];
$region = "";
$games = array();
$conn = mysqli_connect('localhost', 'root', '', 'lbdb');
$name = "";
$sql = "SELECT region, league_name FROM USER WHERE email = '" . $id . "';";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $region = $row['region'];
        $name = $row['league_name'];
    }
}

curl_setopt_array($curl, array(
    CURLOPT_URL => "https://" . $region . ".api.riotgames.com/lol/summoner/v4/summoners/by-name/" . rawurlencode($name) . "?api_key=RGAPI-0c694ee3-e244-4b10-9604-d46167ee3f85",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
));

$response = curl_exec($curl);
$id = json_decode($response, TRUE)['accountId'];

curl_setopt_array($curl, array(
    CURLOPT_URL => "https://" . $region . ".api.riotgames.com/lol/match/v4/matchlists/by-account/" . $id . "?beginIndex=" . $start . "&endIndex=" . $end . "&api_key=RGAPI-0c694ee3-e244-4b10-9604-d46167ee3f85",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
));

$response = curl_exec($curl);
$games_json = json_decode($response, TRUE)['matches'];

foreach ($games_json as $game) {
    $info = new stdClass();
    $info->gameId = $game['gameId'];
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://" . $region . ".api.riotgames.com/lol/match/v4/matches/" . $game['gameId'] . "?api_key=RGAPI-0c694ee3-e244-4b10-9604-d46167ee3f85",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
    ));
    $response = curl_exec($curl);
    $players_info = json_decode($response, TRUE)['participantIdentities'];
    $own_info = json_decode($response, TRUE)['participants'];
    $part_id = 0;
    $duration = json_decode($response, TRUE)['gameDuration'];
    foreach ($players_info as $player) {
        if ($player['player']['summonerName'] == $name) {
            $part_id = $player['participantId'];
            break;
        }
    }

    foreach ($own_info as $player) {
        if ($player['participantId'] == $part_id) {
            $stats = $player['stats'];
            $timeline = $player['timeline'];

            $real_stats = new stdClass();
            $real_stats->gameLength = $duration;
            $real_stats->visionScore = $stats['visionScore'];
            $real_stats->goldPerMinute = $timeline['goldPerMinDeltas'];
            $real_stats->csPerMin = $timeline['creepsPerMinDeltas'];
   
            $champ_id = $player['championId'];
            $sql = "SELECT * FROM CHAMPION WHERE id='$champ_id'";
            $result = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_assoc($result)) {
                $champion = new stdClass();
                $champion->name=$row['name'];
                $champion->image=$row['src'];
                break;
            }
            

            

            $real_stats->champion = $champion;

            $real_stats->win = $stats['win'];

            $kda = new stdClass();
            $kda->kills = $stats['kills'];
            $kda->deaths = $stats['deaths'];
            $kda->assists = $stats['assists'];

            $real_stats->kda = $kda;
            $real_stats->level = $stats['champLevel'];
            $real_stats->controlWards = $stats['visionWardsBoughtInGame'];
            $real_stats->firstBlood = $stats['firstBloodKill'];
            $real_stats->role = $timeline['role'];

            $info->playerStats = $real_stats;
            $games[] = $real_stats;
            break;
        }
    }
}

curl_close($curl);

print_r(json_encode($games, JSON_UNESCAPED_SLASHES));
$conn->close();