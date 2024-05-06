<?php
// Include your database connection code here (e.g., db_conn.php)
require_once('db.php');

// Get the user_id from the request (replace 'stgp718' with the actual user ID)
$bioid = $_GET['bioid'];

// Initialize an array to store the user details
$user_details = array();

// Query the transporter_signup table to retrieve user details based on user_id
$sql = "SELECT startdate, title, leavetype FROM approvedleave WHERE bioid = '$bioid'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Fetch the user details
    $row = $result->fetch_assoc();

    // Store the details in an array
    $user_details[] = array(
        'startdate' => $row['startdate'],
        'title' => $row['title'],
        'leavetype' => $row['leavetype'],
    );

    // Wrap the user details in a "data" array
    $response = array('data' => $user_details);

    // Return the user details as JSON
    echo json_encode($response);
} else {
    // If user_id is not found in transporter_signup
    echo "User not found in transporter_signup.";
}

// Close the database connection
$conn->close();
?>