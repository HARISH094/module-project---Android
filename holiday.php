<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

// Include the database connection details
include("db.php");

// Function to handle errors and set response
function handleResponse($success, $message = "", $data = array()) {
    global $response;
    $response["success"] = $success;
    if (!empty($message)) {
        $response["message"] = $message;
    }
    if (!empty($data)) {
        $response["data"] = $data;
    }
    echo json_encode($response);
    exit();
}

// Fetch all holiday information from the database
$sql = "SELECT * FROM holidays";
$result = $conn->query($sql);

// Initialize an array to store holiday data
$holidays = array();

if ($result) {
    // Loop through the result set and add holiday data to the array
    while ($row = $result->fetch_assoc()) {
        $holidays[] = $row;
    }
    handleResponse(true, "Holiday information retrieved successfully.", $holidays);
} else {
    handleResponse(false, "Error executing query: " . $conn->error);
}

// Close the database connection
$conn->close();
?>
