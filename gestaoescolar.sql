# Banco de Dados Escolar Mais Completo

CREATE DATABASE GestaoEscolar;
USE GestaoEscolar;

# 1-Tabela de Setores

CREATE TABLE Setores (
    id_setor INT PRIMARY KEY AUTO_INCREMENT,
    nome_setor VARCHAR(50) NOT NULL
);

# Inserindo Dados Na Tabela Setores

INSERT INTO Setores (nome_setor) VALUES
('Direção'),
('Pedagógico'),
('Administrativo'),
('Operacional'),
('Cozinha'),
('Segurança'),
('Limpeza'),
('Tecnologia da Informação');

# 2- Tabela de Cargos

CREATE TABLE Cargos (
    id_cargo INT PRIMARY KEY AUTO_INCREMENT,
    nome_cargo VARCHAR(50) NOT NULL,
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES Setores(id_setor)
);

# Inserindo Dados Na Tabela Cargos

INSERT INTO Cargos (nome_cargo, id_setor) VALUES
('Diretor',1),
('Vice Diretor',1),
('Coordenador Pedagógico',2),
('Professor',2),
('Secretária',3),
('Auxiliar Administrativo',3),
('Zelador',4),
('Porteiro',6),
('Merendeira',5),
('Auxiliar de Limpeza',7),
('Analista de TI',8);

# 3- Tabela Funcionários

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf CHAR(11),
    telefone VARCHAR(15),
    email VARCHAR(100),
    id_cargo INT,
    data_admissao DATE,
    salario DECIMAL(10,2),
    FOREIGN KEY (id_cargo) REFERENCES Cargos(id_cargo)
);

# Inserindo Dados Na Tabela Funcionario

INSERT INTO Funcionarios (nome, cpf, telefone, email, id_cargo, data_admissao, salario) VALUES
('Carlos Silva','12345678901','11999999901','carlos@escola.com',1,'2018-02-10',8500),
('Mariana Souza','12345678902','11999999902','mariana@escola.com',3,'2019-03-15',6500),
('João Pereira','12345678903','11999999903','joao@escola.com',4,'2020-01-10',4200),
('Fernanda Costa','12345678904','11999999904','fernanda@escola.com',5,'2021-04-01',3000),
('Pedro Santos','12345678905','11999999905','pedro@escola.com',8,'2022-06-10',2200);

# 4-Tabela Salas

CREATE TABLE Salas (
    id_sala INT PRIMARY KEY AUTO_INCREMENT,
    numero_sala VARCHAR(10),
    capacidade_maxima INT
);

# Inserindo Dados Na Tabela Salas

INSERT INTO Salas (numero_sala, capacidade_maxima) VALUES
('Sala 101',30),
('Sala 102',30),
('Sala 201',35),
('Laboratorio',25);

# 5-Tabela Turmas

CREATE TABLE Turmas (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome_turma VARCHAR(20),
    ano_letivo INT,
    id_sala INT,
    FOREIGN KEY (id_sala) REFERENCES Salas(id_sala)
);

# Inserino Dados Na Tabela Turma

INSERT INTO Turmas (nome_turma, ano_letivo, id_sala) VALUES
('1 Ano A',2025,1),
('2 Ano A',2025,2),
('3 Ano A',2025,3);

# 6-Tabela Disciplinas

CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(50)
);

# Inserindo Dados Na Tabela Diciplinas

INSERT INTO Disciplinas (nome_disciplina) VALUES
('Matematica'),
('Portugues'),
('Historia'),
('Geografia'),
('Ciencias'),
('Informatica');

# 7-Tabela Professores por Disciplina

CREATE TABLE Professor_Disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    id_disciplina INT,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

# Inserindo Dados Na Tabela Professores por Disciplina

# 8-Tabela Alunos

CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE,
    cpf CHAR(11),
    telefone VARCHAR(15),
    endereco VARCHAR(200),
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma)
);

# Iserindo Dados Na Tabelas Alunos

INSERT INTO Alunos (nome, data_nascimento, cpf, telefone, endereco, id_turma) VALUES
('Lucas Oliveira','2010-05-10','11111111111','11988888801','Rua A',1),
('Ana Martins','2011-03-15','11111111112','11988888802','Rua B',1),
('Rafael Gomes','2010-07-20','11111111113','11988888803','Rua C',2),
('Juliana Alves','2011-09-01','11111111114','11988888804','Rua D',2),
('Gabriel Costa','2010-11-11','11111111115','11988888805','Rua E',3);

# 9-Tabela Responsáveis pelos alunos

CREATE TABLE Responsaveis (
    id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    parentesco VARCHAR(30)
);

# Inserindo Dados Na Tabelas Responsável pelos alunos

# 10-Tabela Matrículas

CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma)
);

# Inserindo Dados Na Tabelas Matrículas

# 11-Tabela Notas

CREATE TABLE Notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_disciplina INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

# Inserindo Dados Na Tabelas

/* Exemplos de consultas Alunos e suas turmas */



SELECT 
Alunos.nome,
Turmas.nome_turma
FROM Alunos
JOIN Turmas ON Alunos.id_turma = Turmas.id_turma;

/* Exemplos de consultas Funcionários e cargos */

SELECT 
Funcionarios.nome,
Cargos.nome_cargo
FROM Funcionarios
JOIN Cargos ON Funcionarios.id_cargo = Cargos.id_cargo;


/* Listar todos os alunos e suas turmas */

SELECT 
alunos.nome AS aluno,
turmas.nome_turma,
turmas.ano_letivo
FROM alunos
JOIN turmas
ON alunos.id_turma = turmas.id_turma;

/*Listar funcionários e seus cargos */

SELECT 
funcionarios.nome,
cargos.nome_cargo
FROM funcionarios
JOIN cargos
ON funcionarios.id_cargo = cargos.id_cargo;

/* Lista Funcionários por setor */

SELECT 
funcionarios.nome,
cargos.nome_cargo,
setores.nome_setor
FROM funcionarios
JOIN cargos 
ON funcionarios.id_cargo = cargos.id_cargo
JOIN setores 
ON cargos.id_setor = setores.id_setor;

/* Lista Quantidade de alunos por turma */

SELECT 
turmas.nome_turma,
COUNT(alunos.id_aluno) AS total_alunos
FROM turmas
LEFT JOIN alunos
ON turmas.id_turma = alunos.id_turma
GROUP BY turmas.nome_turma;