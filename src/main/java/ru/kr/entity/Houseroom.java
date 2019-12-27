package ru.kr.entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Квартира
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "houseroom")
public class Houseroom {

    /**
     * ID записи в бд
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Номер квартиры
     */
    private Integer flat;

    /**
     * Номер этажа
     */
    private Integer storey;

    /**
     * Количество комнат
     */
    private Integer rooms;

    /**
     * Квартира в двух уровнях
     */
    @Column(name = "two_level")
    private Boolean twoLevel;

    /**
     * Общая площадь квартиры
     */
    private BigDecimal squareFlat;

    /**
     * Жилая площадь квартиры
     */
    private BigDecimal dwell;

    /**
     * Вспомогательная площадь квартиры
     */
    private BigDecimal branch;

    /**
     * Площадь балкона
     */
    private BigDecimal balcony;

    /**
     * Высота квартиры
     */
    private BigDecimal height;

    /**
     * Здание
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "building_kadastr")
    private Building building;

    /**
     * Комнаты
     */
    @OneToMany(mappedBy = "houseroom", cascade = CascadeType.ALL)
    private List<Room> roomList;

}
