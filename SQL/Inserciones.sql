-- Insercion de categorias de los recursos
insert into TIPORECURSO values('AUD','Auditorio');
insert into TIPORECURSO values('DZA','Sala de Danza');
insert into TIPORECURSO values('LAQ','Laboratorio de Quimica');
insert into TIPORECURSO values('FUT','Cancha de Futbol');
insert into TIPORECURSO values('LAI','Laboratorio de Informatica');
insert into TIPORECURSO values('LAF','Laboratorio de Fisica');
insert into TIPORECURSO values('LIB','Libro');
insert into TIPORECURSO values('PCS','Computadores');
insert into TIPORECURSO values('TAB','Tablets');


-- Insercion de detalles de espacios fisicos
insert into ESPACIOSFISICOS values('1','90','Sillas estaticas con sillin plegable.');
insert into ESPACIOSFISICOS values('2','50','Sillas completamente estaticas.');
insert into ESPACIOSFISICOS values('3','25','Sillas de madera sin espaldar.');
insert into ESPACIOSFISICOS values('4','30','Sillas movibles con ruedas para facilidad de movimiento.');
insert into ESPACIOSFISICOS values('5','24','Pasto sintetico con lineas de division.');
insert into ESPACIOSFISICOS values('6','50','Piso antideslizante.');
insert into ESPACIOSFISICOS values('7','20','Espejo para visualizar la coreografia.');
insert into ESPACIOSFISICOS values('8','30','Con tubos de estiramiento para ballet.');
insert into ESPACIOSFISICOS values('9','40','Piso acolchado para proteccion en caso de caidas.');
insert into ESPACIOSFISICOS values('10','60','Mesa central con sillas para reuniones grupales.');
insert into ESPACIOSFISICOS values('11','99','Patio amplio con iluminacion natural para eventos al aire libre.');
insert into ESPACIOSFISICOS values('12','40','Escenario con luces y sonido para presentaciones teatrales.');
insert into ESPACIOSFISICOS values('13','15','Area con barras y espejos para practicar ejercicios de ballet.');
insert into ESPACIOSFISICOS values('14','70','Campo de cesped con gradas para espectadores.');
insert into ESPACIOSFISICOS values('15','35','Espacio con bancos y mesas para actividades recreativas.');
insert into ESPACIOSFISICOS values('16','80','Salon con equipo de sonido y proyector para presentaciones.');
insert into ESPACIOSFISICOS values('17','25','Area con barras y espejos para clases de danza.');
insert into ESPACIOSFISICOS values('18','45','Sala de reuniones con pizarron y proyector.');
insert into ESPACIOSFISICOS values('19','55','Gimnasio con pesas y maquinas de ejercicio.');
insert into ESPACIOSFISICOS values('20','30','Area con piso de madera para clases de yoga.');
insert into ESPACIOSFISICOS values('21','90','Con garantia de danos.');
insert into ESPACIOSFISICOS values('22','80','Pantalla tactil.');
insert into ESPACIOSFISICOS values('23','50','Mouse integrado.');
insert into ESPACIOSFISICOS values('24','30','Paginas reforzadas.');

-- Insercion de recursos auditorios
insert into RECURSO values('1','1','AUD',TO_DATE('08:00:00', 'hh24:mi:ss'),TO_DATE('20:30:00', 'hh24:mi:ss'),'Auditorio Hermanos San Juan','Auditorio de la sede Macarena ubicado en el piso 2 de la seccion B.','Disponible');
insert into RECURSO values('2','2','AUD',TO_DATE('12:00:00', 'hh24:mi:ss'),TO_DATE('19:00:00', 'hh24:mi:ss'),'Auditorio Sabio Caldas','Auditorio de la sede de Ingenieria ubicado en el subterraneo piso -1.','Disponible');
insert into RECURSO values('3','1','AUD',TO_DATE('13:45:00', 'hh24:mi:ss'),TO_DATE('18:20:00', 'hh24:mi:ss'),'Auditorio Porvenir','Auditorio de la sede de Deportes ubicado en el primer piso de la facultad.','Disponible');
insert into RECURSO values('4','2','AUD',TO_DATE('06:00:00', 'hh24:mi:ss'),TO_DATE('19:00:00', 'hh24:mi:ss'),'Auditorio Graduacion','Auditorio de la biblioteca central ubicado en el primer piso de la sede.','Disponible');


