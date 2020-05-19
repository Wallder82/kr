create table building (
    kadastr varchar(20),
    address varchar(20) not null,
    district varchar(15),
    land numeric(12, 2),
    construction_year numeric(4) not null,
    material varchar(15),
    base varchar(15),
    comment text,
    wear numeric(3),
    flow numeric(3) not null,
    line numeric(5),
    square numeric(12, 2),
    picture bytea,
    flats numeric(3),
    elevator boolean,
    constraint building_pkey primary key (kadastr)
);

create table houseroom (
    id serial,
    flat numeric(4) not null,
    storey numeric(2) not null,
    rooms numeric(1),
    two_level boolean default false,
    square_flat numeric(20, 2),
    dwell numeric(20, 2),
    branch numeric(20, 2),
    balcony numeric(20, 2),
    height  numeric(20, 2),
    building_kadastr varchar(20) not null,
    constraint houseroom_pkey primary key (id),
    constraint houseroom_building_kadastr_fk foreign key (building_kadastr) references building(kadastr)
);

create table room (
    id serial,
    record numeric(2) not null,
    square_room numeric(20, 2) not null,
    size varchar(40),
    name varchar(30),
    decoration varchar(60),
    height_room numeric(20, 2),
    socket numeric(2),
    sections numeric(2),
    houseroom_id serial,
    constraint room_pkey primary key (id),
    constraint room_houseroom_id_fk foreign key (houseroom_id) references houseroom(id)
);

create or replace FUNCTION increment_building_flats() RETURNS TRIGGER AS $$
    BEGIN
		UPDATE building set flats = (select flats from building where kadastr = NEW.building_kadastr) + 1 where kadastr = NEW.building_kadastr;
		RETURN NEW;
    END;
$$ LANGUAGE 'plpgsql';

create or replace FUNCTION decrement_building_flats() RETURNS TRIGGER AS $$
    BEGIN
		UPDATE building set flats = (select flats from building where kadastr = OLD.building_kadastr) - 1 where kadastr = OLD.building_kadastr;
		RETURN OLD;
    END;
$$ LANGUAGE 'plpgsql';

create TRIGGER increment_building_flats AFTER INSERT
ON houseroom
FOR EACH ROW
EXECUTE PROCEDURE increment_building_flats();

create TRIGGER decrement_building_flats BEFORE DELETE
ON houseroom
FOR EACH ROW
EXECUTE PROCEDURE decrement_building_flats();

create or replace FUNCTION increment_houseroom_rooms() RETURNS TRIGGER AS $$
    BEGIN
		UPDATE houseroom set rooms = (select rooms from houseroom where id = NEW.houseroom_id) + 1 where id = NEW.houseroom_id;
		RETURN NEW;
    END;
$$ LANGUAGE 'plpgsql';

create or replace FUNCTION decrement_houseroom_rooms() RETURNS TRIGGER AS $$
    BEGIN
		UPDATE houseroom set rooms = (select rooms from houseroom where id = OLD.houseroom_id) - 1 where id = OLD.houseroom_id;
		RETURN OLD;
    END;
$$ LANGUAGE 'plpgsql';

create TRIGGER increment_houseroom_rooms AFTER INSERT
ON room
FOR EACH ROW
EXECUTE PROCEDURE increment_houseroom_rooms();

create TRIGGER decrement_houseroom_rooms BEFORE DELETE
ON room
FOR EACH ROW
EXECUTE PROCEDURE decrement_houseroom_rooms();


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
