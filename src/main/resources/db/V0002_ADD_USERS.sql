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