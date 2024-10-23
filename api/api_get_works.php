<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    include '../database.php';

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT * FROM works_section";
        $stmt = $conn->prepare($query);
        $stmt->execute();

        // Ambil semua hasil sebagai array asosiatif
        $works = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Kirimkan data dalam format JSON
        echo json_encode($works);
    } catch (PDOException $e) {
        echo json_encode(['error' => "Koneksi gagal: " . $e->getMessage()]);
    }
?>