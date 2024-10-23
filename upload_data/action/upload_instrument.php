<?php
$servername = "localhost";
$username = "root";
$password = "dede1006";
$dbname = "portfolionathali";

// Koneksi menggunakan PDO
try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Koneksi gagal: " . $e->getMessage());
}

// Cek apakah form sudah disubmit
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil data dari form
    $name = $_POST['name'];
    $description = $_POST['description'];
    $image = $_FILES['image']['name'];

    // Tentukan folder untuk menyimpan gambar yang di-upload
    $target_dir = "../../assets/images/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);

    // Cek apakah file adalah gambar
    $check = getimagesize($_FILES["image"]["tmp_name"]);
    if ($check === false) {
        die("File yang di-upload bukan gambar.");
    }

    // Pindahkan file gambar ke folder uploads
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        // Persiapkan query untuk menyimpan data ke database
        $query = "INSERT INTO instruments_section (name, description, image) VALUES (:name, :description, :image)";
        $stmt = $conn->prepare($query);

        // Bind parameter
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':image', $image);

        // Eksekusi query
        if ($stmt->execute()) {
            echo "Data instrumen berhasil di-upload.";
        } else {
            echo "Terjadi kesalahan saat menyimpan data.";
        }
    } else {
        echo "Terjadi kesalahan saat meng-upload file gambar.";
    }
}
