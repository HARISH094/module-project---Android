<?php
// Include your database connection code here (e.g., db_conn.php)
require_once('db.php');

// Get the bioid from the request (replace 'stgp718' with the actual bioid)
$bioid = $_GET['bioid'];

// Initialize an array to store the leave counts
$leave_counts = array();

// Query to fetch user profile information for 'Comp-off' leave type
$sql_comp_off = "SELECT * FROM `adjusted_leave_count` WHERE `leavetype` = 'Comp-off' AND `bioid` = '$bioid' ORDER BY `adjusted_count` ASC LIMIT 1";
$result_comp_off = $conn->query($sql_comp_off);
$adjustedCount_comp_off = $result_comp_off->num_rows > 0 ? $result_comp_off->fetch_assoc()["adjusted_count"] : 10;
$leave_counts['comp_off'] = (int)$adjustedCount_comp_off; // Convert to integer

// Repeat the same structure for other leave types...
$sql_sick_leave = "SELECT * FROM `adjusted_leave_count` WHERE `leavetype` = 'Sick Leave' AND `bioid` = '$bioid' ORDER BY `adjusted_count` ASC LIMIT 1";
$result_sick_leave = $conn->query($sql_sick_leave);
$adjustedCount_sick_leave = $result_sick_leave->num_rows > 0 ? $result_sick_leave->fetch_assoc()["adjusted_count"] : 36;
$leave_counts['sick_leave'] = (int)$adjustedCount_sick_leave; // Convert to integer

$sql_casual_leave = "SELECT * FROM `adjusted_leave_count` WHERE `leavetype` = 'Casual Leave' AND `bioid` = '$bioid' ORDER BY `adjusted_count` ASC LIMIT 1";
$result_casual_leave = $conn->query($sql_casual_leave);
$adjustedCount_casual_leave = $result_casual_leave->num_rows > 0 ? $result_casual_leave->fetch_assoc()["adjusted_count"] : 24;
$leave_counts['casual_leave'] = (int)$adjustedCount_casual_leave; // Convert to integer

$sql_maternity_leave = "SELECT * FROM `adjusted_leave_count` WHERE `leavetype` = 'Maternity Leave' AND `bioid` = '$bioid' ORDER BY `adjusted_count` ASC LIMIT 1";
$result_maternity_leave = $conn->query($sql_maternity_leave);
$adjustedCount_maternity_leave = $result_maternity_leave->num_rows > 0 ? $result_maternity_leave->fetch_assoc()["adjusted_count"] : 60;
$leave_counts['maternity_leave'] = (int)$adjustedCount_maternity_leave; // Convert to integer

$sql_vacation_leave = "SELECT * FROM `adjusted_leave_count` WHERE `leavetype` = 'Vacation Leave' AND `bioid` = '$bioid' ORDER BY `adjusted_count` ASC LIMIT 1";
$result_vacation_leave = $conn->query($sql_vacation_leave);
$adjustedCount_vacation_leave = $result_vacation_leave->num_rows > 0 ? $result_vacation_leave->fetch_assoc()["adjusted_count"] : 30;
$leave_counts['vacation_leave'] = (int)$adjustedCount_vacation_leave; // Convert to integer

$sql_special_casual_leave = "SELECT * FROM `adjusted_leave_count` WHERE `leavetype` = 'Special Casual Leave' AND `bioid` = '$bioid' ORDER BY `adjusted_count` ASC LIMIT 1";
$result_special_casual_leave = $conn->query($sql_special_casual_leave);
$adjustedCount_Special_Casual_leave = $result_special_casual_leave->num_rows > 0 ? $result_special_casual_leave->fetch_assoc()["adjusted_count"] : 12;
$leave_counts['Special_Casual_leave'] = (int)$adjustedCount_Special_Casual_leave; // Convert to integer

// Calculate the total
$total_count = array_sum($leave_counts);

// Add the total count to the array
$leave_counts['total'] = $total_count;

// Create a "data" array to match the desired structure
$data_array = array('data' => array($leave_counts));

// Convert the array to JSON
$json_response = json_encode($data_array);

// Send the JSON response
header('Content-Type: application/json');
echo $json_response;

// Close the database connection
$conn->close();
?>
