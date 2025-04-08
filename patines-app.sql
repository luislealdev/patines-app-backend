create table estudiante(
    id_estudiante int auto_increment primary key,
    nombre varchar(50) not null,
    correo varchar(50) not null unique,
    numero_control varchar(8) not null unique,
    contrasena varchar(255) not null,
    telefono varchar(15)
);

create table estacion(
    id_estacion int auto_increment primary key,
    nombre varchar(50) not null,
    ubicacion varchar(100) not null
);

create table patin(
    id_patin int auto_increment primary key,
    estado enum('disponible', 'en_uso', 'mantenimiento') not null
);

create table mantenimiento(
    id_mantenimiento int auto_increment primary key,
    id_patin int not null,
    fecha_inicio date not null,
    fecha_fin date,
    descripcion text,
    estado varchar(50) not null,
    foreign key (id_patin) references patin(id_patin)
);

create table evento(
    id_evento int auto_increment primary key,
    id_patin int not null,
    id_estudiante int not null,
    tipo varchar(50) not null,
    fecha date not null,
    exito bool not null,
    foreign key (id_patin) references patin(id_patin),
    foreign key (id_estudiante) references estudiante(id_estudiante)
);

create table viaje(
    id_viaje int auto_increment primary key,
    id_estudiante int not null,
    id_patin int not null,
    fecha_inicio date not null,
    fecha_fin date,
    id_estacion_inicio int not null,
    id_estacion_fin int not null,
    costo decimal(10, 2) not null,
    foreign key (id_estudiante) references estudiante(id_estudiante),
    foreign key (id_patin) references patin(id_patin),
    foreign key (id_estacion_inicio) references estacion(id_estacion),
    foreign key (id_estacion_fin) references estacion(id_estacion)
);

create table pago(
    id_pago int auto_increment primary key,
    id_estudiante int not null,
    id_viaje int not null,
    monto decimal(10, 2) not null,
    fecha date not null,
    tarjeta_ult4 varchar(30) not null,
    estado varchar(30) not null,
    foreign key (id_estudiante) references estudiante(id_estudiante),
    foreign key (id_viaje) references viaje(id_viaje)
);