package com.example.devices.repos;

import com.example.devices.domain.TypeNormaDoc;
import org.springframework.data.repository.CrudRepository;

public interface TypeNormaDocRepo extends CrudRepository<TypeNormaDoc, Long> {
    TypeNormaDoc findByTypeNormaName(String typeNormaName);
}
