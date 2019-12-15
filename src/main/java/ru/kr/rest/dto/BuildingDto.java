package ru.kr.rest.dto;

import ru.kr.entity.Houseroom;

import java.util.List;

public class BuildingDto {

    private String kadastr;

    private String address;

    private String district;

    private Float land;

    private Integer constructionYear;

    private String material;

    private String base;

    private String comment;

    private Integer wear;

    private Integer flow;

    private Integer line;

    private Float square;

    private byte[] picture;

    private Integer flats;

    private Boolean elevator;

    private List<Houseroom> houseroomList;
}
