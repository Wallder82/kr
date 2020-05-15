package ru.kr.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

/**
 * Оборудование
 */
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "application")
public class Application {

    /**
     * ID записи в бд
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Статус
     */
    private String status;

    /**
     * Описание
     */
    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    /**
     * Записи
     */
    @OneToMany(mappedBy = "application", cascade = CascadeType.ALL)
    private List<Row> rowList;

}
