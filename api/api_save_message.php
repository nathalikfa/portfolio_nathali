<?php
    header('Content-Type: application/json');
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");

    include '../database.php';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Connection failed: " . $e->getMessage());
    }

    // Ambil data dari request
    $data = json_decode(file_get_contents("php://input"));

    // Validasi data
    if (!empty($data->name) && !empty($data->email) && !empty($data->message)) {
        $stmt = $pdo->prepare("INSERT INTO message (name, email, message) VALUES (?, ?, ?)");
        $stmt->execute([$data->name, $data->email, $data->message]);

        echo json_encode(["success" => true, "message" => "Message saved successfully"]);
    } else {
        echo json_encode(["success" => false, "message" => "All fields are required"]);
    }
?>