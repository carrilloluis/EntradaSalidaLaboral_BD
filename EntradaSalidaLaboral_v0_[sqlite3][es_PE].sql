/*
@description Registro del horario de entrada/salida laboral 
@author Luis Carrillo Gutiérrez
@date Agosto, 2014
@version 0.0.2
*/

-- Departamento
DROP TABLE IF EXISTS [Área Laboral];
CREATE TABLE IF NOT EXISTS [Área Laboral] 
(
	[id] INTEGER UNSIGNED NOT NULL PRIMARY KEY,
	[código interno] CHAR(8) NOT NULL,
	[denominación] VARCHAR(255) NOT NULL
) WITHOUT RowId;

DROP TABLE IF EXISTS [Empleado];
CREATE TABLE IF NOT EXISTS [Empleado]
(
	[id] INTEGER UNSIGNED NOT NULL PRIMARY KEY, -- BIGINT
	[código de empleado] CHAR(16) NOT NULL,
	[nombre completo] VARCHAR(128) NOT NULL,
	[fecha de contratación] DATE NOT NULL,
	[salario] FLOAT NOT NULL,
	[deptId] INTEGER NOT NULL REFERENCES [Área Laboral](id)
) WITHOUT RowId;

DROP TABLE IF EXISTS [Registro de Tiempo Laboral];
CREATE TABLE IF NOT EXISTS [Registro de Tiempo Laboral]
(
	[id] INTEGER UNSIGNED NOT NULL PRIMARY KEY,
	[fecha de registro] DATETIME NOT NULL,
	[Entrada o Salida] CHAR(1) NOT NULL DEFAULT '0', -- BOOLEAN
	[id de empleado] INTEGER NOT NULL REFERENCES [Empleado](id)
) WITHOUT RowId;