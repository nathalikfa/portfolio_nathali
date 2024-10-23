<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    include '../database.php';

    try {
        $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT * FROM contact WHERE id = 1";
        $stmt = $conn->prepare($query);
        $stmt->execute();

        // Ambil satu data karena id bersifat unik
        $contact = $stmt->fetch(PDO::FETCH_ASSOC);

        // Mengirimkan data dalam format JSON
        echo json_encode($contact);
    } catch (PDOException $e) {
        echo json_encode(['error' => "Koneksi gagal: " . $e->getMessage()]);
    }
?>