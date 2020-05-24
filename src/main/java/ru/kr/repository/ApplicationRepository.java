package ru.kr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kr.entity.Application;

import java.util.List;

public interface ApplicationRepository extends JpaRepository<Application, Long> {

    List<Application> findByUserId(Long userId);

    List<Application> findByStatus(String status);
}