--Insercion de recursos Salas de Danzas
insert into RECURSO values('5','6','DZA',TO_DATE('10:00:00', 'hh24:mi:ss'),TO_DATE('20:00:00', 'hh24:mi:ss'),'Sala de Danza el Joe Arroyo','Sala de danzas de la facultad de Artes.','Disponible');
insert into RECURSO values('6','7','DZA',TO_DATE('12:00:00', 'hh24:mi:ss'),TO_DATE('19:00:00', 'hh24:mi:ss'),'Sala de Danza Juanito Alimana','Sala de danzas especializada para coreografias y clases de aerobicos.','Disponible');
insert into RECURSO values('7','8','DZA',TO_DATE('13:45:00', 'hh24:mi:ss'),TO_DATE('18:20:00', 'hh24:mi:ss'),'Sala de Danza el Cisne negro','Sala de danzas especializada para clases de ballet o coreografia artistica contemporanea.','Disponible');


--Insercion de recursos Laboratorio de Quimica
insert into RECURSO values('8', '3', 'LAQ', TO_DATE('09:00:00', 'hh24:mi:ss'), TO_DATE('17:00:00', 'hh24:mi:ss'), 'Laboratorio Quimica Organica', 'Laboratorio equipado para practicas de quimica organica.', 'Disponible');
insert into RECURSO values('9', '4', 'LAQ', TO_DATE('10:30:00', 'hh24:mi:ss'), TO_DATE('16:00:00', 'hh24:mi:ss'), 'Laboratorio Quimica Analitica', 'Laboratorio con instrumentacion para analisis quimico.', 'Disponible');
insert into RECURSO values('10', '5', 'LAQ', TO_DATE('11:00:00', 'hh24:mi:ss'), TO_DATE('18:00:00', 'hh24:mi:ss'), 'Laboratorio Quimica Inorganica', 'Laboratorio equipado para practicas de quimica inorganica.', 'Disponible');
insert into RECURSO values('11', '9', 'LAQ', TO_DATE('08:00:00', 'hh24:mi:ss'), TO_DATE('15:30:00', 'hh24:mi:ss'), 'Laboratorio Quimica General', 'Laboratorio para practicas basicas de quimica.', 'Disponible');
insert into RECURSO values('12', '10', 'LAQ', TO_DATE('10:00:00', 'hh24:mi:ss'), TO_DATE('17:00:00', 'hh24:mi:ss'), 'Laboratorio Quimica Avanzada', 'Laboratorio con equipos avanzados para investigaciones en quimica.', 'Disponible');
insert into RECURSO values('13', '12', 'LAQ', TO_DATE('12:00:00', 'hh24:mi:ss'), TO_DATE('20:00:00', 'hh24:mi:ss'), 'Laboratorio Quimica Ambiental', 'Laboratorio especializado en analisis de muestras ambientales.', 'Disponible');


