package com.example.devices.controller;

import com.example.devices.domain.Dce;
import com.example.devices.domain.Device;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.DceRepo;
import com.example.devices.repos.DeviceRepo;
import com.example.devices.repos.LitteraRepo;
import com.example.devices.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/dce")
public class DceController {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private DceRepo dceRepo;

    @Autowired
    private LitteraRepo litteraRepo;
    @Autowired
    private DeviceRepo deviceRepo;

    @GetMapping
    public String dceList (Model model) {
        model.addAttribute("dces",dceRepo.findAll());
        model.addAttribute("litteraList",litteraRepo.findAll());
        model.addAttribute("devices", deviceRepo.findAll());
        return "dceList";
    }

    @GetMapping ("/delete/{dce}")
    public String dcePageDelete(@PathVariable Dce dce, Model model) throws ResourceNotFoundException {
        model.addAttribute("dce", dce);
        if (dce==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "dceDelete";
    }

    @GetMapping("/edit/{dce}")
    public String dceEditForm (@PathVariable Dce dce, Model model) throws ResourceNotFoundException {
        model.addAttribute ("dce", dce);
        model.addAttribute("litteraList",litteraRepo.findAll());
        model.addAttribute("devices", deviceRepo.findAll());
        if (dce==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "dceEdit";
    }

    @PostMapping("/add")
    public String dceAdd(
            @AuthenticationPrincipal User user,
            @RequestParam String dcenum,
            @RequestParam String dcename,
            @RequestParam Float dcemass,
            @RequestParam String selectLittera,
            @RequestParam String selectDevice

    ){
        Dce dce=new Dce(dcenum, dcename, litteraRepo.findById(Long.parseLong(selectLittera)).get(), dcemass, deviceRepo.findById(Long.parseLong(selectDevice)).get(),user);
        dceRepo.save(dce);
        return "redirect:/dce";
    }

    @PostMapping("/edit")
    public String dceEdit(
        @AuthenticationPrincipal User user,
        @RequestParam String dcenum,
        @RequestParam String dcename,
        @RequestParam Float dcemass,
        @RequestParam String selectLittera,
        @RequestParam String selectDevice,
        @RequestParam Long dceId
    ) throws ResourceNotFoundException{
        Optional<Dce> result=dceRepo.findById(dceId);
        if (!result.isPresent()) throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        Dce dce=result.get();
        dce.setDceNum(dcenum);
        dce.setDceName(dcename);
        dce.setDceMass(dcemass);
        dce.setLittera(litteraRepo.findById(Long.parseLong(selectLittera)).get());
        dce.setDevice(deviceRepo.findById(Long.parseLong(selectDevice)).get());
        dce.setUserUpdate(user);
        dce.setDateUpdate();
        dceRepo.save(dce);
        return "redirect:/dce";
    }


    @PostMapping("/delete")
    public String dceDelete (@RequestParam Long dceId){
        dceRepo.deleteById(dceId);
        return "redirect:/dce";
    }

}
