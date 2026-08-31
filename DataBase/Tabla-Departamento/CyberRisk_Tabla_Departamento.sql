--USE CyberRiskDB

/*
============================================================
TABLA: Departamentos
============================================================

Propósito:
Centralizar los departamentos de la organización.

Motivo:
Los departamentos no se almacenarán directamente como texto
en Personas. Esto evita duplicidad y permite aplicar integridad
referencial mediante una clave foránea.

============================================================
*/

CREATE TABLE Departamentos
(
    DepartamentoID INT IDENTITY(1,1) PRIMARY KEY,

    Nombre VARCHAR(100) NOT NULL UNIQUE
);
GO

/*
============================================================
                       INSERT 
============================================================
*/
INSERT INTO Departamentos (Nombre)
VALUES
('Seguridad'),
('TI'),
('Finanzas'),
('RRHH'),
('Infraestructura');
GO

/*
============================================================
                       SELECT
============================================================
*/
