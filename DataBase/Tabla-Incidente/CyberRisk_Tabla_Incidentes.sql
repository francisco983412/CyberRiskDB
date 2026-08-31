/*
============================================================
Proyecto: CyberRiskDB
Tabla: Incidentes

Objetivo:
Registrar eventos relacionados con la seguridad de la
información que puedan afectar los activos o procesos
de la organización.

Un incidente puede involucrar múltiples personas y
múltiples activos. Estas relaciones serán implementadas
posteriormente mediante tablas relacionadas.

============================================================
*/

CREATE TABLE Incidentes
(
    IncidenteID INT IDENTITY(1,1) PRIMARY KEY,

    Titulo VARCHAR(200) NOT NULL,

    Descripcion VARCHAR(1000),

    TipoIncidente VARCHAR(100) NOT NULL,

    Severidad VARCHAR(20) NOT NULL,

    FechaDeteccion DATETIME NOT NULL,

    Estado VARCHAR(30) NOT NULL DEFAULT 'Abierto',

    FechaCierre DATETIME NULL,

    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
);
GO

/*
============================================================
DATOS DE PRUEBA
============================================================

Estos incidentes son ficticios y representan diferentes
situaciones de seguridad que podrían presentarse dentro
de una organización.

Posteriormente estos incidentes serán relacionados con
personas y activos mediante tablas intermedias.

============================================================
*/

INSERT INTO Incidentes
(
    Titulo,
    Descripcion,
    TipoIncidente,
    Severidad,
    FechaDeteccion,
    Estado,
    FechaCierre
)
VALUES
(
    'Intento de phishing dirigido',
    'Se detectó un correo fraudulento enviado a un empleado con la intención de obtener sus credenciales corporativas.',
    'Phishing',
    'Alta',
    '2026-08-10 09:15:00',
    'Cerrado',
    '2026-08-10 15:40:00'
),

(
    'Detección de malware en laptop',
    'Se identificó actividad sospechosa asociada a malware en un equipo utilizado por el departamento de Finanzas.',
    'Malware',
    'Alta',
    '2026-08-12 11:30:00',
    'En investigación',
    NULL
),

(
    'Intentos de acceso no autorizado',
    'Se detectaron múltiples intentos fallidos de autenticación contra un servicio corporativo.',
    'Acceso no autorizado',
    'Media',
    '2026-08-15 02:45:00',
    'Cerrado',
    '2026-08-15 08:20:00'
),

(
    'Actividad sospechosa en base de datos',
    'Se identificaron consultas inusuales realizadas sobre información almacenada en una base de datos corporativa.',
    'Actividad sospechosa',
    'Critica',
    '2026-08-18 14:10:00',
    'En investigación',
    NULL
),

(
    'Intento de explotación del firewall',
    'Se detectaron múltiples conexiones provenientes de una dirección externa intentando acceder a servicios restringidos.',
    'Intento de intrusión',
    'Critica',
    '2026-08-20 22:35:00',
    'Cerrado',
    '2026-08-21 03:15:00'
),

(
    'Cuenta corporativa comprometida',
    'Se detectó acceso anómalo a una cuenta corporativa desde una ubicación no habitual.',
    'Compromiso de cuenta',
    'Alta',
    '2026-08-23 08:50:00',
    'Abierto',
    NULL
);
GO

SELECT *
FROM Incidentes;

SELECT *
FROM Incidentes
WHERE Estado <> 'Cerrado';