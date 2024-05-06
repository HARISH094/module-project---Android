<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$db_name = "hrapp";
$baseURL = "http://192.168.76.171/hrapp/"; // Replace with the actual base URL

$conn = new mysqli($servername, $username, $password, $db_name);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if a category is provided in the request
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // You can add more validation for other parameters if needed

    // Prepare and execute the SQL query to retrieve data from the 'addprofile' table
    $stmt = $conn->prepare("SELECT bioid, name, email, DOB, phonenumber, jobtype, designation, department, experience, shift, image FROM addprofile");
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($bioid, $name, $email, $DOB, $phonenumber, $jobtype, $designation, $department, $experience, $shift, $image);

    $profiles = [];

    while ($stmt->fetch()) {
        $profiles[] = [
            "bioid" => $bioid,
            "name" => $name,
            "email" => $email,
            "DOB" => $DOB,
            "phonenumber" => strval($phonenumber),
            "jobtype" => $jobtype,
            "designation" => $designation,
            "department" => $department,
            "experience" => $experience,
            "shift" => $shift,
            "image" => $baseURL . $image // Concatenate with the base URL
        ];
    }

    // Wrap the profiles array in a "data" key
    $response = ["data" => $profiles];

    echo json_encode($response);
} else {
    echo json_encode(["error" => "Invalid request method or parameters."]);
}

$conn->close();
?>
