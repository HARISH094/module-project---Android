<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

include("db.php");

$sql = "SELECT sno, department FROM department";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $departments = array(); // Initialize an array to store department records
    while ($row = $result->fetch_assoc()) {
        $department = array(
            "sno" => $row["sno"],
            "department" => $row["department"],
            "delete_url" => "deletedept.php?sno=" . $row["sno"]
        );
        $departments[] = $department; // Add department record to the departments array
    }
    $response["departments"] = $departments; // Add departments array to the response
} else {
    $response["error"] = "No departments found.";
}

// Close the database connection
$conn->close();

// Send the JSON response
echo json_encode($response);
?>
