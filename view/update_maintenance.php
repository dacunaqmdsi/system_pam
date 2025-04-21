<?php
$conn = mysqli_connect("localhost", "root", "", "pam");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['status'])) {
    foreach ($_POST['status'] as $id => $value) {
        $id = (int)$id;
        $value = (int)$value;
        $update = "UPDATE maintenance_table SET is_closed = $value WHERE id = $id";
        mysqli_query($conn, $update);
    }
}

header("Location: maintinance.php");
exit;
