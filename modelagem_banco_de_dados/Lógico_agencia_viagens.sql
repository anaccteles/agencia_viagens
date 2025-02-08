/* Lógico_agencia_viagens: */

CREATE TABLE Usuário (
    id_usuario INTEGER PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR,
    senha VARCHAR,
    telefone VARCHAR
);

CREATE TABLE Destino (
    id_destino INTEGER PRIMARY KEY,
    descricao VARCHAR,
    nome VARCHAR,
    imagem VARCHAR
);

CREATE TABLE Pacote (
    id_pacote INTEGER PRIMARY KEY,
    nome VARCHAR,
    descricao VARCHAR,
    preco DECIMAL,
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Reserva (
    id_reserva INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    id_pacote INTEGER,
    data_reserva DATE,
    status VARCHAR,
    fk_Usuário_id_usuario INTEGER,
    fk_Pacote_id_pacote INTEGER
);

CREATE TABLE Contato (
    id_contato INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    mensagem VARCHAR,
    data_contato DATE,
    fk_Usuário_id_usuario INTEGER
);

CREATE TABLE Tem (
    fk_Destino_id_destino INTEGER,
    fk_Pacote_id_pacote INTEGER
);
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Usuário_id_usuario)
    REFERENCES Usuário (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_3
    FOREIGN KEY (fk_Pacote_id_pacote)
    REFERENCES Pacote (id_pacote)
    ON DELETE RESTRICT;
 
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_2
    FOREIGN KEY (fk_Usuário_id_usuario)
    REFERENCES Usuário (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Destino_id_destino)
    REFERENCES Destino (id_destino)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Pacote_id_pacote)
    REFERENCES Pacote (id_pacote)
    ON DELETE RESTRICT;