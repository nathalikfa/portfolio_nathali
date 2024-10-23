<?php
    $servername = "localhost";
    $username = "root";
    $password = "dede1006";
    $dbname = "portfolionathali";

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Koneksi gagal: " . $e->getMessage());
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $name = $_POST['name'];
        $description = $_POST['description'];
        $image = $_FILES['image']['name'];

        $target_dir = "../../assets/images/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);

        $check = getimagesize($_FILES["image"]["tmp_name"]);
        if ($check === false) {
            die("File yang di-upload bukan gambar.");
        }

        if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            $query = "INSERT INTO instruments_section (name, description, image) VALUES (:name, :description, :image)";
            $stmt = $conn->prepare($query);

            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':description', $description);
            $stmt->bindParam(':image', $image);

            if ($stmt->execute()) {
                echo "Data instrumen berhasil di-upload.";
            } else {
                echo "Terjadi kesalahan saat menyimpan data.";
            }
        } else {
            echo "Terjadi kesalahan saat meng-upload file gambar.";
        }
    }
?>