package ru.kr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kr.entity.Application;
import ru.kr.entity.PrivateEquipment;

import java.util.List;

public interface PrivateEquipmentRepository extends JpaRepository<PrivateEquipment, Long> {

    List<PrivateEquipment> findByUserId(Long userId);
}
