CREATE TABLE building (
    kadastr varchar(20),
    address varchar(20),
    district varchar(15),
    land numeric(12, 2),
    construction_year numeric(4),
    material varchar(15),
    base varchar(15),
    comment text,
    wear numeric(3),
    flow numeric(3),
    line numeric(5),
    square numeric(12, 2),
    picture bytea,
    flats numeric(3),
    elevator Boolean,
    CONSTRAINT building_pkey PRIMARY KEY (kadastr)
);

CREATE TABLE houseroom (
    id SERIAL,
    flat numeric(4),
    storey numeric(2),
    rooms numeric(1),
    two_level Boolean,
    square_flat numeric(20, 2),
    dwell numeric(20, 2),
    branch numeric(20, 2),
    balcony numeric(20, 2),
    height  numeric(20, 2),
    building_kadastr varchar(20) NOT NULL,
    CONSTRAINT houseroom_pkey PRIMARY KEY (id),
    CONSTRAINT houseroom_building_kadastr_fk FOREIGN KEY (building_kadastr) REFERENCES building(kadastr)
);

CREATE TABLE room (
    id SERIAL,
    record numeric(2),
    square_room numeric(20, 2),
    size varchar(40),
    name varchar(30),
    decoration varchar(60),
    height_room numeric(20, 2),
    socket numeric(2),
    sections numeric(2),
    houseroom_id SERIAL,
    CONSTRAINT room_pkey PRIMARY KEY (id),
    CONSTRAINT room_houseroom_id_fk FOREIGN KEY (houseroom_id) REFERENCES houseroom(id)
);