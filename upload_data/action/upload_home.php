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

// Jika form disubmit
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Escape input form untuk mencegah SQL injection
    $title = mysqli_real_escape_string($conn, $_POST['title']);
    $subtitle = mysqli_real_escape_string($conn, $_POST['subtitle']);
    $button_text = mysqli_real_escape_string($conn, $_POST['button_text']);

    // Upload PDF
    $target_dir = "../../assets/files/";
    $target_file = $target_dir . basename($_FILES["button_link"]["name"]);
    $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check file type
    if ($fileType != "pdf") {
        echo "Only PDF files are allowed.";
        exit;
    }

    // Upload the file
    if (move_uploaded_file($_FILES["button_link"]["tmp_name"], $target_file)) {
        $button_link = mysqli_real_escape_string($conn, basename($_FILES["button_link"]["name"])); // Nama file PDF yang diupload

        // Simpan data ke database
        $sql = "INSERT INTO home_section (title, subtitle, button_text, button_link) 
                VALUES ('$title', '$subtitle', '$button_text', '$button_link')";

        if ($conn->query($sql) === TRUE) {
            echo "New record created successfully.";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}

$conn->close();
