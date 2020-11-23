package com.example.devices.controller;

import com.example.devices.domain.Device;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.DeviceRepo;
import com.example.devices.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/device")
public class DeviceController {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private DeviceRepo deviceRepo;

    @GetMapping
    public String deviceList(Model model){
        model.addAttribute("devices",deviceRepo.findAll());
        return "deviceList";
    }

    @GetMapping ("/delete/{device}")
    public String devicePageDelete(@PathVariable Device device, Model model) throws ResourceNotFoundException{
        model.addAttribute("device", device);
        if (device==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "deviceDelete";
    }

    @GetMapping("/edit/{device}")
    public String deviceEditForm (@PathVariable Device device, Model model) throws ResourceNotFoundException {
        model.addAttribute("device",device);
        if (device==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "deviceEdit";
    }

    @PostMapping("/edit")
    public String deviceEdit(
            @AuthenticationPrincipal User user,
            @RequestParam Long deviceId,
            @RequestParam String devicenum,
            @RequestParam String devicename,
            @RequestParam Float devicemass,
            @RequestParam Float devicedepth,
            @RequestParam Float devicewidth,
            @RequestParam Float deviceheight
            ) throws ResourceNotFoundException {
        Optional<Device> result= deviceRepo.findById(deviceId);
        if (!result.isPresent()) throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        Device device=result.get();
        device.setDeviceNum(devicenum);
        device.setDeviceName(devicename);
        device.setDeviceMass(devicemass);
        device.setDeviceDepth(devicedepth);
        device.setDeviceWidth(devicewidth);
        device.setDeviceHeight(deviceheight);
        device.setUserUpdate(user);
        device.setDateUpdate();
        deviceRepo.save(device);
        return ("redirect:/device");
    }

    @PostMapping("/add")
    public String deviceAdd(
            @AuthenticationPrincipal User user,
            @RequestParam String devicenum,
            @RequestParam String devicename,
            @RequestParam Float devicemass,
            @RequestParam Float devicedepth,
            @RequestParam Float devicewidth,
            @RequestParam Float deviceheight
    ){
        Device device=new Device(devicenum, devicename, devicemass, devicedepth,devicewidth, deviceheight, user);
        deviceRepo.save(device);
        return ("redirect:/device");
    }

    @PostMapping ("/delete")
    public String deviceDelete (@RequestParam Long deviceId)  {
        deviceRepo.deleteById(deviceId);
        return ("redirect:/device");
    }

}
