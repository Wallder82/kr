package ru.kr.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

/**
 * Квартира
 */
@Data
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
    private Float squareFlat;

    /**
     * Жилая площадь квартиры
     */
    private Float dwell;

    /**
     * Вспомогательная площадь квартиры
     */
    private Float branch;

    /**
     * Площадь балкона
     */
    private Float balcony;

    /**
     * Высота квартиры
     */
    private Float height;

    /**
     * Здание
     */
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "building_id")
    private Building building;

    /**
     * Комнаты
     */
    @OneToMany(mappedBy = "building", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Room> roomList;

}
