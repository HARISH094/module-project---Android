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

// Check if the user is logged in
if (!isset($_SESSION["bioid"])) {
    handleResponse(false, "User not logged in.");
}

// Handle GET request to fetch holiday information with pagination
if ($_SERVER["REQUEST_METHOD"] === "GET") {
    // Define the number of records to fetch at a time
    $recordsPerPage = 8;

    // Get the page number from the URL parameter or set it to 1 by default
    $page = isset($_GET['page']) ? intval($_GET['page']) : 1;

    // Calculate the offset based on the current page and records per page
    $offset = ($page - 1) * $recordsPerPage;

    // Fetch holiday information from the database with the specified offset and limit
    $sql = "SELECT * FROM holidays LIMIT $offset, $recordsPerPage";
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
}

// Handle POST request (if needed)
elseif ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Handle POST data if required
    // Example: $variable = $_POST["variable_name"];
}

// Invalid request method
else {
    handleResponse(false, "Invalid request method.");
}

// Close the database connection
$conn->close();
?>
