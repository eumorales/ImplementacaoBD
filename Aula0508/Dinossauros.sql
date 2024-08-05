USE DINOSSAUROS;

CREATE TABLE Grupo (
    Nome VARCHAR(50) UNIQUE,
    Id INT PRIMARY KEY
);

CREATE TABLE Era (
    Nome VARCHAR(50) UNIQUE,
    anoInicio INT,
    anoFim INT,
    Id INT PRIMARY KEY
);

CREATE TABLE Pais (
    Nome VARCHAR(50) UNIQUE,
    Id INT PRIMARY KEY
);

CREATE TABLE Descobridor (
    Nome VARCHAR(50),
    Id INT PRIMARY KEY
);

CREATE TABLE Dinossauro (
    Nome VARCHAR(50) UNIQUE,
    Toneladas INT,
    Id INT PRIMARY KEY,
    fk_Grupo_Id INT,
    fk_Era_Id INT,
    fk_Pais_Id INT,
    CONSTRAINT FK_Dinossauro_Grupo FOREIGN KEY (fk_Grupo_Id) REFERENCES Grupo (Id) ON DELETE RESTRICT,
    CONSTRAINT FK_Dinossauro_Era FOREIGN KEY (fk_Era_Id) REFERENCES Era (Id) ON DELETE RESTRICT,
    CONSTRAINT FK_Dinossauro_Pais FOREIGN KEY (fk_Pais_Id) REFERENCES Pais (Id) ON DELETE CASCADE
);

CREATE TABLE Dinossauro_Descobridor_Descoberto (
    fk_Descobridor_Id INT,
    fk_Dinossauro_Id INT,
    AnoDesc INT,
    CONSTRAINT FK_Dinossauro_Descobridor FOREIGN KEY (fk_Descobridor_Id) REFERENCES Descobridor (Id),
    CONSTRAINT FK_Dinossauro_Descoberto FOREIGN KEY (fk_Dinossauro_Id) REFERENCES Dinossauro (Id)
);

/* Popular Grupo */

INSERT INTO Grupo (Nome, Id) VALUES 
('Anquilossauros', 1),
('Ceratopsídeos', 2),
('Estegossauros', 3),
('Terópodes', 4);

/* Popular Era */

INSERT INTO Era (Nome, anoInicio, anoFim, Id) VALUES 
('Cretáceo', 145, 66, 1),
('Jurássico', 201, 145, 2);

/* Popular Pais */

INSERT INTO Pais (Nome, Id) VALUES 
('Mongólia', 1),
('Canadá', 2),
('Tanzânia', 3),
('China', 4),
('América do Norte', 5),
('USA', 6);

/* Popular Descobridor */

INSERT INTO Descobridor (Nome, Id) VALUES 
('Maryanska', 1),
('John Bell Hatcher', 2),
('Cientistas Alemães', 3),
('Museu Americano de História Natural', 4),
('Othniel Charles Marsh', 5),
('Barnum Brown', 6);

/* Popular Dinossauro */

INSERT INTO Dinossauro (Nome, Toneladas, Id, fk_Grupo_Id, fk_Era_Id, fk_Pais_Id) VALUES 
('Saichania', 4, 1, 1, 1, 1),
('Triceratops', 6, 2, 2, 1, 2),
('Kentrossauro', 2, 3, 3, 2, 3),
('Pinacosauro', 6, 4, 1, 1, 4),
('Alossauro', 3, 5, 4, 2, 5),
('Torossauro', 8, 6, 2, 1, 6),
('Anquilossauro', 8, 7, 1, 1, 5);

/* Popular Dinossauro_Descobridor_Descoberto*/

INSERT INTO Dinossauro_Descobridor_Descoberto (fk_Descobridor_Id, fk_Dinossauro_Id, AnoDesc) VALUES 
(1, 1, 1977),
(2, 2, 1887),
(3, 3, 1909),
(4, 4, 1999),
(5, 5, 1877),
(2, 6, 1891),
(6, 7, 1906);







