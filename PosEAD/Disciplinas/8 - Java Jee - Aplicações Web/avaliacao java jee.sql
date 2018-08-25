INSERT INTO PACIENTES (nome, convenio, datanasc, telefone, endereco)
VALUES ('Cezar','Cassi','14/10/1988','11-95070-0235','Rua São Bento, 236, SP')

SELECT * FROM PACIENTES



INSERT INTO MEDICAMENTOS (descricao, aplicacao) VALUES ('Pantoprazol', 'comprimido');
INSERT INTO MEDICAMENTOS (descricao, aplicacao) VALUES ('Imosec', 'comprimido');
INSERT INTO MEDICAMENTOS (descricao, aplicacao) VALUES ('Benzetacil', 'injeção');
INSERT INTO MEDICAMENTOS (descricao, aplicacao) VALUES ('Doralgina', 'gotas');

SELECT * FROM MEDICAMENTOS



INSERT INTO TRATAMENTOS (descricao, amb, preco) VALUES ('Teste e adaptação','50010140',149.90);
INSERT INTO TRATAMENTOS (descricao, amb, preco) VALUES ('Amputação bilateral','25060023',180.00);
INSERT INTO TRATAMENTOS (descricao, amb, preco) VALUES ('Atendimento fisiátrico','25040030',89.90);
INSERT INTO TRATAMENTOS (descricao, amb, preco) VALUES ('Sessão nutricionista','10910',69.90);

SELECT * FROM TRATAMENTOS
desc tratamentos