<?php
    $servername = "localhost";
    $username = "root";
    $password = "dede1006";
    $dbname = "portfolionathali";

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo "Koneksi gagal: " . $e->getMessage();
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $name = $_POST['name'];
        $title = $_POST['title'];

        $image = $_FILES['image']['name'];
        $tmp_name = $_FILES['image']['tmp_name'];
        $target_dir = "../../assets/images/";
        $target_file = $target_dir . basename($image);

        if (!file_exists($tmp_name)) {
            echo "Error: File tidak di-upload dengan benar.";
            exit;
        }

        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        $check = getimagesize($tmp_name);

        if ($check !== false) {
            if (move_uploaded_file($tmp_name, $target_file)) {
                $query = "INSERT INTO works_section (name, title, image) VALUES (:name, :title, :image)";
                $stmt = $conn->prepare($query);
                $stmt->bindParam(':name', $name);
                $stmt->bindParam(':title', $title);
                $stmt->bindParam(':image', $image);

                if ($stmt->execute()) {
                    echo "Gambar berhasil di-upload dan data berhasil disimpan!";
                } else {
                    echo "Error: Tidak dapat menyimpan data ke database.";
                }
            } else {
                echo "Error: Ada masalah dalam meng-upload file.";
            }
        } else {
            echo "Error: File yang di-upload bukan gambar.";
        }
    }
?>