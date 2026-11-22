<?php
require_once 'config.php';
$tituloPagina = 'Início';
require 'cabecalho.php';

$totalAlunos = (int)$pdo->query('SELECT COUNT(*) FROM alunos')->fetchColumn();
$totalLivros = (int)$pdo->query('SELECT COUNT(*) FROM livros')->fetchColumn();
$abertos = (int)$pdo->query("SELECT COUNT(*) FROM emprestimos WHERE status = 'aberto'")->fetchColumn();
?>
<section class="hero">
    <p class="etiqueta">SISTEMA DE GERENCIAMENTO</p>
    <h1>Bem-vindo à Biblioteca</h1>
    <p>Cadastre alunos e livros, registre empréstimos e acompanhe as devoluções em um só lugar.</p>
    <a class="botao" href="emprestimos.php">Ver empréstimos</a>
</section>

<section class="cards">
    <article class="card"><span>Alunos cadastrados</span><strong><?= $totalAlunos ?></strong><a href="alunos.php">Gerenciar alunos →</a></article>
    <article class="card"><span>Livros cadastrados</span><strong><?= $totalLivros ?></strong><a href="livros.php">Gerenciar livros →</a></article>
    <article class="card"><span>Empréstimos em aberto</span><strong><?= $abertos ?></strong><a href="emprestimos.php">Acompanhar →</a></article>
</section>
<section class="painel">
    <h2>Como utilizar</h2>
    <ol>
        <li>Cadastre os alunos que poderão pegar livros emprestados.</li>
        <li>Cadastre os livros disponíveis na biblioteca.</li>
        <li>Registre o empréstimo e, quando o livro voltar, marque a devolução.</li>
    </ol>
</section>
<?php require 'rodape.php'; ?>
