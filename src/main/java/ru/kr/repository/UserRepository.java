package ru.kr.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kr.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
