CREATE TABLE building (
    kadastr character(20),
    address character(20),
    district character(15),
    land numeric(12, 2),
    year numeric(4),
    material character(15),
    base character(15),
    comment text,
    wear numeric(3),
    flow numeric(3),
    line numeric(5)
    Float square
    picture bytea,
    Integer flats
    Boolean elevator
    CONSTRAINT building_pkey PRIMARY KEY (kadastr)
);