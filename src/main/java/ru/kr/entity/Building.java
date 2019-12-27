package ru.kr.entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Здание
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "building")
public class Building {

    /**
     * Кадастровый номер здания
     */
    @Id
    private String kadastr;

    /**
     * Адрес здания
     */
    private String address;

    /**
     * Район города
     */
    private String district;

    /**
     * Площадь земельного участка
     */
    private BigDecimal land;

    /**
     * Год постройки здания
     */
    private Integer constructionYear;

    /**
     * Материал стен здания
     */
    private String material;

    /**
     * Материал фундамента
     */
    private String base;

    /**
     * Примечания
     */
    private String comment;

    /**
     * Износ в процентах
     */
    private Integer wear;

    /**
     * Количество этажей в здании
     */
    private Integer flow;

    /**
     * Расстояние от центра города
     */
    private Integer line;

    /**
     * Площадь квартир
     */
    private BigDecimal square;

    /**
     * Фото здания
     */
    private byte[] picture;

    /**
     * Количество квартир в здании
     */
    private Integer flats;

    /**
     * Наличие лифта
     */
    private Boolean elevator;

    /**
     * Квартиры
     */
    @OneToMany(mappedBy = "building", cascade = CascadeType.ALL)
    private List<Houseroom> houseroom;

}
