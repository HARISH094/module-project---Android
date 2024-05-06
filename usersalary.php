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

$bioid = $_SESSION["bioid"];

// Handle GET request to retrieve user salary information
if ($_SERVER["REQUEST_METHOD"] === "GET") {
    // Query to fetch user salary information based on bioid
    $sql = "SELECT bioid, date, basicsalary, allowance, total FROM salary1 WHERE bioid = '$bioid'";
    $result = $conn->query($sql);

    if ($result) {
        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            $data = array(
                "bioid" => $row["bioid"],
                "date" => $row["date"],
                "basicsalary" => $row["basicsalary"],
                "allowance" => $row["allowance"],
                "total" => $row["total"]
            );
            handleResponse(true, "User salary information retrieved successfully.", $data);
        } else {
            handleResponse(false, "Salary information not found.");
        }
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
