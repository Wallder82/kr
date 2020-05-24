create table usr (
    id serial,
    username varchar(512),
    password varchar(512),
    active boolean,
    surname varchar(512),
    name varchar(512),
    middle_name varchar(512),
    level integer,
    constraint usr_pkey primary key (id)
);

create table user_role (
    id serial,
    user_id serial,
    roles varchar(512),
    constraint user_role_pkey primary key (id),
    constraint user_role_id_fk foreign key (user_id) references usr(id)
);



create table equipment (
    id serial NOT NULL,
    name varchar(100),
    description varchar(512),
    count numeric(9),
    constraint equipment_pkey primary key (id)
);

create table application (
    id serial NOT NULL,
    status varchar(100),
    description varchar(100),
    user_id serial,
    create_time timestamp,
    constraint application_pkey primary key (id),
    constraint application_user_fk foreign key (user_id) references usr(id)
);

create table app_row (
    id serial,
    count numeric(9),
    application_id serial NOT NULL,
    equipment_id serial NOT NULL,
    constraint app_row_pkey primary key (id),
    constraint app_row_application_fk foreign key (application_id) references application(id),
    constraint app_row_equipment_fk foreign key (equipment_id) references equipment(id)
);

create table private_equipment (
    id serial,
    count numeric(9),
    application_id serial NOT NULL,
    equipment_id serial NOT NULL,
    user_id serial,
    set_time timestamp,
    constraint private_equipment_pkey primary key (id),
    constraint private_equipment_application_fk foreign key (application_id) references application(id),
    constraint private_equipment_equipment_fk foreign key (equipment_id) references equipment(id),
    constraint private_equipment_user_fk foreign key (user_id) references usr(id)
);
