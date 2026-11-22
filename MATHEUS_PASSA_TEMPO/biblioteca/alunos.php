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
        $nome = trim($_POST['nome'] ?? '');
        $email = trim($_POST['email'] ?? '');

        if ($nome === '' || mb_strlen($nome) > 100 || !filter_var($email, FILTER_VALIDATE_EMAIL) || mb_strlen($email) > 120) {
            $erro = 'Informe um nome e um e-mail válido.';
        } else {
            try {
                if ($id > 0) {
                    $stmt = $pdo->prepare('UPDATE alunos SET nome = ?, email = ? WHERE id_aluno = ?');
                    $stmt->execute([$nome, $email, $id]);
                } else {
                    $stmt = $pdo->prepare('INSERT INTO alunos (nome, email) VALUES (?, ?)');
                    $stmt->execute([$nome, $email]);
                }
                redirecionar('alunos.php?sucesso=1');
            } catch (PDOException $ex) {
                $erro = 'Não foi possível salvar. Verifique se esse e-mail já está cadastrado.';
            }
        }
    } elseif ($acao === 'excluir') {
        $id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);
        if ($id) {
            try {
                $stmt = $pdo->prepare('DELETE FROM alunos WHERE id_aluno = ?');
                $stmt->execute([$id]);
                redirecionar('alunos.php?excluido=1');
            } catch (PDOException $ex) {
                $erro = 'Este aluno possui empréstimos registrados e não pode ser excluído.';
            }
        }
    }
}

if (isset($_GET['editar'])) {
    $stmt = $pdo->prepare('SELECT * FROM alunos WHERE id_aluno = ?');
    $stmt->execute([filter_input(INPUT_GET, 'editar', FILTER_VALIDATE_INT)]);
    $editar = $stmt->fetch() ?: null;
}
$alunos = $pdo->query('SELECT * FROM alunos ORDER BY nome')->fetchAll();
$tituloPagina = 'Alunos';
require 'cabecalho.php';
?>
<h1>Cadastro de alunos</h1>
<?php if ($erro): ?><div class="alerta erro"><?= e($erro) ?></div><?php endif; ?>
<?php if (isset($_GET['sucesso'])): ?><div class="alerta">Aluno salvo com sucesso.</div><?php endif; ?>
<?php if (isset($_GET['excluido'])): ?><div class="alerta">Aluno excluído.</div><?php endif; ?>

<section class="painel">
<h2><?= $editar ? 'Editar aluno' : 'Novo aluno' ?></h2>
<form method="post">
    <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>">
    <input type="hidden" name="acao" value="salvar">
    <input type="hidden" name="id" value="<?= e($editar['id_aluno'] ?? '') ?>">
    <label>Nome</label>
    <input name="nome" maxlength="100" required value="<?= e($editar['nome'] ?? '') ?>">
    <label>E-mail</label>
    <input type="email" name="email" maxlength="120" required value="<?= e($editar['email'] ?? '') ?>">
    <button class="botao" type="submit">Salvar aluno</button>
    <?php if ($editar): ?> <a class="botao secundario" href="alunos.php">Cancelar</a><?php endif; ?>
</form>
</section>

<section class="painel">
<h2>Alunos cadastrados</h2>
<div class="tabela-wrap"><table><thead><tr><th>Nome</th><th>E-mail</th><th>Ações</th></tr></thead><tbody>
<?php foreach ($alunos as $aluno): ?>
<tr>
    <td><?= e($aluno['nome']) ?></td><td><?= e($aluno['email']) ?></td>
    <td class="acoes"><a href="alunos.php?editar=<?= (int)$aluno['id_aluno'] ?>">Editar</a>
    <form method="post" onsubmit="return confirm('Tem certeza que deseja excluir este aluno?')">
        <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>">
        <input type="hidden" name="acao" value="excluir"><input type="hidden" name="id" value="<?= (int)$aluno['id_aluno'] ?>">
        <button class="link-perigo" type="submit">Excluir</button>
    </form></td>
</tr>
<?php endforeach; ?>
<?php if (!$alunos): ?><tr><td colspan="3">Nenhum aluno cadastrado.</td></tr><?php endif; ?>
</tbody></table></div>
</section>
<?php require 'rodape.php'; ?>
