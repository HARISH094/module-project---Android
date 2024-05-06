<?php
include("db.php"); // Include your database connection code

// Get the bioid from the request (replace 'stgp718' with the actual user ID)
$bioid = $_GET['bioid'];

// Initialize an associative array to store the counts
$response = array();

// Query to get present count
$sql_present_count = "SELECT COUNT(*) AS present_count FROM attendance WHERE bioid = '$bioid' AND status = 'present'";
$result_present_count = $conn->query($sql_present_count);
$row_present_count = $result_present_count->fetch_assoc();
$response['present_count'] = $row_present_count['present_count'];

// Query to get absent count
$sql_absent_count = "SELECT COUNT(*) AS absent_count FROM attendance WHERE bioid = '$bioid' AND status = 'absent'";
$result_absent_count = $conn->query($sql_absent_count);
$row_absent_count = $result_absent_count->fetch_assoc();
$response['absent_count'] = $row_absent_count['absent_count'];

// Query to get late count
$sql_late_count = "SELECT COUNT(*) AS late_count FROM attendance WHERE bioid = '$bioid' AND status = 'late'";
$result_late_count = $conn->query($sql_late_count);
$row_late_count = $result_late_count->fetch_assoc();
$response['late_count'] = $row_late_count['late_count'];

// Close the database connection
$conn->close();

// Wrap the response in a 'data' array
$data['data'][] = $response;

// Return the response as JSON
echo json_encode($data);
?>
