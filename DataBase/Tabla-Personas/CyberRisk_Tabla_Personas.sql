/*
============================================================
Proyecto: CyberRiskDB
Tipo: Sistema de gestión de riesgos e incidentes de seguridad
Tecnología: Microsoft SQL Server

Descripción:
CyberRiskDB es una base de datos desarrollada para centralizar
y relacionar información relacionada con la seguridad de una
organización.

El proyecto busca permitir el registro y análisis de:

- Incidentes de seguridad
- Personas involucradas
- Activos tecnológicos
- Evidencias
- Vulnerabilidades
- Acciones de respuesta
- Riesgos

Objetivo:
Crear una solución que permita analizar los incidentes de
seguridad y obtener información útil para la toma de decisiones.

Autor:
Francisco Concepción

============================================================
*/

/*
------------------------------------------------------------
1. CREACIÓN DE LA BASE DE DATOS
------------------------------------------------------------

Creamos la base de datos principal del proyecto.
Todas las tablas, relaciones, vistas y demás objetos que
desarrollemos posteriormente estarán dentro de CyberRiskDB.
*/

---Selects del Proyecto

SELECT * FROM Personas;
/*
============================================================
TABLA: Personas
============================================================

Propósito:
Almacenar las personas pertenecientes a la organización
que pueden estar relacionadas con eventos de seguridad.

Una persona puede participar en un incidente de diferentes
formas, por ejemplo:

- Víctima
- Reportante
- Analista
- Responsable
- Persona relacionada

La relación específica con un incidente será definida
posteriormente en el diseño del sistema.

============================================================
*/

CREATE TABLE Personas
(
    PersonaID INT IDENTITY(1,1) PRIMARY KEY,

    Nombre VARCHAR(100) NOT NULL,

    Apellido VARCHAR(100) NOT NULL,

    Correo VARCHAR(150) NOT NULL,

    Cargo VARCHAR(100),

    Departamento VARCHAR(100),

    Estado BIT NOT NULL DEFAULT 1
);
GO

/*
============================================================
INSERT: DATOS DE PRUEBA PARA LA TABLA PERSONAS
============================================================

Estos registros son ficticios y se utilizarán para probar
las relaciones, consultas y funcionalidades del proyecto.

Los datos representan diferentes perfiles dentro de una
organización y posteriormente podrán estar relacionados
con incidentes de seguridad.

============================================================
*/

INSERT INTO Personas
(
    Nombre,
    Apellido,
    Correo,
    Cargo,
    Departamento,
    Estado
)
VALUES
('Carlos', 'Martínez', 'carlos.martinez@empresa.local', 'Analista SOC', 'Seguridad', 1),

('Laura', 'Rodríguez', 'laura.rodriguez@empresa.local', 'Especialista de Seguridad', 'Seguridad', 1),

('Miguel', 'Hernández', 'miguel.hernandez@empresa.local', 'Administrador de Sistemas', 'TI', 1),

('Ana', 'Gómez', 'ana.gomez@empresa.local', 'Analista Financiera', 'Finanzas', 1),

('Daniel', 'Pérez', 'daniel.perez@empresa.local', 'Administrador de Bases de Datos', 'TI', 1),

('Sofía', 'Ramírez', 'sofia.ramirez@empresa.local', 'Analista de Recursos Humanos', 'RRHH', 1),

('José', 'Castillo', 'jose.castillo@empresa.local', 'Ingeniero de Redes', 'Infraestructura', 1),

('María', 'Torres', 'maria.torres@empresa.local', 'Gerente de Tecnología', 'TI', 1);
GO