<?php
$servername = "localhost";
$username = "root";
$password = "dede1006";
$dbname = "portfolionathali";

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Set charset ke utf8mb4
$conn->set_charset('utf8mb4');

// Jika form disubmit
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Escape string untuk menghindari SQL injection
    $name = $conn->real_escape_string($_POST['name']);
    $description = $conn->real_escape_string($_POST['description']);
    $link = $conn->real_escape_string($_POST['link']);

    // Upload image
    $target_dir = "../../assets/images/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check file type
    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
        echo "Only JPG, JPEG, PNG files are allowed.";
        exit;
    }

    // Upload the file
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        $image = $conn->real_escape_string(basename($_FILES["image"]["name"])); // Nama gambar yang diupload

        // Simpan data ke database
        $sql = "INSERT INTO article (name, description, image, link) VALUES ('$name', '$description', '$image', '$link')";

        if ($conn->query($sql) === TRUE) {
            echo "New article created successfully.";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}

$conn->close();
