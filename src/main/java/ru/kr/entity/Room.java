package ru.kr.entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Комната
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "room")
public class Room {

    /**
     * ID записи в бд
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Номер помещения в квартире
     */
    private Integer record;

    /**
     *Площадь помещения
     */
    private BigDecimal squareRoom;

    /**
     * Размеры помещения  в плане
     */
    private String size;

    /**
     * Назначение (кухня, ниша …)
     */
    private String name;

    /**
     * Отделка (паркет, обои …)
     */
    private String decoration;

    /**
     * Высота помещения
     */
    private BigDecimal heightRoom;

    /**
     * Число розеток в помещении
     */
    private Integer socket;

    /**
     * Число элементов в батарее отопления
     */
    private Integer sections;

    /**
     * Квартира
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "houseroom_id")
    private Houseroom houseroom;

}
