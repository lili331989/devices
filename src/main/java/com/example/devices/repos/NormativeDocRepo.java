package com.example.devices.repos;

import com.example.devices.domain.NormativeDoc;
import org.springframework.data.repository.CrudRepository;

public interface NormativeDocRepo extends CrudRepository<NormativeDoc, Long> {
    NormativeDoc findByNormativeNum  (String normativeDocNum);
}
