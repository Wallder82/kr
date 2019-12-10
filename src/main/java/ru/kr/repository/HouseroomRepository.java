package ru.kr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kr.entity.Houseroom;

import java.util.List;

@Repository
public interface HouseroomRepository extends JpaRepository<Houseroom, Long> {

    List<Houseroom> findByBuildingKadastr(String buildingKadastr);
}
