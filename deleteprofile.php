<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

// Include your database connection code (db.php)
include("db.php");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $bioid = $_POST["bioid"];

    // Prepare and execute the SQL query to delete the record from 'addprofile' table
    $sqlAddProfile = "DELETE FROM addprofile WHERE `bioid` = ?";
    $stmtAddProfile = $conn->prepare($sqlAddProfile);
    $stmtAddProfile->bind_param("i", $bioid);

    // Prepare and execute the SQL query to delete the record from 'usertable' table
    $sqlUserTable = "DELETE FROM usertable WHERE `bioid` = ?";
    $stmtUserTable = $conn->prepare($sqlUserTable);
    $stmtUserTable->bind_param("i", $bioid);

    // Delete from 'addprofile' table
    if ($stmtAddProfile->execute()) {
        // Delete from 'usertable' table
        if ($stmtUserTable->execute()) {
            // Records deleted successfully
            $response["success"] = true;
            $response["message"] = "Records deleted successfully.";
        } else {
            // Handle the case where deletion from 'usertable' fails
            $response["success"] = false;
            $response["error"] = "Error deleting record from usertable: " . $stmtUserTable->error;
        }
    } else {
        // Handle the case where deletion from 'addprofile' fails
        $response["success"] = false;
        $response["error"] = "Error deleting record from addprofile: " . $stmtAddProfile->error;
    }

    // Close the statements and database connection
    $stmtAddProfile->close();
    $stmtUserTable->close();
    $conn->close();
} else {
    // Handle the case where the bioid parameter is missing or invalid
    $response["success"] = false;
    $response["error"] = "Invalid or missing bioid parameter.";
}

// Send the JSON response
echo json_encode($response);
?>
