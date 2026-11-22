-- Banco de dados do Sistema de Biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE biblioteca;

CREATE TABLE IF NOT EXISTS alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    status ENUM('disponivel', 'emprestado') NOT NULL DEFAULT 'disponivel',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE DEFAULT NULL,
    status ENUM('aberto', 'devolvido') NOT NULL DEFAULT 'aberto',
    CONSTRAINT fk_emprestimo_aluno FOREIGN KEY (id_aluno)
        REFERENCES alunos(id_aluno) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_emprestimo_livro FOREIGN KEY (id_livro)
        REFERENCES livros(id_livro) ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_emprestimos_status (status),
    INDEX idx_emprestimos_aluno (id_aluno),
    INDEX idx_emprestimos_livro (id_livro)
) ENGINE=InnoDB;

-- Dados fictícios para testar (opcional)
INSERT INTO alunos (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com');

INSERT INTO livros (titulo, autor) VALUES
('Dom Casmurro', 'Machado de Assis'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry'),
('A Hora da Estrela', 'Clarice Lispector');
