create database if not exists university;
use university;

CREATE TABLE estados_cursos (
    id_estado_curso INT NOT NULL PRIMARY KEY,
    estado VARCHAR(255) UNIQUE
);

CREATE TABLE estado_docente (
    id_estado_docente INT NOT NULL PRIMARY KEY,
    estado VARCHAR(255) UNIQUE
);

CREATE TABLE dias (
    id_dia INT NOT NULL PRIMARY KEY,
    dia VARCHAR(255) UNIQUE
);

CREATE TABLE horas (
    id_hora INT NOT NULL PRIMARY KEY,
    hora_inicio TIME,
    hora_final TIME
);

CREATE TABLE aulas (
    id_aula INT NOT NULL PRIMARY KEY,
    aula VARCHAR(255) UNIQUE
);

CREATE TABLE materias (
    id_materia INT NOT NULL PRIMARY KEY,
    materia VARCHAR(255) UNIQUE
);

CREATE TABLE estudiantes (
    id_estudiante INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    documento VARCHAR(255) UNIQUE,
    telefono VARCHAR(255) UNIQUE,
    correo VARCHAR(255) UNIQUE
);

CREATE TABLE docentes (
    id_docente INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    documento VARCHAR(255) UNIQUE,
    telefono VARCHAR(255) UNIQUE,
    correo VARCHAR(255) UNIQUE,
    id_estado_docente INT NOT NULL,
    FOREIGN KEY (id_estado_docente) REFERENCES estado_docente(id_estado_docente)
);

CREATE TABLE cursos (
    id_curso INT NOT NULL PRIMARY KEY,
    curso VARCHAR(255) UNIQUE,
    descripcion VARCHAR(255),
    id_estado_curso INT NOT NULL,
    FOREIGN KEY (id_estado_curso) REFERENCES estados_cursos(id_estado_curso)
);

CREATE TABLE horarios (
    id_horario INT NOT NULL PRIMARY KEY,
    id_dia INT NOT NULL,
    id_hora INT NOT NULL,
    FOREIGN KEY (id_dia) REFERENCES dias(id_dia),
    FOREIGN KEY (id_hora) REFERENCES horas(id_hora)
);

CREATE TABLE docentes_cursos (
    id_docente INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE cursos_materias (
    id_curso_materia INT NOT NULL PRIMARY KEY,
    id_materia INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE clases (
    id_clase INT NOT NULL PRIMARY KEY,
    id_curso_materia INT NOT NULL,
    id_horario INT NOT NULL,
    id_aula INT NOT NULL,
    FOREIGN KEY (id_curso_materia) REFERENCES cursos_materias(id_curso_materia),
    FOREIGN KEY (id_horario) REFERENCES horarios(id_horario),
    FOREIGN KEY (id_aula) REFERENCES aulas(id_aula)
);

CREATE TABLE estudiantes_cursos (
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE materias_docentes (
    id_docente INT NOT NULL,
    id_materia INT NOT NULL,
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);
