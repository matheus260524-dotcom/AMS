<?php
require_once __DIR__ . '/funcoes.php';
$tituloPagina = $tituloPagina ?? 'Sistema de Biblioteca';
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($tituloPagina) ?> | Biblioteca</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header class="topo">
    <div class="container topo-conteudo">
        <a class="marca" href="index.php">📚 Biblioteca</a>
        <nav>
            <a href="index.php">Início</a>
            <a href="alunos.php">Alunos</a>
            <a href="livros.php">Livros</a>
            <a href="emprestimos.php">Empréstimos</a>
        </nav>
    </div>
</header>
<main class="container">
