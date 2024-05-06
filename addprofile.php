<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$db_name = "hrapp";

// Create a database connection
$conn = new mysqli($servername, $username, $password, $db_name);

// Check the connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// Retrieve data from the HTML form
$bioid = $_POST["bioid"];
$name = $_POST["name"];
$email = $_POST["email"];
$DOB = $_POST["DOB"];
$phoneNumber = $_POST["phonenumber"];
$JobType = $_POST["jobtype"];
$Designation = $_POST["designation"];
$Department = $_POST["department"];
$experience = $_POST["experience"];
$password = $_POST["password"];
$shift = $_POST["shift"];
$usertype = $_POST["usertype"];

// Initialize the response array
$response = [];

// Check if the 'profilepic' key is set in the $_FILES array
if (isset($_FILES['profilepic'])) {
    // Handle the case when the image is sent as a file
    $image = $_FILES['profilepic']['tmp_name'];

    $uploadDirectory = '../uploads/';
    $uploadURL = 'uploads/';
    $image_file_path = "";

    if (!file_exists($uploadDirectory)) {
        mkdir($uploadDirectory, 0755, true);
    }

    $file_name = $_FILES["profilepic"]["name"];
    $file_tmp = $_FILES["profilepic"]["tmp_name"];
    $ext = pathinfo($file_name, PATHINFO_EXTENSION);

    if (in_array($ext, ['jpeg', 'jpg', 'png', 'gif', 'PNG', 'jfif'])) {
        $newFileName = uniqid('profile') . "." . $ext; // Make sure to include file extension
        $uploadPath = $uploadDirectory . $newFileName;

        if (move_uploaded_file($file_tmp, $uploadPath)) {
            $image_file_path = $uploadURL . $newFileName;
        }
    }

    // Check if image_file_path is empty and set the default image path
    if (empty($image_file_path)) {
        $image_file_path = 'uploads/profile_default.png';
    }
} elseif (isset($_POST['base64ImageString'])) {
    // Handle the case when the image is sent as a base64-encoded string in $_POST
    $base64ImageString = $_POST['base64ImageString'];

    // Extract the mime type and image data from the base64 string
    list($type, $data) = explode(';', $base64ImageString);
    list(, $data) = explode(',', $data);

    // Decode the base64-encoded image data
    $imageData = base64_decode($data);

    // Specify the folder where you want to store the image
    $uploadDirectory = '../uploads/';
    $uploadURL = 'uploads/';
    $image_file_path = "";
    // Create the folder if it doesn't exist
    if (!file_exists($uploadDirectory)) {
        mkdir($uploadDirectory, 0755, true);
    }

    // Generate a unique filename for the image
    $newFileName = uniqid('profile') . '.png';

    // Specify the path to save the image
    $uploadPath = $uploadDirectory . $newFileName;

    // Save the image to the specified path
    file_put_contents($uploadPath, $imageData);

    // Set the image file path
    $image_file_path = $uploadURL . $newFileName;

    // Check if image_file_path is empty and set the default image path
    if (empty($image_file_path)) {
        $image_file_path = 'uploads/profile_default.png';
    }
} else {
    // Handle the case when 'profilepic' is not set in $_FILES and 'base64ImageString' is not set in $_POST
    $image_file_path = 'uploads/profile_default.png';
}

// Insert data into the 'addprofile' table
$sql_addprofile = "INSERT INTO addprofile (bioid, name, email, DOB, phoneNumber, JobType, Designation, Department, experience, password, shift, image)
VALUES ('$bioid', '$name', '$email', '$DOB', '$phoneNumber', '$JobType', '$Designation', '$Department', '$experience', '$password', '$shift','$image_file_path')";

if ($conn->query($sql_addprofile) === TRUE) {
    $response["message"] = "User details inserted and image uploaded successfully.";
} else {
    $response["error_addprofile"] = "Error inserting data into 'addprofile': " . $conn->error;
}

// Insert data into the 'usertable' table
$sql_usertable = "INSERT INTO usertable (name, bioid, password, usertype) VALUES ('$name','$bioid', '$password','$usertype')";

if ($conn->query($sql_usertable) === TRUE) {
    $response["message"] = "User details inserted and image uploaded successfully.";
} else {
    $response["error_usertable"] = "Error inserting data into 'usertable': " . $conn->error;
}

// Close the database connection
$conn->close();

// Send JSON response
echo json_encode($response);
?>