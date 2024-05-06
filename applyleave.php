<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

// Include the database connection file
include("db.php");

// Retrieve data from the POST parameters
$bioid = $_POST["bioid"];
$title = $_POST["title"];
$startdate = $_POST["startdate"];
$enddate = $_POST["enddate"];
$leavetype = $_POST["leavetype"];
$phonenumber = $_POST["phonenumber"];
$reason = $_POST["reason"];

// Insert data into the 'applyleave' table
$sql_applyleave = "INSERT INTO applyleave (bioid, title, startdate, enddate, leavetype, phonenumber, reason)
VALUES ('$bioid', '$title', '$startdate', '$enddate', '$leavetype', '$phonenumber', '$reason')";

if ($conn->query($sql_applyleave) === TRUE) {
    $response["success"] = true;
    $response["message"] = "Leave request submitted successfully.";
} else {
    $response["success"] = false;
    $response["error"] = "Error submitting leave request: " . $conn->error;
}

// Close the database connection (Note: $conn is from db.php)
$conn->close();

// Send the JSON response
echo json_encode($response);
?>
