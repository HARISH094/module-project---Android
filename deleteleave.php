<?php
include("db.php"); // Include your database connection code

// Initialize the response array
$response = array();

// Check if the sno parameter is set in the POST data
if (isset($_POST["sno"])) {
    $sno = $_POST["sno"];

    // Retrieve leave request data based on sno from the 'applyleave' table
    $sql_select = "SELECT * FROM applyleave WHERE sno = ?";
    $stmt_select = $conn->prepare($sql_select);
    $stmt_select->bind_param("s", $sno);
    $stmt_select->execute();
    $result = $stmt_select->get_result();
    $row = $result->fetch_assoc();

    if ($row) {
        // Insert the leave request data into the 'approvedleave' table
        $sql_insert = "INSERT INTO rejectedleave (bioid, title, startdate, enddate, leavetype, phonenumber, reason)
                       VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt_insert = $conn->prepare($sql_insert);
        $stmt_insert->bind_param("sssssss", $row["bioid"], $row["title"], $row["startdate"], $row["enddate"], $row["leavetype"], $row["phonenumber"], $row["reason"]);

        if ($stmt_insert->execute()) {
            // Delete the row from the 'applyleave' table based on sno
            $sql_delete = "DELETE FROM applyleave WHERE sno = ?";
            $stmt_delete = $conn->prepare($sql_delete);
            $stmt_delete->bind_param("s", $sno);

            if ($stmt_delete->execute()) {
                // Success message in response
                $response["success"] = true;
                $response["message"] = "Leave request rejected and deleted successfully.";
            } else {
                // Error message for deletion failure
                $response["success"] = false;
                $response["message"] = "Error deleting leave request: " . $stmt_delete->error;
            }
        } else {
            // Error message for insertion failure
            $response["success"] = false;
            $response["message"] = "Error approving leave request: " . $stmt_insert->error;
        }
    } else {
        // Error message for invalid sno
        $response["success"] = false;
        $response["message"] = "Invalid sno parameter.";
    }
} else {
    // Error message for missing sno parameter
    $response["success"] = false;
    $response["message"] = "Sno not provided in the POST data.";
}

// Close the statements and database connection
$stmt_select->close();
$stmt_insert->close();
$stmt_delete->close();
$conn->close();

// Send the JSON response
echo json_encode($response);
?>
