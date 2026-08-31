/*
============================================================
Proyecto: CyberRiskDB
Tabla: Activos

Objetivo:
Registrar los activos tecnológicos de la organización
que pueden estar relacionados con riesgos e incidentes
de seguridad.

Un activo representa un recurso que posee valor para la
organización y que debe ser identificado para posteriormente
evaluar su exposición a riesgos.

Ejemplos:
- Servidores
- Computadoras
- Laptops
- Bases de datos
- Equipos de red
- Aplicaciones

Estado:
Versión inicial - En desarrollo
============================================================
*/

CREATE TABLE Activos
(
    ActivoID INT IDENTITY(1,1) PRIMARY KEY,

    Nombre VARCHAR(150) NOT NULL,

    TipoActivo VARCHAR(100) NOT NULL,

    Descripcion VARCHAR(500),

    Criticidad VARCHAR(20) NOT NULL,

    Ubicacion VARCHAR(150),

    Estado BIT NOT NULL DEFAULT 1,

    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
);
GO

/*
============================================================
DATOS DE PRUEBA
============================================================

Los siguientes registros representan activos ficticios de
la organización.

Se utilizan diferentes tipos y niveles de criticidad para
poder realizar posteriormente análisis de riesgos e
incidentes de seguridad.

============================================================
*/

INSERT INTO Activos
(
    Nombre,
    TipoActivo,
    Descripcion,
    Criticidad,
    Ubicacion,
    Estado
)
VALUES
(
    'SRV-DB-01',
    'Servidor',
    'Servidor principal de bases de datos corporativas',
    'Critica',
    'Data Center Principal',
    1
),

(
    'SRV-APP-01',
    'Servidor',
    'Servidor encargado de alojar aplicaciones internas',
    'Alta',
    'Data Center Principal',
    1
),

(
    'LAP-FIN-01',
    'Laptop',
    'Laptop asignada al departamento de Finanzas',
    'Alta',
    'Oficina de Finanzas',
    1
),

(
    'PC-RRHH-01',
    'Computadora',
    'Estación de trabajo utilizada por Recursos Humanos',
    'Media',
    'Oficina de RRHH',
    1
),

(
    'FW-01',
    'Firewall',
    'Firewall principal utilizado para controlar el tráfico de red',
    'Critica',
    'Data Center Principal',
    1
),

(
    'DB-CLIENTES',
    'Base de Datos',
    'Base de datos que almacena información de clientes',
    'Critica',
    'Data Center Principal',
    1
),

(
    'MAIL-01',
    'Servidor',
    'Servidor utilizado para los servicios de correo corporativo',
    'Alta',
    'Data Center Principal',
    1
),

(
    'APP-VENTAS',
    'Aplicación',
    'Aplicación utilizada para gestionar procesos de ventas',
    'Alta',
    'Área Comercial',
    1
);
GO


SELECT *
FROM Activos;