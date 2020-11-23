package com.example.devices.repos;

import com.example.devices.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername (String username);
}
