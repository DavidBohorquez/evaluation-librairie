<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header('Location: ../src/login.php');
    exit();
}
//echo getcwd();
//echo "#".__DIR__;
include(__DIR__ . '/src/config.php');
// include("src/header.php");

$page = isset($_GET['page']) ? $_GET['page'] : 'home';

if ($page === 'login') {
    console.log("###login_test");
    echo "Avant inclusion du login.php"; // Débogage
    include("src/login.php");
    echo "Après inclusion du login.php"; // Débogage
} elseif ($page === 'books') {
    include("src/books.php");
} else {
    include("src/home.php");
}

//include("src/footer.php");
?>