--Insercion de recursos Cancha de Futbol
insert into RECURSO values('14', '5', 'FUT', TO_DATE('08:00:00', 'hh24:mi:ss'), TO_DATE('22:00:00', 'hh24:mi:ss'), 'Cancha Futbol 11', 'Cancha reglamentaria para partidos de futbol.', 'Disponible');
insert into RECURSO values('15', '14', 'FUT', TO_DATE('09:00:00', 'hh24:mi:ss'), TO_DATE('19:00:00', 'hh24:mi:ss'), 'Cancha Futbol 7', 'Cancha mas pequena para partidos de futbol 7.', 'Disponible');
insert into RECURSO values('16', '5', 'FUT', TO_DATE('16:00:00', 'hh24:mi:ss'), TO_DATE('21:00:00', 'hh24:mi:ss'), 'Cancha Futbol Nocturna', 'Cancha iluminada para partidos nocturnos.', 'Disponible');
insert into RECURSO values('17', '14', 'FUT', TO_DATE('10:00:00', 'hh24:mi:ss'), TO_DATE('18:00:00', 'hh24:mi:ss'), 'Cancha Futbol 5', 'Cancha pequena para partidos de futbol 5.', 'Disponible');
insert into RECURSO values('18', '5', 'FUT', TO_DATE('07:00:00', 'hh24:mi:ss'), TO_DATE('20:00:00', 'hh24:mi:ss'), 'Cancha Futbol Libre', 'Cancha abierta para uso general y entrenamiento.', 'Disponible');
insert into RECURSO values('19', '14', 'FUT', TO_DATE('08:00:00', 'hh24:mi:ss'), TO_DATE('17:00:00', 'hh24:mi:ss'), 'Cancha Futbol Techada', 'Cancha techada para partidos bajo techo.', 'Disponible');


--Insercion de recursos Laboratorio de Informatica
insert into RECURSO values('20', '6', 'LAI', TO_DATE('08:00:00', 'hh24:mi:ss'), TO_DATE('21:00:00', 'hh24:mi:ss'), 'Laboratorio Informatica Basica', 'Laboratorio con computadoras para practicas introductorias.', 'Disponible');
insert into RECURSO values('21', '16', 'LAI', TO_DATE('10:00:00', 'hh24:mi:ss'), TO_DATE('18:00:00', 'hh24:mi:ss'), 'Laboratorio Informatica Avanzada', 'Laboratorio con equipos especializados para proyectos.', 'Disponible');
insert into RECURSO values('22', '6', 'LAI', TO_DATE('12:00:00', 'hh24:mi:ss'), TO_DATE('20:00:00', 'hh24:mi:ss'), 'Laboratorio Informatica Multimedia', 'Laboratorio con recursos audiovisuales para diseno digital.', 'Disponible');
insert into RECURSO values('23', '16', 'LAI', TO_DATE('08:00:00', 'hh24:mi:ss'), TO_DATE('22:00:00', 'hh24:mi:ss'), 'Laboratorio Informatica Networking', 'Laboratorio con equipos para configuracion de redes.', 'Disponible');
insert into RECURSO values('24', '6', 'LAI', TO_DATE('09:00:00', 'hh24:mi:ss'), TO_DATE('17:00:00', 'hh24:mi:ss'), 'Laboratorio Informatica Programacion', 'Laboratorio con software de programacion instalado.', 'Disponible');
insert into RECURSO values('25', '16', 'LAI', TO_DATE('07:00:00', 'hh24:mi:ss'), TO_DATE('19:00:00', 'hh24:mi:ss'), 'Laboratorio Informatica Seguridad', 'Laboratorio con herramientas para analisis de seguridad informatica.', 'Disponible');


