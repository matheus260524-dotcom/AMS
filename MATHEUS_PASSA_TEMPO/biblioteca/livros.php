<?php
require_once 'config.php';
require_once 'funcoes.php';

$erro = '';
$editar = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    validar_csrf();
    $acao = $_POST['acao'] ?? '';
    if ($acao === 'salvar') {
        $id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT) ?: 0;
        $titulo = trim($_POST['titulo'] ?? '');
        $autor = trim($_POST['autor'] ?? '');
        if ($titulo === '' || $autor === '' || mb_strlen($titulo) > 150 || mb_strlen($autor) > 100) {
            $erro = 'Preencha título e autor dentro dos limites indicados.';
        } else {
            if ($id > 0) {
                $stmt = $pdo->prepare('UPDATE livros SET titulo = ?, autor = ? WHERE id_livro = ?');
                $stmt->execute([$titulo, $autor, $id]);
            } else {
                $stmt = $pdo->prepare('INSERT INTO livros (titulo, autor) VALUES (?, ?)');
                $stmt->execute([$titulo, $autor]);
            }
            redirecionar('livros.php?sucesso=1');
        }
    } elseif ($acao === 'excluir') {
        $id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);
        if ($id) {
            try {
                $stmt = $pdo->prepare('DELETE FROM livros WHERE id_livro = ?');
                $stmt->execute([$id]);
                redirecionar('livros.php?excluido=1');
            } catch (PDOException $ex) {
                $erro = 'Este livro possui empréstimos registrados e não pode ser excluído.';
            }
        }
    }
}
if (isset($_GET['editar'])) {
    $stmt = $pdo->prepare('SELECT * FROM livros WHERE id_livro = ?');
    $stmt->execute([filter_input(INPUT_GET, 'editar', FILTER_VALIDATE_INT)]);
    $editar = $stmt->fetch() ?: null;
}
$livros = $pdo->query('SELECT * FROM livros ORDER BY titulo')->fetchAll();
$tituloPagina = 'Livros';
require 'cabecalho.php';
?>
<h1>Cadastro de livros</h1>
<?php if ($erro): ?><div class="alerta erro"><?= e($erro) ?></div><?php endif; ?>
<?php if (isset($_GET['sucesso'])): ?><div class="alerta">Livro salvo com sucesso.</div><?php endif; ?>
<?php if (isset($_GET['excluido'])): ?><div class="alerta">Livro excluído.</div><?php endif; ?>
<section class="painel">
<h2><?= $editar ? 'Editar livro' : 'Novo livro' ?></h2>
<form method="post">
    <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>">
    <input type="hidden" name="acao" value="salvar">
    <input type="hidden" name="id" value="<?= e($editar['id_livro'] ?? '') ?>">
    <label>Título</label><input name="titulo" maxlength="150" required value="<?= e($editar['titulo'] ?? '') ?>">
    <label>Autor</label><input name="autor" maxlength="100" required value="<?= e($editar['autor'] ?? '') ?>">
    <button class="botao" type="submit">Salvar livro</button>
    <?php if ($editar): ?> <a class="botao secundario" href="livros.php">Cancelar</a><?php endif; ?>
</form>
</section>
<section class="painel">
<h2>Livros cadastrados</h2>
<div class="tabela-wrap"><table><thead><tr><th>Título</th><th>Autor</th><th>Status</th><th>Ações</th></tr></thead><tbody>
<?php foreach ($livros as $livro): ?>
<tr><td><?= e($livro['titulo']) ?></td><td><?= e($livro['autor']) ?></td>
<td><span class="status <?= e($livro['status']) ?>"><?= e(ucfirst($livro['status'])) ?></span></td>
<td class="acoes"><a href="livros.php?editar=<?= (int)$livro['id_livro'] ?>">Editar</a>
<form method="post" onsubmit="return confirm('Tem certeza que deseja excluir este livro?')">
<input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>"><input type="hidden" name="acao" value="excluir"><input type="hidden" name="id" value="<?= (int)$livro['id_livro'] ?>">
<button class="link-perigo" type="submit">Excluir</button></form></td></tr>
<?php endforeach; ?>
<?php if (!$livros): ?><tr><td colspan="4">Nenhum livro cadastrado.</td></tr><?php endif; ?>
</tbody></table></div>
</section>
<?php require 'rodape.php'; ?>
