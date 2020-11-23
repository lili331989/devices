package com.example.devices.repos;

import com.example.devices.domain.Littera;
import org.springframework.data.repository.CrudRepository;

public interface LitteraRepo extends CrudRepository<Littera, Long> {
    Littera findByLitteraName (String litteraName);
}
