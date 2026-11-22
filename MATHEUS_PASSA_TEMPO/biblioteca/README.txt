SISTEMA DE BIBLIOTECA - COMO INSTALAR

REQUISITOS
- XAMPP instalado (Apache, MySQL/MariaDB e PHP).
- Navegador atualizado.

1. COPIAR OS ARQUIVOS
- Extraia a pasta sistema_biblioteca.
- Copie seu conteúdo para C:\xampp\htdocs\biblioteca
- O arquivo index.php deve ficar diretamente dentro dessa pasta.

2. IMPORTAR O BANCO
- Abra o XAMPP Control Panel.
- Inicie Apache e MySQL.
- Acesse http://localhost/phpmyadmin
- Clique em Importar.
- Selecione database/biblioteca.sql e confirme.
- O script cria o banco biblioteca, as tabelas e alguns dados fictícios.

3. CONFIGURAR A CONEXÃO
- Abra config.php.
- No XAMPP padrão, host=localhost, banco=biblioteca, usuário=root e senha vazia.
- Se sua instalação usar outra senha, altere a variável $senha.

4. ABRIR O SISTEMA
- Acesse http://localhost/biblioteca/
- Cadastre alunos e livros.
- Registre empréstimos e marque as devoluções.

5. TESTES SUGERIDOS
- Cadastre um aluno e um livro.
- Faça um empréstimo: o livro passa para Emprestado.
- Tente emprestar o mesmo livro novamente: o sistema deve impedir.
- Marque a devolução: o livro volta para Disponível.
- Edite um aluno/livro e teste a exclusão. Registros relacionados não podem ser excluídos para preservar a integridade referencial.

ESTRUTURA
- database/biblioteca.sql: criação do banco e dados de exemplo.
- config.php: conexão PDO.
- funcoes.php: funções de segurança e validação CSRF.
- index.php: página inicial.
- alunos.php: CRUD de alunos.
- livros.php: CRUD de livros.
- emprestimos.php: empréstimos, JOIN e devoluções.
- cabecalho.php / rodape.php: estrutura das páginas.
- style.css: aparência.

COMO O PROJETO ATENDE À QUESTÃO 20
- Objetivo: organizar cadastro de alunos, livros e empréstimos.
- DER: Alunos 1:N Empréstimos e Livros 1:N Empréstimos.
- SQL: CREATE DATABASE/TABLE (no arquivo SQL), INSERT, SELECT, UPDATE e DELETE (nas páginas PHP).
- JOIN: emprestimos.php une emprestimos, alunos e livros.
- PDO: config.php.
- CRUD seguro: operações por formulários POST, consultas preparadas, validação, escape de saída e confirmação de exclusão.
- Risco: SQL Injection; mitigação com PDO Prepared Statements.
- Restauração: importar database/biblioteca.sql no phpMyAdmin.

OBSERVAÇÃO
Este projeto é didático e foi pensado para rodar localmente no XAMPP. O modelo considera um exemplar cadastrado por livro. Para uso real, seriam necessários controles adicionais, autenticação, permissões e política de backup.
