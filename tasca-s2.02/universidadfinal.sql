use universidad;

-- 1
select  apellido1, apellido2, nombre from persona where persona.tipo='alumno' order by apellido1, apellido2, nombre asc;
-- 2
select nombre, apellido1, apellido2 from persona where persona.telefono is null and persona.tipo='alumno';
-- 3
select nombre, apellido1, apellido2 from persona where persona.tipo='alumno' and persona.fecha_nacimiento between '1999-01-01' and '1999-12-31';
-- 4
select nombre, apellido1, apellido2 from persona where persona.telefono is null and persona.nif like '%K' and persona.tipo='profesor';
-- 5
select * from asignatura where cuatrimestre=1 and curso=3 and id_grado=7;
-- 6
select persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre from persona join profesor on profesor.id_profesor=persona.id join departamento on profesor.id_departamento=departamento.id;
-- 7
select asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin from persona join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_alumno=persona.id join asignatura on asignatura.id=alumno_se_matricula_asignatura.id_asignatura join curso_escolar on curso_escolar.id= alumno_se_matricula_asignatura.id_curso_escolar where persona.nif ='26902806M';
-- 8
select DISTINCT departamento.nombre FROM departamento join profesor  ON profesor.id_departamento = departamento.id join asignatura ON asignatura.id_profesor = profesor.id_profesor join grado on grado.id = asignatura.id_grado where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
 -- 9
 select distinct persona.nombre from persona join alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN curso_escolar  ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = '2018' AND curso_escolar.anyo_fin = '2019';
 -- 10
 select departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre  from persona left join profesor on persona.id = profesor.id_profesor left join departamento on departamento.id=profesor.id_departamento where persona.tipo='profesor' order by  departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre asc;
 -- 11
select * from persona left join profesor ON persona.id = profesor.id_profesor where persona.tipo = 'profesor' and profesor.id_departamento is NULL;
-- 12
select* from departamento left join profesor on departamento.id = profesor=id_departamento where profesor.id_departamento is NULL;
-- 13
select* from persona left join profesor on persona.id=profesor.id_profesor left join asignatura ON asignatura.id_profesor = profesor.id_profesor where persona.tipo = 'profesor' AND asignatura.id is NULL;
-- 14
select * from asignatura left join profesor ON profesor.id_profesor = asignatura.id_profesor where profesor.id_profesor is NULL;
-- 15
select distinct * from departamento left join profesor on departamento.id=profesor.id_departamento left join asignatura on asignatura.id_profesor=profesor.id_profesor where asignatura.id is NULL;
-- 16
select count(id) from persona where tipo='alumno';	
-- 17
select count(id) from persona where tipo='alumno' and fecha_nacimiento between '1999-01-01' and '1999-12-31';
-- 18
select departamento.nombre, count(profesor.id_profesor) from departamento left join profesor on departamento.id= profesor.id_departamento group by departamento.id order by count(profesor.id_profesor) desc;
-- 19
select grado.nombre, count(asignatura.id) from grado left join asignatura on grado.id=asignatura.id_grado group by grado.id order by count(asignatura.id) asc;
-- 20
select grado.nombre, count(asignatura.id) from grado left join asignatura on grado.id=asignatura.id_grado group by grado.id having COUNT(asignatura.id) > 40 order by count(asignatura.id) asc;
-- 21
select grado.nombre, asignatura.tipo, sum(asignatura.creditos) from grado join asignatura on asignatura.id_grado=grado.id group by grado.nombre, asignatura.tipo;
-- 22
select curso_escolar.anyo_inicio, count(alumno_se_matricula_asignatura.id_alumno) from alumno_se_matricula_asignatura join curso_escolar on curso_escolar.id=alumno_se_matricula_asignatura.id_curso_escolar group by curso_escolar.anyo_inicio;
-- 23
select persona.id, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) from asignatura right join profesor on profesor.id_profesor =asignatura.id_profesor join persona on persona.id=profesor.id_profesor group by persona.id order by count(asignatura.id) desc;
-- 24
select * from persona where persona.tipo='alumno' order by persona.fecha_nacimiento desc limit 1;
-- 25
select persona.nombre from persona join profesor on profesor.id_profesor = persona.id join departamento on departamento.id=profesor.id_departamento left join asignatura on asignatura.id_profesor where asignatura.id is null;
