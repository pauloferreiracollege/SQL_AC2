CREATE DATABASE ac2_biblioteca

USE ac2_biblioteca

CREATE TABLE Livro(
Nome		VARCHAR(200) NOT NULL,
Copia		INT,
StatusLivro VARCHAR(10)  NOT NULL,
CONSTRAINT PK_Livro PRIMARY KEY (Nome, Copia)
)

CREATE TABLE Cliente(
Id		 INT		  PRIMARY KEY,
Nome	 VARCHAR(200) NOT NULL,
Telefone INT          NOT NULL
)

DROP TABLE 
CREATE TABLE Emprestimo(
Id				      INT IDENTITY PRIMARY KEY,
NomeLivro			  VARCHAR(200) NOT NULL,
CopiaLivro			  INT		   NOT NULL,
IdCliente			  INT          NOT NULL,
DataEmprestimo		  VARCHAR(20)  NOT NULL,
DataDevolucaoProposta VARCHAR(20)  NOT NULL,
DataDevolucaoEfetiva  VARCHAR(20)  NOT NULL,
Multa				  DECIMAL,
)

ALTER TABLE Emprestimo
ADD CONSTRAINT FK_Livro
	FOREIGN KEY (NomeLivro)
	REFERENCES Livro(Nome)

ALTER TABLE Emprestimo
ADD CONSTRAINT FK_Copia
	FOREIGN KEY (NomeLivro)
	REFERENCES Livro(Nome)

ALTER TABLE Emprestimo
ADD CONSTRAINT FK_Id_Cliente
	FOREIGN KEY (IdCliente)
	REFERENCES Cliente(Id)

SELECT * FROM Livro