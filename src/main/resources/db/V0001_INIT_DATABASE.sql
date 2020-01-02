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
