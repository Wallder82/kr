package ru.kr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kr.entity.Equipment;

public interface EquipmentRepository extends JpaRepository<Equipment, Long> {
}
