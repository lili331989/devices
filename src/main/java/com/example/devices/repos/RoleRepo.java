package com.example.devices.repos;

import com.example.devices.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepo extends JpaRepository <Role, Long> {
    Role findByName (String name);
}
