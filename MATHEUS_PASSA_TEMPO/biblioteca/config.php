<?php
// Ajuste estes dados conforme sua instalação do XAMPP.
$host = 'localhost';
$banco = 'biblioteca';
$usuario = 'root';
$senha = ''; // No XAMPP local, normalmente fica vazio.

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$banco;charset=utf8mb4",
        $usuario,
        $senha,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]
    );
} catch (PDOException $e) {
    // Não exibe detalhes técnicos ou credenciais ao visitante.
    http_response_code(500);
    exit('Não foi possível conectar ao banco de dados. Confira o XAMPP e o arquivo config.php.');
}
