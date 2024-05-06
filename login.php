<?php
header('Content-Type: application/json');
session_start();
include("db.php");

$response = array(); // Initialize an empty associative array to store the response data

if ($_SERVER["REQUEST_METHOD"] === "GET") { // Change the method to GET
    $username = $_GET["bioid"];
    $password = $_GET["password"];
    $sql = "SELECT * FROM usertable WHERE bioid = '$username' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $bioid = $row["bioid"];
        $name = $row["name"];
        $_SESSION["bioid"] = $bioid;
        $_SESSION["name"] = $name;
        $usertype = $row["usertype"];

        // Verify password using password_verify function
        if ($usertype == "1") {
            $response["success"] = true;
            $response["message"] = "Login successful.";
            $response["data"] = [
                [
                    "usertype" => "admin",
                    "bioid" => $bioid,
                    "password" => $password
                ]
            ];
        } elseif ($usertype == "2") {
            $response["success"] = true;
            $response["message"] = "Login successful.";
            $response["data"] = [
                [
                    "usertype" => "user",
                    "bioid" => $bioid,
                    "password" => $password
                ]
            ];
        } elseif ($usertype == "3") {
            $response["success"] = true;
            $response["message"] = "Login successful.";
            $response["data"] = [
                [
                    "usertype" => "reviewer",
                    "bioid" => $bioid,
                    "password" => $password
                ]
            ];
        } else {
            $response["success"] = false;
            $response["error"] = "Unknown role: $usertype";
        }
    } else {
        $response["success"] = false;
        $response["error"] = "Login failed. Please check your bio ID and password.";
    }

    // Close the database connection
    $conn->close();
} else {
    $response["success"] = false;
    $response["error"] = "Invalid request method.";
}

// Send the JSON response
echo json_encode($response);
?>
