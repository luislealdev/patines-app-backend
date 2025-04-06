create table estudiante(id_estudiante int auto_increment primary key, nombre varchar(50), correo varchar(50), numero_control varchar(8), contrasena varchar(255), telefono varchar(10));

create table estacion(id_estacion int auto_increment primary key, nombre varchar(50), ubicacion varchar(100));

create table patin(id_patin int auto_increment primary key, estado);

create table mantenimiento(id_mantenimiento int auto_increment primary key, id_patin int references patin(id_patin), fecha_inicio date, fecha_fin date, descripcion text, estado varchar(50));

create table evento(id_evento int auto_increment primary key, id_patin int references patin(id_patin), id_estudiante int references estudiante(id_estudiante), tipo varchar(50), fecha date, exito bool);

create table viaje(id_viaje int auto_increment primary key, id_estudiante int references estudiante(id_estudiante), id_patin int references patin(id_patin), fecha_inicio date, fecha_fin date,
                   id_estacion_inicio int references estacion(id_estacion), id_estacion_fin int references estacion(id_estacion), costo decimal(10, 2)
);

create table pago(id_pago int auto_increment primary key, id_estudiante int references estudiante(id_estudiante), id_viaje int references viaje(id_viaje), monto decimal(10, 2), fecha date,
                  tarjeta_ult4 varchar(30), estado varchar(30)
);