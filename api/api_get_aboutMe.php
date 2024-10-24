<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");

    include '../database.php';

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT * FROM about_me WHERE id = 1";
        $stmt = $conn->prepare($query);
        $stmt->execute();

        // Ambil satu data karena id bersifat unik
        $abtme = $stmt->fetch(PDO::FETCH_ASSOC);

        // Mengirimkan data dalam format JSON
        echo json_encode($abtme);
    } catch (PDOException $e) {
        echo json_encode(['error' => "Koneksi gagal: " . $e->getMessage()]);
    }
?>