--Insercion de recursos Laboratorio de Fisica
insert into RECURSO values('26', '7', 'LAF', TO_DATE('09:00:00', 'hh24:mi:ss'), TO_DATE('16:00:00', 'hh24:mi:ss'), 'Laboratorio Fisica Mecanica', 'Laboratorio equipado para experimentos de mecanica.', 'Disponible');
insert into RECURSO values('27', '8', 'LAF', TO_DATE('10:00:00', 'hh24:mi:ss'), TO_DATE('17:00:00', 'hh24:mi:ss'), 'Laboratorio Fisica Electromagnetismo', 'Laboratorio con equipos para experimentos de electromagnetismo.', 'Disponible');
insert into RECURSO values('28', '17', 'LAF', TO_DATE('08:30:00', 'hh24:mi:ss'), TO_DATE('15:30:00', 'hh24:mi:ss'), 'Laboratorio Fisica Optica', 'Laboratorio especializado en experimentos de optica.', 'Disponible');
insert into RECURSO values('29', '9', 'LAF', TO_DATE('11:00:00', 'hh24:mi:ss'), TO_DATE('18:00:00', 'hh24:mi:ss'), 'Laboratorio Fisica Termodinamica', 'Laboratorio con equipos para experimentos de termodinamica.', 'Disponible');
insert into RECURSO values('30', '18', 'LAF', TO_DATE('08:00:00', 'hh24:mi:ss'), TO_DATE('17:00:00', 'hh24:mi:ss'), 'Laboratorio Fisica Cuantica', 'Laboratorio para experimentos avanzados de fisica cuantica.', 'Disponible');
insert into RECURSO values('31', '17', 'LAF', TO_DATE('12:00:00', 'hh24:mi:ss'), TO_DATE('20:00:00', 'hh24:mi:ss'), 'Laboratorio Fisica Nuclear', 'Laboratorio con material radiactivo para experimentos de fisica nuclear.', 'Disponible');


--Insercion de recursos Libros
insert into RECURSO values('32', '24', 'LIB', NULL, NULL, 'Cien Anos de Soledad', 'Obra maestra del realismo magico latinoamericano escrita por Gabriel Garcia Marquez.', 'Disponible');
insert into RECURSO values('33', '24', 'LIB', NULL, NULL, 'Quimica Organica Avanzada', 'Manual avanzado para el estudio de la quimica organica y sus aplicaciones en sintesis y analisis.', 'Disponible');
insert into RECURSO values('34', '24', 'LIB', NULL, NULL, 'Matematicas Aplicadas a la Ingenieria', 'Guia practica con ejercicios y problemas resueltos de matematicas aplicadas en ingenieria.', 'Disponible');
insert into RECURSO values('35', '24', 'LIB', NULL, NULL, 'Historia del Arte Contemporaneo', 'Analisis de los movimientos artisticos del siglo XX y sus principales exponentes.', 'Disponible');
insert into RECURSO values('36', '24', 'LIB', NULL, NULL, 'Antologia de Literatura Clasica Griega', 'Coleccion de obras literarias griegas clasicas de autores como Homero, Esquilo y Sofocles.', 'Disponible');
insert into RECURSO values('37', '24', 'LIB', NULL, NULL, 'Economia Global: Perspectivas y Desafios', 'Estudio exhaustivo sobre la economia mundial, sus desafios y tendencias actuales.', 'Disponible');


--Insercion de recursos Computadores
insert into RECURSO values('38', '22', 'PCS', NULL, NULL, 'Lenovo ThinkPad X1 Carbon', 'Portatil ultraligero y potente disenado para profesionales en movimiento.', 'Disponible');
insert into RECURSO values('39', '21', 'PCS', NULL, NULL, 'HP Pavilion Gaming Desktop', 'Equipo de escritorio disenado para juegos y multitarea intensiva.', 'Disponible');
insert into RECURSO values('40', '22', 'PCS', NULL, NULL, 'Dell Precision Workstation', 'Estacion de trabajo potente para tareas de diseno, ingenieria y renderizado.', 'Disponible');


--Insercion de recursos Tablets
insert into RECURSO values('41', '23', 'TAB', NULL, NULL, 'Samsung Galaxy Tab S7+', 'Tablet premium con pantalla AMOLED y S Pen para productividad y entretenimiento.', 'Disponible');
insert into RECURSO values('42', '21', 'TAB', NULL, NULL, 'Apple iPad Pro', 'Tablet profesional con chip M1 y compatibilidad con Apple Pencil y Magic Keyboard.', 'Disponible');
insert into RECURSO values('43', '23', 'TAB', NULL, NULL, 'Microsoft Surface Pro 7', 'Tablet versatil con teclado desmontable y pantalla tactil para trabajo y creatividad.', 'Disponible');

commit;