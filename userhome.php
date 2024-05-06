<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

// Include the database connection details
include("db.php");

// Function to handle errors and set response
function handleResponse($success, $message = "") {
    global $response;
    $response["success"] = $success;
    if (!empty($message)) {
        $response["message"] = $message;
    }
    echo json_encode($response);
    exit();
}

// Check if the user is logged in
if (!isset($_SESSION["bioid"])) {
    handleResponse(false, "User not logged in.");
}

$bioid = $_SESSION["bioid"];

// Handle GET request to retrieve attendance counts
if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $sqlPresentCount = "SELECT COUNT(*) AS present_count FROM attendance WHERE bioid = '$bioid' AND status = 'present'";
    $resultPresentCount = $conn->query($sqlPresentCount);
    
    if ($resultPresentCount) {
        $rowPresentCount = $resultPresentCount->fetch_assoc();
        $response["presentCount"] = $rowPresentCount["present_count"];
    } else {
        handleResponse(false, "Error executing present count query: " . $conn->error);
    }

    $sqlAbsentCount = "SELECT COUNT(*) AS absent_count FROM attendance WHERE bioid = '$bioid' AND status = 'absent'";
    $resultAbsentCount = $conn->query($sqlAbsentCount);

    if ($resultAbsentCount) {
        $rowAbsentCount = $resultAbsentCount->fetch_assoc();
        $response["absentCount"] = $rowAbsentCount["absent_count"];
    } else {
        handleResponse(false, "Error executing absent count query: " . $conn->error);
    }

    $sqlLateCount = "SELECT COUNT(*) AS late_count FROM attendance WHERE bioid = '$bioid' AND status = 'late'";
    $resultLateCount = $conn->query($sqlLateCount);

    if ($resultLateCount) {
        $rowLateCount = $resultLateCount->fetch_assoc();
        $response["lateCount"] = $rowLateCount["late_count"];
        handleResponse(true, "Attendance counts retrieved successfully.");
    } else {
        handleResponse(false, "Error executing late count query: " . $conn->error);
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
