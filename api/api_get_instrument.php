<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");

    include '../database.php';

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT * FROM instruments_section";
        $stmt = $conn->prepare($query);
        $stmt->execute();

        // Ambil semua data
        $instruments = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Mengirimkan data dalam format JSON
        echo json_encode($instruments);
    } catch (PDOException $e) {
        echo json_encode(['error' => "Koneksi gagal: " . $e->getMessage()]);
    }
?>