package ru.kr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kr.entity.Building;

@Repository
public interface BuildingRepository extends JpaRepository<Building, String>{
}
