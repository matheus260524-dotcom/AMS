<?php
require_once 'config.php';
require_once 'funcoes.php';

$erro = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    validar_csrf();
    $acao = $_POST['acao'] ?? '';
    $idEmprestimo = filter_input(INPUT_POST, 'id_emprestimo', FILTER_VALIDATE_INT);

    if ($acao === 'emprestar') {
        $idAluno = filter_input(INPUT_POST, 'id_aluno', FILTER_VALIDATE_INT);
        $idLivro = filter_input(INPUT_POST, 'id_livro', FILTER_VALIDATE_INT);
        if (!$idAluno || !$idLivro) {
            $erro = 'Selecione um aluno e um livro.';
        } else {
            try {
                $pdo->beginTransaction();
                $stmt = $pdo->prepare("SELECT status FROM livros WHERE id_livro = ? FOR UPDATE");
                $stmt->execute([$idLivro]);
                $livro = $stmt->fetch();
                if (!$livro || $livro['status'] !== 'disponivel') {
                    throw new RuntimeException('Esse livro não está disponível para empréstimo.');
                }
                $stmt = $pdo->prepare("INSERT INTO emprestimos (id_aluno, id_livro, data_emprestimo) VALUES (?, ?, CURDATE())");
                $stmt->execute([$idAluno, $idLivro]);
                $stmt = $pdo->prepare("UPDATE livros SET status = 'emprestado' WHERE id_livro = ?");
                $stmt->execute([$idLivro]);
                $pdo->commit();
                redirecionar('emprestimos.php?sucesso=1');
            } catch (Throwable $ex) {
                if ($pdo->inTransaction()) $pdo->rollBack();
                $erro = $ex instanceof RuntimeException ? $ex->getMessage() : 'Não foi possível registrar. Confira os dados selecionados.';
            }
        }
    } elseif ($acao === 'devolver' && $idEmprestimo) {
        try {
            $pdo->beginTransaction();
            $stmt = $pdo->prepare("SELECT id_livro FROM emprestimos WHERE id_emprestimo = ? AND status = 'aberto' FOR UPDATE");
            $stmt->execute([$idEmprestimo]);
            $emprestimo = $stmt->fetch();
            if ($emprestimo) {
                $pdo->prepare("UPDATE emprestimos SET status = 'devolvido', data_devolucao = CURDATE() WHERE id_emprestimo = ?")->execute([$idEmprestimo]);
                $pdo->prepare("UPDATE livros SET status = 'disponivel' WHERE id_livro = ?")->execute([$emprestimo['id_livro']]);
            }
            $pdo->commit();
            redirecionar('emprestimos.php?devolvido=1');
        } catch (Throwable $ex) {
            if ($pdo->inTransaction()) $pdo->rollBack();
            $erro = 'Não foi possível registrar a devolução.';
        }
    }
}

$alunos = $pdo->query('SELECT id_aluno, nome FROM alunos ORDER BY nome')->fetchAll();
$livros = $pdo->query("SELECT id_livro, titulo FROM livros WHERE status = 'disponivel' ORDER BY titulo")->fetchAll();
$emprestimos = $pdo->query(
    'SELECT e.*, a.nome AS aluno, l.titulo AS livro
     FROM emprestimos e
     INNER JOIN alunos a ON a.id_aluno = e.id_aluno
     INNER JOIN livros l ON l.id_livro = e.id_livro
     ORDER BY e.id_emprestimo DESC'
)->fetchAll();
$tituloPagina = 'Empréstimos';
require 'cabecalho.php';
?>
<h1>Empréstimos e devoluções</h1>
<?php if ($erro): ?><div class="alerta erro"><?= e($erro) ?></div><?php endif; ?>
<?php if (isset($_GET['sucesso'])): ?><div class="alerta">Empréstimo registrado.</div><?php endif; ?>
<?php if (isset($_GET['devolvido'])): ?><div class="alerta">Devolução registrada.</div><?php endif; ?>
<section class="painel">
<h2>Novo empréstimo</h2>
<?php if (!$alunos || !$livros): ?>
<p>Para registrar um empréstimo, cadastre pelo menos um aluno e um livro disponível.</p>
<?php else: ?>
<form method="post">
<input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>"><input type="hidden" name="acao" value="emprestar">
<label>Aluno</label><select name="id_aluno" required><option value="">Selecione</option>
<?php foreach ($alunos as $aluno): ?><option value="<?= (int)$aluno['id_aluno'] ?>"><?= e($aluno['nome']) ?></option><?php endforeach; ?></select>
<label>Livro disponível</label><select name="id_livro" required><option value="">Selecione</option>
<?php foreach ($livros as $livro): ?><option value="<?= (int)$livro['id_livro'] ?>"><?= e($livro['titulo']) ?></option><?php endforeach; ?></select>
<button class="botao" type="submit">Registrar empréstimo</button>
</form>
<?php endif; ?>
</section>
<section class="painel">
<h2>Histórico de empréstimos</h2>
<div class="tabela-wrap"><table><thead><tr><th>Aluno</th><th>Livro</th><th>Empréstimo</th><th>Devolução</th><th>Status</th><th>Ação</th></tr></thead><tbody>
<?php foreach ($emprestimos as $item): ?>
<tr><td><?= e($item['aluno']) ?></td><td><?= e($item['livro']) ?></td>
<td><?= e(date('d/m/Y', strtotime($item['data_emprestimo']))) ?></td>
<td><?= $item['data_devolucao'] ? e(date('d/m/Y', strtotime($item['data_devolucao']))) : '—' ?></td>
<td><span class="status <?= e($item['status']) ?>"><?= e(ucfirst($item['status'])) ?></span></td>
<td><?php if ($item['status'] === 'aberto'): ?>
<form method="post" onsubmit="return confirm('Confirmar a devolução deste livro?')">
<input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>"><input type="hidden" name="acao" value="devolver"><input type="hidden" name="id_emprestimo" value="<?= (int)$item['id_emprestimo'] ?>">
<button class="botao pequeno" type="submit">Marcar devolução</button></form>
<?php else: ?>Concluído<?php endif; ?></td></tr>
<?php endforeach; ?>
<?php if (!$emprestimos): ?><tr><td colspan="6">Nenhum empréstimo registrado.</td></tr><?php endif; ?>
</tbody></table></div>
</section>
<?php require 'rodape.php'; ?>
