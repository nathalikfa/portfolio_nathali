<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    include '../database.php';

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT * FROM gallery_images";
        $stmt = $conn->prepare($query);
        $stmt->execute();

        // Ambil semua data
        $gallery = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Mengirimkan data dalam format JSON
        echo json_encode($gallery);
    } catch (PDOException $e) {
        echo json_encode(['error' => "Koneksi gagal: " . $e->getMessage()]);
    }
?>