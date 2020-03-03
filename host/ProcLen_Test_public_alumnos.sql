create table alumnos
(
    alumno_id  integer default nextval('public.alumno_id_seq'::regclass) not null
        constraint pk_alumnos
            primary key,
    nombre     varchar(50)                                               not null,
    apellido_1 varchar(100)                                              not null,
    apellido_2 varchar(100),
    correo     varchar(150)                                              not null
);

alter table alumnos
    owner to pladmin;

create unique index idx_ix_alumno_id_alumnos
    on alumnos (alumno_id);

INSERT INTO public.alumnos (alumno_id, nombre, apellido_1, apellido_2, correo) VALUES (1, 'Mario', 'Nieto', 'Ramiro', 'mnieto156@alumno.uned.es');
INSERT INTO public.alumnos (alumno_id, nombre, apellido_1, apellido_2, correo) VALUES (4, 'Anton', 'Pirulero', '', 'user223@alumno.uned.es');
INSERT INTO public.alumnos (alumno_id, nombre, apellido_1, apellido_2, correo) VALUES (2, 'Un', 'Usuario', '', 'mnietoramiro@gmail.com');
create table commits
(
    commit_id            integer      default nextval('public.commit_id_seq'::regclass) not null
        constraint pk_commits
            primary key,
    alumno_id            integer                                                        not null
        constraint fk_alumno_id_commit
            references alumnos
            on delete cascade,
    commit_url           varchar(250)                                                   not null,
    commit_fecha         timestamp(2) default now()                                     not null,
    commit_num_errores   integer                                                        not null,
    commit_num_correctos integer                                                        not null,
    curso_id             integer,
    constraint fk5lmr6d21v3s6p9vnkdovh91kb
        foreign key (alumno_id, curso_id) references curso_alumno
);

alter table commits
    owner to pladmin;

INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (1, 1, 'http://', '2019-03-17 00:00:00.00', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (2, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/59/', '2019-03-17 00:00:00.00', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (3, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/70/', '2019-03-19 12:28:06.25', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (4, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/94/', '2019-03-20 19:02:10.86', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (5, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/97/', '2019-03-21 18:45:37.97', 1, 0, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (6, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/98/', '2019-03-21 21:44:38.84', 1, 0, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (7, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/99/', '2019-03-21 21:47:05.65', 1, 0, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (8, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/100/', '2019-03-21 22:01:24.82', 1, 0, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (9, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/101/', '2019-03-21 22:07:22.60', 1, 0, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (11, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/108/', '2019-03-26 22:32:18.49', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (10, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/61/', '2019-03-26 22:01:26.78', 0, 13, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (12, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/62/', '2019-03-27 17:44:42.23', 1, 12, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (13, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/63/', '2019-03-27 17:46:23.80', 0, 13, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (27, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/78/', '2019-03-29 22:26:37.16', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (28, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/80/', '2019-03-30 17:39:26.12', 22, 1, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (29, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/79/', '2019-03-30 17:39:28.93', 9, 14, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (30, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/81/', '2019-03-30 17:40:26.72', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (40, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/7/', '2019-04-02 18:13:09.36', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (31, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/109/', '2019-03-30 18:57:11.31', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (32, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/113/', '2019-04-01 16:39:45.37', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (33, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/115/', '2019-04-01 17:37:53.45', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (34, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/127/', '2019-04-02 17:15:32.99', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (44, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/128/', '2019-04-04 21:24:19.99', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (45, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/155/', '2019-04-07 17:49:54.37', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (46, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/157/', '2019-04-07 18:18:12.81', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (54, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/158/', '2019-04-07 20:56:42.10', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (55, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/159/', '2019-04-12 17:30:58.11', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (57, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/167/', '2019-05-09 18:10:12.25', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (58, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/168/', '2019-05-11 18:10:26.78', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (65, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/172/', '2019-06-06 17:37:08.35', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (69, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/prueba-1/job/master/173/', '2019-06-17 21:20:57.81', 0, 1, null);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (60, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/92/', '2019-05-14 17:17:40.27', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (61, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/93/', '2019-05-14 17:29:38.37', 23, 0, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (62, 2, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/94/', '2019-05-14 17:39:42.73', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (59, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/91/', '2019-05-13 14:32:01.00', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (63, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/95/', '2019-05-16 17:21:47.63', 10, 13, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (64, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/96/', '2019-05-16 19:05:01.41', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (66, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/98/', '2019-06-06 17:42:11.40', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (70, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/99/', '2019-06-19 20:03:13.52', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (71, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/100/', '2019-07-02 18:36:07.28', 12, 13, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (72, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/101/', '2019-07-02 18:47:48.95', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (73, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/102/', '2019-07-03 18:45:38.67', 11, 12, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (74, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/103/', '2019-07-03 18:54:26.27', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (75, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/104/', '2019-07-03 18:57:51.78', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (76, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/105/', '2019-07-03 19:08:57.87', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (77, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/106/', '2019-07-03 19:19:22.17', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (78, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/107/', '2019-07-04 08:19:51.50', 0, 24, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (79, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/108/', '2019-10-22 17:41:19.66', 0, 24, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (67, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PL1-2014-2015/job/master/1/', '2019-06-12 07:13:02.09', 1, 0, 1);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (68, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PL1-2014-2015/job/master/2/', '2019-06-14 16:30:21.81', 1, 0, 1);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (14, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/64/', '2019-03-27 18:25:27.30', 1, 12, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (15, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/65/', '2019-03-27 18:27:56.70', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (16, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/66/', '2019-03-27 22:06:45.86', 6, 39, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (17, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/67/', '2019-03-27 22:39:11.25', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (18, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/68/', '2019-03-28 18:26:18.60', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (19, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/69/', '2019-03-28 18:34:34.26', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (20, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/70/', '2019-03-29 19:39:46.27', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (21, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/71/', '2019-03-29 21:37:37.72', 22, 1, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (22, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/72/', '2019-03-29 21:42:34.02', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (23, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/73/', '2019-03-29 21:44:03.61', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (24, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/74/', '2019-03-29 21:49:38.67', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (25, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/75/', '2019-03-29 22:02:12.94', 11, 12, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (26, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/76/', '2019-03-29 22:09:25.87', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (35, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/1/', '2019-04-02 17:34:59.94', 2, 1, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (36, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/2/', '2019-04-02 17:39:12.19', 2, 1, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (37, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/3/', '2019-04-02 17:44:59.40', 2, 1, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (38, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/4/', '2019-04-02 17:53:31.01', 1, 22, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (39, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/5/', '2019-04-02 17:55:32.76', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (41, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/pipelineatlib/8/', '2019-04-02 20:42:43.66', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (42, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/PR-1/1/', '2019-04-02 21:06:18.95', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (43, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/82/', '2019-04-02 21:07:52.89', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (47, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/83/', '2019-04-07 18:19:36.35', 4, 19, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (48, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/84/', '2019-04-07 18:21:59.93', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (49, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/85/', '2019-04-07 18:23:18.26', 2, 21, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (50, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/86/', '2019-04-07 18:23:52.93', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (51, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/87/', '2019-04-07 18:33:08.41', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (52, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/88/', '2019-04-07 18:33:36.75', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (53, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/89/', '2019-04-07 18:50:24.99', 0, 23, 2);
INSERT INTO public.commits (commit_id, alumno_id, commit_url, commit_fecha, commit_num_errores, commit_num_correctos, curso_id) VALUES (56, 1, 'http://my.plci.local/jenkins/job/ProcesadoresLenguaje/job/PLci-usuario2/job/master/90/', '2019-04-23 17:33:31.08', 0, 23, 2);
create table commits_errores
(
    error_id         integer default nextval('public.error_id_seq'::regclass) not null
        constraint pk_commits_errores
            primary key,
    commit_id        integer                                                  not null
        constraint fk_commit_id_error
            references commits
            on delete cascade,
    error_url        varchar(500)                                             not null,
    error_stage_name varchar(50)                                              not null
);

alter table commits_errores
    owner to pladmin;

INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (1, 9, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/prueba-1/branches/master/runs/101/nodes/13/', 'Build');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (2, 12, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/62/nodes/87/', 'ens_test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (3, 14, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/64/nodes/87/', 'ens_test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (4, 16, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/66/nodes/87/', 'ens_test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (5, 16, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/66/nodes/214/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (6, 16, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/66/nodes/214-parallel-synthetic/', 'Parallel');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (7, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/27/', 'ant build ens ');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (8, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (9, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/48/', 'test/testsPruebaA/testCase02.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (10, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/49/', 'test/testsPruebaA/testCase03.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (11, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/50/', 'test/testsPruebaA/testCase04.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (12, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/51/', 'test/testsPruebaA/testCase05.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (13, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/52/', 'test/testsPruebaA/testCase06.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (14, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/53/', 'test/testsPruebaA/testCase07.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (15, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/54/', 'test/testsPruebaA/testCase08.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (16, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/55/', 'test/testsPruebaA/testCase09.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (17, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/56/', 'test/testsPruebaA/testCase10.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (18, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/109/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (19, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/110/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (20, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/111/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (21, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/112/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (22, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/113/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (23, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/114/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (24, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/115/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (25, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/116/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (26, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/117/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (27, 21, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/71/nodes/118/', 'testCase10');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (28, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/89/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (29, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/110/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (30, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/111/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (31, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/112/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (32, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/113/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (33, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/114/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (34, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/115/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (35, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/116/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (36, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/117/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (37, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/118/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (38, 25, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/75/nodes/119/', 'testCase10');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (39, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/27/', 'ant build ens');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (40, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (41, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/48/', 'test/ens/testCase02.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (42, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/49/', 'test/ens/testCase03.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (43, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/50/', 'test/ens/testCase04.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (44, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/51/', 'test/ens/testCase05.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (45, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/52/', 'test/ens/testCase06.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (46, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/53/', 'test/ens/testCase07.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (47, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/54/', 'test/ens/testCase08.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (48, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/55/', 'test/ens/testCase09.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (49, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/56/', 'test/ens/testCase10.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (50, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/110/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (51, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/111/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (52, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/112/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (53, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/113/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (54, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/114/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (55, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/115/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (56, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/116/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (57, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/117/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (58, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/118/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (59, 28, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/80/nodes/119/', 'testCase10');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (60, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (61, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/110/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (62, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/113/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (63, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/114/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (64, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/115/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (65, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/116/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (66, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/117/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (67, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/118/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (68, 29, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/79/nodes/119/', 'testCase10');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (69, 35, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/1/nodes/27/', 'ant build ens');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (70, 35, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/1/nodes/45/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (71, 36, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/2/nodes/27/', 'ant build ens');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (72, 36, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/2/nodes/45/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (73, 37, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/3/nodes/27/', 'ant build ens');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (74, 37, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/3/nodes/45/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (75, 38, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/pipelineatlib/runs/4/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (76, 47, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (77, 47, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/110/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (78, 47, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/111/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (79, 47, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/83/nodes/113/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (80, 49, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/85/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (81, 49, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/85/nodes/112/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (82, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/13/', 'ant build compiler');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (83, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/27/', 'ant build ens');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (84, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (85, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/48/', 'testCase02.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (86, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/49/', 'testCase03.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (87, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/50/', 'testCase04.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (88, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/51/', 'testCase05.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (89, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/52/', 'testCase06.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (90, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/53/', 'testCase07.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (91, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/54/', 'testCase08.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (92, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/55/', 'testCase09.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (93, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/56/', 'testCase10.p');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (94, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/110/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (95, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/111/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (96, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/112/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (97, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/113/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (98, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/114/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (99, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/115/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (100, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/116/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (101, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/117/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (102, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/118/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (103, 61, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/93/nodes/119/', 'testCase10');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (104, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/88/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (105, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/111/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (106, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/112/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (107, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/113/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (108, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/114/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (109, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/115/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (110, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/116/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (111, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/117/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (112, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/118/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (113, 63, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/95/nodes/119/', 'testCase10');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (114, 67, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PL1-2014-2015/branches/master/runs/1/nodes/13/', 'Build');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (115, 68, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PL1-2014-2015/branches/master/runs/2/nodes/13/', 'Build');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (116, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/93/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (117, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/117/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (118, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/118/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (119, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/119/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (120, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/120/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (121, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/121/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (122, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/122/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (123, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/123/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (124, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/124/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (125, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/125/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (126, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/126/', 'testCase10');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (127, 71, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/100/nodes/127/', 'test_MEMORIA');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (128, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/89/', 'ens run test');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (129, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/112/', 'testCase01');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (130, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/113/', 'testCase02');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (131, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/114/', 'testCase03');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (132, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/115/', 'testCase04');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (133, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/116/', 'testCase05');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (134, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/117/', 'testCase06');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (135, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/118/', 'testCase07');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (136, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/119/', 'testCase08');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (137, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/120/', 'testCase09');
INSERT INTO public.commits_errores (error_id, commit_id, error_url, error_stage_name) VALUES (138, 73, '/blue/rest/organizations/jenkins/pipelines/ProcesadoresLenguaje/pipelines/PLci-usuario2/branches/master/runs/102/nodes/121/', 'testCase10');
create table curso_alumno
(
    alumno_id   integer not null
        constraint fklo9nukmhox3g7spntr761iytl
            references alumnos,
    curso_id    integer not null
        constraint fktgh467qpy8hymle733khllua
            references cursos,
    repositorio varchar(255),
    constraint curso_alumno_pkey
        primary key (alumno_id, curso_id)
);

alter table curso_alumno
    owner to pladmin;

INSERT INTO public.curso_alumno (alumno_id, curso_id, repositorio) VALUES (1, 1, 'http://my.plci.local/gitea/mnieto156/PL1-2014-2015.git');
INSERT INTO public.curso_alumno (alumno_id, curso_id, repositorio) VALUES (1, 2, 'http://my.plci.local/gitea/mnieto156/PLci-usuario2.git');
INSERT INTO public.curso_alumno (alumno_id, curso_id, repositorio) VALUES (2, 2, 'http://my.plci.local/gitea/mnieto156/PLci-usuario2.git');
INSERT INTO public.curso_alumno (alumno_id, curso_id, repositorio) VALUES (2, 1, '2019-2020-PL1/mnietoramiro');
create table cursos
(
    curso_id   integer      not null
        constraint cursos_pkey
            primary key,
    anio       varchar(255) not null,
    asignatura varchar(255) not null,
    cerrado    boolean      not null
);

alter table cursos
    owner to pladmin;

create unique index cursos_anio_asignatura_uindex
    on cursos (anio, asignatura);

INSERT INTO public.cursos (curso_id, anio, asignatura, cerrado) VALUES (1, '2019-2020', 'PL1', false);
INSERT INTO public.cursos (curso_id, anio, asignatura, cerrado) VALUES (2, '2019-2020', 'PL2', false);
INSERT INTO public.cursos (curso_id, anio, asignatura, cerrado) VALUES (4, '2020-2021', 'PL2', false);
INSERT INTO public.cursos (curso_id, anio, asignatura, cerrado) VALUES (3, '2020-2021', 'PL1', true);
create table role
(
    authority   varchar(255) not null
        constraint role_pkey
            primary key,
    description varchar(255)
);

alter table role
    owner to pladmin;

INSERT INTO public.role (authority, description) VALUES ('Alumno', 'Usuario Alumno');
INSERT INTO public.role (authority, description) VALUES ('Admin', 'Administrador de pagina');
INSERT INTO public.role (authority, description) VALUES ('ROLE_ADMIN', 'Administrador');
INSERT INTO public.role (authority, description) VALUES ('ROLE_ALUMNO', 'Alumno de la asignatura');
create table user_role
(
    username  varchar(255) not null
        constraint fk2svos04wv92op6gs17m9omli1
            references users,
    authority varchar(255) not null
        constraint fkep5tcvsl2ep5uuysgi1fmfp0a
            references role,
    constraint user_role_pkey
        primary key (username, authority)
);

alter table user_role
    owner to pladmin;

INSERT INTO public.user_role (username, authority) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO public.user_role (username, authority) VALUES ('mnieto156', 'ROLE_ALUMNO');
INSERT INTO public.user_role (username, authority) VALUES ('user223', 'ROLE_ALUMNO');
INSERT INTO public.user_role (username, authority) VALUES ('mnietoramiro', 'ROLE_ALUMNO');
create table users
(
    username                varchar(255) not null
        constraint users_pkey
            primary key,
    account_non_expired     boolean      not null,
    account_non_locked      boolean      not null,
    credentials_non_expired boolean      not null,
    enabled                 boolean      not null,
    password                varchar(255),
    alumno_alumno_id        integer
        constraint fkiro9udj0k2qfi88an5ayx4gvv
            references alumnos
);

alter table users
    owner to pladmin;

INSERT INTO public.users (username, account_non_expired, account_non_locked, credentials_non_expired, enabled, password, alumno_alumno_id) VALUES ('admin', true, true, true, true, '$2a$10$jFM3SzNmyRgqKBBUb3v3vOBiFEW3.6lzZZUspex1DNzEADcxtf.Oe', null);
INSERT INTO public.users (username, account_non_expired, account_non_locked, credentials_non_expired, enabled, password, alumno_alumno_id) VALUES ('mnieto156', true, true, true, true, '$2a$10$LKBXM1pJXavSlRrtbdv45.TUH1Xcqlow8AzV3Gbz.XrAmW8iKBKkG', 1);
INSERT INTO public.users (username, account_non_expired, account_non_locked, credentials_non_expired, enabled, password, alumno_alumno_id) VALUES ('mnietoramiro', true, true, true, true, '$2a$10$Rv1aN00RKFznPzHhjgWnDufDD2z2UfE5SW1NuEgA/QdXovKS4qzCC', 2);
INSERT INTO public.users (username, account_non_expired, account_non_locked, credentials_non_expired, enabled, password, alumno_alumno_id) VALUES ('user223', true, true, true, true, '$2a$10$X.LR477J2hYgp9DSUjHmROTLmmgbcDQxtZedZSvU1KaYPOOeYsdxW', 4);