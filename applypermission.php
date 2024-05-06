<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

// Include the database connection file
include("db.php");

// Retrieve data from the POST parameters
$bioid = $_POST["bioid"];
$title = $_POST["title"];
$date = $_POST["date"];
$starttime = $_POST["starttime"];
$endtime = $_POST["endtime"];
$phonenumber = $_POST["phonenumber"];
$reason = $_POST["reason"];

// Insert data into the 'applyleave' table
$sql_applypermission = "INSERT INTO applypermission (bioid, title, date, starttime, endtime, phonenumber, reason)
VALUES ('$bioid', '$title', '$date', '$starttime', '$endtime', '$phonenumber', '$reason')";

if ($conn->query($sql_applypermission) === TRUE) {
    $response["success"] = true;
    $response["message"] = "permission request submitted successfully.";
} else {
    $response["success"] = false;
    $response["error"] = "Error submitting leave request: " . $conn->error;
}

// Close the database connection (Note: $conn is from db.php)
$conn->close();

// Send the JSON response
echo json_encode($response);
?>
