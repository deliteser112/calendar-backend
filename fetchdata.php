<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "twivuze";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $doctor_id = $_GET['doctor_id'];
    $start_date = $_GET['start_date'];
    $end_date = $_GET['end_date'];

    $sql = "SELECT * FROM (SELECT t1.date AS slot_date, t2.time AS slot_time FROM (SELECT id, DATE FROM calendars WHERE doctor_id = {$doctor_id}) t1 LEFT JOIN timeslots t2 ON t1.id = t2.calender_id) t3 WHERE slot_date BETWEEN '{$start_date}' AND '{$end_date}'";
    $result = $conn->query($sql);

    $sqll = "SELECT COUNT(slot_date) AS slot_count, slot_date FROM (SELECT t1.date AS slot_date, t2.time AS slot_time FROM (SELECT id, DATE FROM calendars WHERE doctor_id = {$doctor_id}) t1 LEFT JOIN timeslots t2 ON t1.id = t2.calender_id) t3 WHERE slot_date BETWEEN '{$start_date}' AND '{$end_date}' GROUP BY slot_date";
    $resultl = $conn->query($sqll);
    $max_count = 0;
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $value = $row["slot_date"]."/".$row["slot_time"];
            $response[] = $value;
        }
        while($row = $resultl->fetch_assoc()) {
            if($row["slot_count"] > $max_count){
                $max_count = $row["slot_count"];
            }
        }
        $res['res'] = $response;
        $res['max'] = $max_count;
        echo json_encode($res);
    }else{
        echo json_encode("empty");
    }
    
    $conn->close();
?>