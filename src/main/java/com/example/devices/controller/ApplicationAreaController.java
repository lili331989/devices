package com.example.devices.controller;

import com.example.devices.domain.ApplicationArea;
import com.example.devices.domain.Device;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.ApplicationAreaRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/applicationArea")
public class ApplicationAreaController {
    @Autowired
    private ApplicationAreaRepo applicationAreaRepo;

    @GetMapping
    public String applicationAreaList(Model model){
        model.addAttribute("applicationList", applicationAreaRepo.findAll());
        return "applicationAreaList";
    }

    @GetMapping ("/delete/{applicationArea}")
    public String applicationAreaPageDelete(
            @PathVariable ApplicationArea applicationArea, Model model) throws ResourceNotFoundException{
        model.addAttribute(applicationArea);
        if (applicationArea==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "applicationAreaDelete";
    }

    @GetMapping ("/edit/{applicationArea}")
    public String applicationAreaEditForm(
            @PathVariable ApplicationArea applicationArea, Model model) throws ResourceNotFoundException{
        model.addAttribute(applicationArea);
        if (applicationArea==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "applicationAreaEdit";
    }

    @PostMapping ("/delete")
    public String applicationAreaDelete (@RequestParam Long applicationAreaId){
        applicationAreaRepo.deleteById(applicationAreaId);
        return "redirect:/applicationArea";
    }

    @PostMapping ("/add")
    public String applicationAreaAdd (@AuthenticationPrincipal User user, @RequestParam String applicationAreaname){
        ApplicationArea applicationArea=new ApplicationArea(applicationAreaname, user);
        applicationAreaRepo.save(applicationArea);
        return "redirect:/applicationArea";
    }

    @PostMapping ("/edit")
    public String applicationAreaEdit (
            @AuthenticationPrincipal User user,
            @RequestParam Long applicationAreaId,
            @RequestParam String applicationAreaname) throws ResourceNotFoundException{
        Optional <ApplicationArea> result=applicationAreaRepo.findById(applicationAreaId);
        if (!result.isPresent()) throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        ApplicationArea applicationArea=result.get();
        if (!applicationArea.getApplicationAreaName().equals(applicationAreaname)) {
            applicationArea.setApplicationAreaName(applicationAreaname);
            applicationArea.setUserUpdate(user);
            applicationArea.setDateUpdate();
            applicationAreaRepo.save(applicationArea);
        }
        return "redirect:/applicationArea";
    }
}
