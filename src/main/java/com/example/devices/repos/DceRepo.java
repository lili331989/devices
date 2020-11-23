package com.example.devices.repos;

import com.example.devices.domain.Dce;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DceRepo extends JpaRepository<Dce, Long> {
     List <Dce> findByDceName (String dceName);

}
