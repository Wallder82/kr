package ru.kr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kr.entity.Row;

public interface RowRepository extends JpaRepository<Row, Long> {
}
