CREATE DATABASE ac2_esfiharia

USE ac2_esfiharia
DROP DATABASE ac2_esfiharia

CREATE TABLE Cliente(
Id INT,
Nome VARCHAR(200) NOT NULL,
Endereco VARCHAR(200),
CONSTRAINT PK_Cliente PRIMARY KEY (Id)
)

CREATE TABLE Telefone(
Id_Cliente INT, 
Numero VARCHAR(10) NOT NULL,
CONSTRAINT PK_IdCliente PRIMARY KEY (Id_Cliente, Numero),
CONSTRAINT FK_ClienteTelefone FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id)
)

CREATE TABLE Pedido(
Numero INT,
DataHora DATETIME NOT NULL,
Id_Cliente INT NOT NULL,
CONSTRAINT PK_Pedido PRIMARY KEY (Numero),
CONSTRAINT FK_ClientePedido FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id),
)

CREATE TABLE Produto(
Id INT,
Nome VARCHAR(150),
CONSTRAINT PK_Produto PRIMARY KEY (Id)
)

CREATE TABLE ItemPedido(
NumeroPedido INT,
IdProduto INT NOT NULL,
Qtde INT NOT NULL,
CONSTRAINT PK_ItemPedido PRIMARY KEY (NumeroPedido, IdProduto),
CONSTRAINT FK_NumeroPedido FOREIGN KEY (NumeroPedido) REFERENCES Pedido(Numero),
CONSTRAINT FK_IdProduto FOREIGN KEY (IdProduto) REFERENCES Produto(Id)
)

-- SELECTS DE TESTE 
SELECT * FROM Cliente
SELECT * FROM Telefone
SELECT * FROM Pedido
SELECT * FROM Produto
SELECT * FROM ItemPedido

-- INSERTS DE TESTE 
INSERT INTO Cliente VALUES (1,'José', 'Av. Três, numero 1')
INSERT INTO Cliente VALUES (2,'Maria', 'Av. Impar, nr 33, apto 12')

INSERT INTO Telefone VALUES (1,'9378-3259')
INSERT INTO Telefone VALUES (1,'8745-3452')

INSERT INTO Produto VALUES (1,'Calabresa')
INSERT INTO Produto VALUES (2,'Frango')
INSERT INTO Produto VALUES (3,'Brócolis')

INSERT INTO Pedido VALUES (1, GETDATE(), 1)
INSERT INTO Pedido VALUES (2, GETDATE(), 1)
INSERT INTO Pedido VALUES (3, GETDATE(), 2)

INSERT INTO ItemPedido VALUES (1, 1, 3)
INSERT INTO ItemPedido VALUES (2, 2, 2)

INSERT INTO ItemPedido VALUES (3, 1, 7)
INSERT INTO ItemPedido VALUES (3, 3, 4)

SELECT Cliente.Nome, Cliente.Endereco, Telefone.Numero, Pedido.Numero
FROM Cliente
INNER JOIN Telefone
ON Cliente.Id = Telefone.Id_Cliente 
INNER JOIN Pedido
ON Telefone.Id_Cliente = Pedido.Id_Cliente



