<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

include("db.php");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (!isset($_POST["sno"])) {
        $response["error"] = "Department serial number ('sno') not provided.";
    } else {
        $sno = $_POST["sno"];

        // Delete the department from the 'department' table
        $sql = "DELETE FROM department WHERE sno = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $sno);

        if ($stmt->execute()) {
            $response["success"] = "Department deleted successfully.";
        } else {
            // Handle the case where the delete query fails
            $response["error"] = "Error deleting department: " . $stmt->error;
        }
    }
} else {
    // Handle the case where an invalid request method is used
    $response["error"] = "Invalid request method.";
}

// Close the statement and database connection
$stmt->close();
$conn->close();

// Send the JSON response
echo json_encode($response);
?>
