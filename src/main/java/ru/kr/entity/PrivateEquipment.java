package ru.kr.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * Выданное оборудование
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "private_equipment")
public class PrivateEquipment {

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
     * Дата выдачи
     */
    private LocalDateTime setTime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

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
