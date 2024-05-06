<?php
header('Content-Type: application/json');
$response = array(); // Initialize an empty associative array to store the response data

// Include the database connection details
include("db.php");

// Check the connection
if ($conn->connect_error) {
    $response["error"] = "Connection failed: " . $conn->connect_error;
} else {
    // SQL query to select salary data
    $sql = "SELECT bioid, date, basicsalary, allowance, total FROM salary1";
    $result = $conn->query($sql);

    if ($result === false) {
        $response["error"] = "Error executing SQL query: " . $conn->error;
    } else {
        if ($result->num_rows > 0) {
            $salaries = array(); // Initialize an empty array to store salary data
            while ($row = $result->fetch_assoc()) {
                // Store each salary record as an associative array
                $salaryRecord = array(
                    "bioid" => $row["bioid"],
                    "date" => $row["date"],
                    "basicsalary" => $row["basicsalary"],
                    "allowance" => $row["allowance"],
                    "total" => $row["total"]
                );
                // Add the salary record to the salaries array
                $salaries[] = $salaryRecord;
            }
            // Add the salaries array to the response
            $response["salaries"] = $salaries;
        } else {
            $response["message"] = "No records found.";
        }
    }
    // Close the database connection
    $conn->close();
}

// Send the JSON response
echo json_encode($response);
?>
