package com.example.devices.repos;

import com.example.devices.domain.ApplicationArea;
import org.springframework.data.repository.CrudRepository;

public interface ApplicationAreaRepo extends CrudRepository <ApplicationArea, Long>{
    ApplicationArea findByApplicationAreaName(String ApplicationAreaName);
}
