<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

include("db.php"); // Include the database connection file

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Get department name from the form
    $department = $_POST["department"];

    // Prepare and execute an SQL statement to insert the department into the database
    $sql = "INSERT INTO department (department) VALUES ('$department')";

    if ($conn->query($sql) === TRUE) {
        $response["success"] = true;
        $response["message"] = "Department added successfully.";
    } else {
        $response["error"] = "Error: " . $sql . "<br>" . $conn->error;
    }

} else {
    $response["error"] = "Invalid request method.";
}

// Close the database connection
$conn->close();

// Send the JSON response
echo json_encode($response);
?>
