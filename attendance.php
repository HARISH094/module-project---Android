<?php
include("db.php"); // Include your database connection code

// Get the bioid from the request (replace 'stgp718' with the actual user ID)
$bioid = $_GET['bioid'];

// Initialize an associative array to store the counts and percentages
$response = array();

// Query to get total count
$sql_total_count = "SELECT COUNT(*) AS total_count FROM attendance WHERE bioid = '$bioid'";
$result_total_count = $conn->query($sql_total_count);
$row_total_count = $result_total_count->fetch_assoc();
$total_count = $row_total_count['total_count'];

// Query to get present count
$sql_present_count = "SELECT COUNT(*) AS present_count FROM attendance WHERE bioid = '$bioid' AND status = 'present'";
$result_present_count = $conn->query($sql_present_count);
$row_present_count = $result_present_count->fetch_assoc();
$present_count = $row_present_count['present_count'];
$response['present_percentage'] = ($present_count / $total_count) * 100;

// Query to get absent count
$sql_absent_count = "SELECT COUNT(*) AS absent_count FROM attendance WHERE bioid = '$bioid' AND status = 'absent'";
$result_absent_count = $conn->query($sql_absent_count);
$row_absent_count = $result_absent_count->fetch_assoc();
$absent_count = $row_absent_count['absent_count'];
$response['absent_percentage'] = ($absent_count / $total_count) * 100;

// Query to get late count
$sql_late_count = "SELECT COUNT(*) AS late_count FROM attendance WHERE bioid = '$bioid' AND status = 'late'";
$result_late_count = $conn->query($sql_late_count);
$row_late_count = $result_late_count->fetch_assoc();
$late_count = $row_late_count['late_count'];
$response['late_percentage'] = ($late_count / $total_count) * 100;

// Close the database connection
$conn->close();

// Wrap the response in a 'data' array
$data['data'][] = $response;

// Return the response as JSON
echo json_encode($data);
?>
