package ru.kr.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@Entity
@Table(name = "houseroom")
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
    private Integer Record;

    /**
     *Площадь помещения
     */
    private Float squareRoom;

    /**
     * Размеры помещения  в плане
     */
    private String size;

    /**
     * Назначение (кухня, ниша …
     */
    private String name;

    /**
     * Отделка (паркет, обои …)
     */
    private String decoration;

    /**
     * Высота помещения
     */
    private Float heightRoom;

    /**
     * Число розеток в помещении
     */
    private Integer socket;

    /**
     * Число элементов в батарее отопления
     */
    private Integer sections;

}
