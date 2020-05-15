package ru.kr.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * Запись в заявке
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "app_row")
public class Row {

    /**
     * ID записи в бд
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Количество
     */
    private Long count;

    /**
     * Заявка
     */
    @ManyToOne
    @JoinColumn(name = "application_id")
    private Application application;

    /**
     * Оборудование
     */
    @ManyToOne
    @JoinColumn(name = "equipment_id")
    private Equipment equipment;
}
