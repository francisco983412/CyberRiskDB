/*
============================================================
Proyecto: CyberRiskDB
Tabla: IncidentePersona

Objetivo:
Establecer la relación entre los incidentes de seguridad
y las personas involucradas en ellos.

Relación:
Personas ←→ Incidentes

Esta tabla funciona como entidad intermedia para manejar
una relación muchos a muchos.

El campo Rol permite identificar la participación de la
persona dentro del incidente.

Ejemplos de roles:
- Víctima
- Reportante
- Analista
- Responsable
- Testigo

============================================================
*/

CREATE TABLE IncidentePersona
(
    IncidenteID INT NOT NULL,

    PersonaID INT NOT NULL,

    Rol VARCHAR(50) NOT NULL,

    CONSTRAINT PK_IncidentePersona
        PRIMARY KEY (IncidenteID, PersonaID),

    CONSTRAINT FK_IncidentePersona_Incidente
        FOREIGN KEY (IncidenteID)
        REFERENCES Incidentes(IncidenteID),

    CONSTRAINT FK_IncidentePersona_Persona
        FOREIGN KEY (PersonaID)
        REFERENCES Personas(PersonaID)
);
GO

/*
============================================================
DATOS DE PRUEBA
============================================================

Relacionamos los incidentes con las personas involucradas.

El campo Rol indica la participación de cada persona dentro
del incidente.

============================================================
*/

INSERT INTO IncidentePersona
(
    IncidenteID,
    PersonaID,
    Rol
)
VALUES
(1, 4, 'Víctima'),
(1, 1, 'Analista'),

(2, 4, 'Persona afectada'),
(2, 1, 'Analista'),

(3, 3, 'Persona afectada'),
(3, 1, 'Analista'),

(4, 5, 'Responsable'),
(4, 1, 'Analista'),

(5, 1, 'Analista'),
(5, 2, 'Analista'),

(6, 3, 'Persona afectada'),
(6, 2, 'Analista');
GO


SELECT *
FROM IncidentePersona;

--Vista 
SELECT
    I.Titulo AS Incidente,
    P.Nombre + ' ' + P.Apellido AS Persona,
    IP.Rol
FROM IncidentePersona AS IP
INNER JOIN Incidentes AS I
    ON IP.IncidenteID = I.IncidenteID
INNER JOIN Personas AS P
    ON IP.PersonaID = P.PersonaID
ORDER BY I.IncidenteID;