CREATE TABLE course
(
    acronym   VARCHAR(10) PRIMARY KEY,
    name VARCHAR(511) NOT NULL
);

CREATE TABLE credential(
    id       UUID DEFAULT RANDOM_UUID() PRIMARY KEY,
    username VARCHAR(511) NOT NULL,
    password VARCHAR(511) NOT NULL
);


-- CREATE TABLE course
-- (
--     id   VARCHAR(8) PRIMARY KEY,
--     name VARCHAR(511) NOT NULL,
-- );


CREATE TABLE student
(
    id             UUID DEFAULT RANDOM_UUID() PRIMARY KEY,
    student_number INT          NOT NULL,
    name           VARCHAR(511) NOT NULL,
    email          VARCHAR(511) NOT NULL,
    course_id      VARCHAR(8)   NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course (acronym)
);


CREATE TABLE project
(
    id                  UUID DEFAULT RANDOM_UUID() PRIMARY KEY,
    theme               VARCHAR(511) NOT NULL,
    general_objective   VARCHAR(511) NOT NULL,
    specific_objectives VARCHAR(511) NOT NULL,
    problem             VARCHAR(511) NOT NULL,
    time_submitted      TIMESTAMP    NOT NULL,
    time_graded         TIMESTAMP,
    comment             VARCHAR(511),
    student_id          UUID         NOT NULL,
    state               ENUM('SUBMITTED', 'APPROVED', 'REJECTED'),
    FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE
);

INSERT INTO course (acronym, name)
VALUES ('LCA', 'Licenciatura em Contabilidade e Auditoria'),
       ('LEA', 'Licenciatura em Engenharia Ambiental'),
       ('LECT', 'Licenciatura em Engenharia Civil e de Transportes'),
       ('LECC', 'Licenciatura em Engenharia e Ciência dos Computadores'),
       ('LEMEC', 'Licenciatura em Engenharia Electromecânica'),
       ('LEET', 'Licenciatura em Engenharia Electrónica e de Telecomunicações'),
       ('LEE', 'Licenciatura em Engenharia Electrotécnica'),
       ('LEF', 'Licenciatura em Engenharia Ferroviária'),
       ('LEIT', 'Licenciatura em Engenharia Informática e de Telecomunicações'),
       ('LEMT', 'Licenciatura em Engenharia Mecânica e de Transportes'),
       ('LGBS', 'Licenciatura em Gestão Bancária e de Seguros'),
       ('LGF', 'Licenciatura em Gestão e Finanças');

INSERT INTO student (name, student_number, email, course_id)
VALUES
    ('João Silva', 1001, 'joao.silva@example.com', 'LECC'),
    ('Maria Costa', 1002, 'maria.costa@example.com', 'LCA'),
    ('Carlos Mendes', 1003, 'carlos.mendes@example.com', 'LEA'),
    ('Ana Rodrigues', 1004, 'ana.rodrigues@example.com', 'LECT'),
    ('Pedro Oliveira', 1005, 'pedro.oliveira@example.com', 'LEMEC'),
    ('Luisa Ferreira', 1006, 'luisa.ferreira@example.com', 'LEET'),
    ('Rui Santos', 1007, 'rui.santos@example.com', 'LEE'),
    ('Teresa Almeida', 1008, 'teresa.almeida@example.com', 'LEF'),
    ('Marta Sousa', 1009, 'marta.sousa@example.com', 'LEIT'),
    ('Nuno Gomes', 1010, 'nuno.gomes@example.com', 'LGBS');
