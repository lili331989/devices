package com.example.devices.repos;

import com.example.devices.domain.Device;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DeviceRepo extends CrudRepository <Device, Long> {
    Device findByDeviceNum (String deviceNum);
}
