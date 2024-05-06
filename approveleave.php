<?php
header('Content-Type: application/json');

// Include your database connection file (db.php)
include("db.php");

$response = array(); // Initialize an empty associative array to store the response data

// Check the request method
if ($_SERVER["REQUEST_METHOD"] === "GET" || $_SERVER["REQUEST_METHOD"] === "POST") {
    $sql = "SELECT sno, bioid, title, startdate, enddate, leavetype, phonenumber, reason FROM applyleave";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $data = array(); // Initialize an empty array to store the fetched data
        while ($row = $result->fetch_assoc()) {
            $data[] = $row; // Add each row to the data array
        }
        $response["data"] = $data; // Assign the data array to the "data" key in the response
    } else {
        $response["error"] = "No data found in the table";
    }
} else {
    $response["error"] = "Invalid request method";
}

// Close the database connection
$conn->close();

// Send the JSON response
echo json_encode($response);
?>
