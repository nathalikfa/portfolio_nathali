<?php
    $servername = "localhost";
    $username = "root";
    $password = "dede1006";
    $dbname = "portfolionathali";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $title = mysqli_real_escape_string($conn, $_POST['title']);
        $subtitle = mysqli_real_escape_string($conn, $_POST['subtitle']);
        $button_text = mysqli_real_escape_string($conn, $_POST['button_text']);

        $target_dir = "../../assets/files/";
        $target_file = $target_dir . basename($_FILES["button_link"]["name"]);
        $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        if ($fileType != "pdf") {
            echo "Only PDF files are allowed.";
            exit;
        }

        if (move_uploaded_file($_FILES["button_link"]["tmp_name"], $target_file)) {
            $button_link = mysqli_real_escape_string($conn, basename($_FILES["button_link"]["name"])); // Nama file PDF yang diupload

            $sql = "INSERT INTO home_section (title, subtitle, button_text, button_link) 
                    VALUES ('$title', '$subtitle', '$button_text', '$button_link')";

            if ($conn->query($sql) === TRUE) {
                echo "New record created successfully.";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    $conn->close();
?>