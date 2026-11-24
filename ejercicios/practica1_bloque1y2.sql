-- 1.1 ELIMINAMOS LA BASE DE DATOS instituot SI EXISTE
	
drop database if exists instituto;

-- 1.2 Y 1.3 CREAMOS LA BASE DE DATOS INSTITUTO Y LA SELECCIONAMOS

create database instituto;
use instituto;

-- 2.1 CREAMOS LA TABLA Y SUS RESTRICCIONES

CREATE TABLE profesores (
    DNI CHAR(9) PRIMARY KEY,
    Nombre VARCHAR(40) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15) NOT NULL
);

-- 2.2 CREAMOS LA TABLA MODULO

CREATE TABLE modulos (
    Codigo VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(40) NOT NULL,
    Curso VARCHAR(10) NOT NULL,
    DNI_profesor CHAR(9),

    CONSTRAINT dni_profesor_fk
        FOREIGN KEY (DNI_profesor)
        REFERENCES profesores(DNI)
);

-- 2.3 CREAMOS LA TABLA ALUMNOS

CREATE TABLE alumnos (
    N_exp VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(40) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Fecha_Nac DATE NOT NULL,
    N_exp_delegado VARCHAR(10),
    Grupo VARCHAR(10) NOT NULL,

    CONSTRAINT alumno_delegado_fk
        FOREIGN KEY (N_exp_delegado)
        REFERENCES alumnos(N_exp)
);

-- 2.4 CREAMOS LA TABLA MATRICULACIONES


CREATE TABLE matriculaciones (
    N_exp_alumno VARCHAR(10),
    Codigo_modulo VARCHAR(10),

    PRIMARY KEY (N_exp_alumno, Codigo_modulo),

    CONSTRAINT matriculaciones_alumno_fk
        FOREIGN KEY (N_exp_alumno)
        REFERENCES alumnos(N_exp),

    CONSTRAINT matriculaciones_modulo_fk
        FOREIGN KEY (Codigo_modulo)
        REFERENCES modulos(Codigo)
);

-- 3.1 ELIMINACION DE LA CLAVE FORÁNEA
ALTER TABLE modulos
DROP FOREIGN KEY dni_profesor_fk;

-- 3.2 ELIMINACION DE LA CLAVE FORANEA QUE REFERENCIA A MODULOS

ALTER TABLE matriculaciones
DROP FOREIGN KEY matriculaciones_modulo_fk;

-- 3.3 ELIMINACION DE LA CLAVE PRIMARIA DE MODULOS

ALTER TABLE modulos
DROP PRIMARY KEY;

-- 3.4 MODIFICACION DEL TIPO DE DATO DE CODIGO

ALTER TABLE modulos
MODIFY Codigo INT(4) ZEROFILL;

-- 3.5 REDEFINICION DE LA CLAVE PRIMARIA

ALTER TABLE modulos
ADD PRIMARY KEY (Codigo);

-- 3.6 RECREACION DE LA CLAVE FORANEA DE PROFESORES

ALTER TABLE modulos
ADD CONSTRAINT dni_profesor_fk
FOREIGN KEY (DNI_profesor)
REFERENCES profesores(DNI);

-- 3.7 MODIFICACION DEL TIPO DE DATO EN MATRICULACIONES

ALTER TABLE matriculaciones
MODIFY Codigo_modulo INT(4) ZEROFILL;

-- 3.8 RECREACION DE LA CLAVE FORANEA DE MATRICULACIONES

ALTER TABLE matriculaciones
ADD CONSTRAINT matriculaciones_modulo_fk
FOREIGN KEY (Codigo_modulo)
REFERENCES modulos(Codigo);



-- *************** BLOQUE 2 **************** 


-- 1.1 borrado previo de la base de datos

DROP DATABASE IF EXISTS ejemplos_alter;

-- 1.2 Y 1.3 creacion de la base de datos y seleccion

CREATE DATABASE ejemplos_alter;
USE ejemplos_alter;

-- 2.1 creacion de la tabla incial usuario

 CREATE TABLE usuario (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_de_usuario VARCHAR(25),
    rol ENUM('Estudiante', 'Profesor') NOT NULL
);


-- 3.1 Modificación del tipo y restricción
ALTER TABLE usuario
MODIFY COLUMN nombre_de_usuario VARCHAR(50) NOT NULL;

-- 3.2 Renombrado de la columna
ALTER TABLE usuario
CHANGE COLUMN nombre_de_usuario nombre VARCHAR(50) NOT NULL;

-- 4.1 Asignación de valor por defecto
ALTER TABLE usuario
ALTER COLUMN rol SET DEFAULT 'Profesor';

-- 4.2 Eliminación del valor por defecto
ALTER TABLE usuario
ALTER COLUMN rol DROP DEFAULT;

-- 5.1 Añadir fecha de nacimiento
ALTER TABLE usuario
ADD COLUMN fecha_nacimiento DATE NOT NULL;

-- 5.2 Añadir primer apellido
ALTER TABLE usuario
ADD COLUMN apellido1 VARCHAR(50) AFTER nombre;

-- 5.3 Añadir segundo apellido
ALTER TABLE usuario
ADD COLUMN apellido2 VARCHAR(50) AFTER apellido1;

-- 6.1 Eliminar fecha de nacimiento
ALTER TABLE usuario
DROP COLUMN fecha_nacimiento;

-- 6.2 Consultar estructura de la tabla
DESCRIBE usuario;

-- 6.3 Mostrar las tablas existentes
SHOW TABLES;

-- 6.4 Mostrar la sentencia de creación
SHOW CREATE TABLE usuario;





 
	



