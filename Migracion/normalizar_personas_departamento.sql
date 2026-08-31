USE CyberRiskDB

/*
============================================================
Proyecto: CyberRiskDB
Migración: 001
Nombre: Normalización de Personas - Departamento

Objetivo:
Modificar la tabla Personas para utilizar una relación
con la tabla Departamentos mediante una clave foránea.

Antes:
Personas.Departamento -> VARCHAR

Después:
Personas.DepartamentoID -> INT + FOREIGN KEY

La información existente será conservada durante el proceso.

============================================================
*/

/*============================================================
               ALTERACION DE CAMPO DE TABLA PERSONA

   Agregamos el campo Departamento para tener una mejor 
   estructuracion del manejo de los tipos de datos y rendimiento.
 ============================================================

*/          
ALTER TABLE Personas
ADD DepartamentoID INT;
GO

/*============================================================
                       UPDATE 
 ============================================================

*/  
UPDATE P
SET P.DepartamentoID = D.DepartamentoID
FROM Personas AS P
INNER JOIN Departamentos AS D
    ON P.Departamento = D.Nombre;
GO

/*============================================================
                       SELECT
	Este select esta con los nuevos cambios ya aplicados
 ============================================================

*/  


SELECT
    P.PersonaID,
    P.Nombre,
    P.Apellido,
    P.Departamento,
    P.DepartamentoID,
    D.Nombre AS DepartamentoRelacionado
FROM Personas AS P
LEFT JOIN Departamentos AS D
    ON P.DepartamentoID = D.DepartamentoID;


	/*
============================================================
CREACIÓN DE CLAVE FORÁNEA
============================================================

Establecemos una relación entre Personas y Departamentos.

Personas.DepartamentoID
        ↓
Departamentos.DepartamentoID

Esto garantiza la integridad referencial de los datos.
============================================================
*/

ALTER TABLE Personas
ADD CONSTRAINT FK_Personas_Departamentos
FOREIGN KEY (DepartamentoID)
REFERENCES Departamentos(DepartamentoID);
GO

/*
============================================================
ELIMINACIÓN DE COLUMNA ANTIGUA
============================================================

La columna Departamento ya no es necesaria porque la
información ahora se obtiene mediante la relación:

Personas.DepartamentoID
        ↓
Departamentos.DepartamentoID

La eliminación se realiza después de comprobar que los
datos fueron migrados correctamente.
============================================================
*/

ALTER TABLE Personas
DROP COLUMN Departamento;
GO

SELECT *
FROM Personas;

SELECT
    P.PersonaID,
    P.Nombre,
    P.Apellido,
    D.Nombre AS Departamento
FROM Personas AS P
INNER JOIN Departamentos AS D
    ON P.DepartamentoID = D.DepartamentoID;