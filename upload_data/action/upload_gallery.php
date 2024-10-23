<?php
$servername = "localhost";
$username = "root";
$password = "dede1006";
$dbname = "portfolionathali";

// Membuat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Jika form disubmit
if (isset($_POST["submit"])) {
    // Proses upload gambar
    $target_dir = "../../assets/images/"; // Direktori tempat gambar disimpan
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Validasi format gambar
    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
        echo "Only JPG, JPEG, PNG files are allowed.";
        exit;
    }

    // Coba upload file
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        $image = basename($_FILES["image"]["name"]); // Nama gambar

        // Masukkan data ke database
        $sql = "INSERT INTO instagram_images (image) VALUES ('$image')";
        if ($conn->query($sql) === TRUE) {
            echo "Image uploaded successfully!";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}

$conn->close();
