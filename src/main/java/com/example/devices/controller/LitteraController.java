package com.example.devices.controller;

import com.example.devices.domain.Device;
import com.example.devices.domain.Littera;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.LitteraRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/littera")
public class LitteraController {

    @Autowired
    private LitteraRepo litteraRepo;

    @GetMapping
    public String litteraList(Model model){
        model.addAttribute("litteras",litteraRepo.findAll());
        return "litteraList";
    }

    @GetMapping ("/delete/{littera}")
    public String litteraPageDelete (@PathVariable Littera littera, Model model) throws ResourceNotFoundException {
        model.addAttribute("littera",littera);
        if (littera==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "litteraDelete";
    }

    @GetMapping ("/edit/{littera}")
    public String litteraEditForm (@PathVariable Littera littera, Model model) throws ResourceNotFoundException {
        model.addAttribute("littera",littera);
        if (littera==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "litteraEdit";
    }


    @PostMapping("/delete")
    public String litteraDelete (@RequestParam Long litteraId){
        litteraRepo.deleteById(litteraId);
        return "redirect:/littera";
    }

    @PostMapping("/add")
    public String litteraAdd (@AuthenticationPrincipal User user, @RequestParam String litteraname){
        Littera littera=new Littera(litteraname, user);
        litteraRepo.save(littera);
        return "redirect:/littera";
    }

    @PostMapping("/edit")
    public String litteraEdit (
            @AuthenticationPrincipal User user,
            @RequestParam Long litteraId,
            @RequestParam String litteraname
    ) throws ResourceNotFoundException {
        Optional<Littera> result= litteraRepo.findById(litteraId);
        if (!result.isPresent()) throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        Littera littera=result.get();
        if (!littera.getLitteraName().equals(litteraname)) {
            littera.setLitteraName(litteraname);
            littera.setUserUpdate(user);
            littera.setDateUpdate();
            litteraRepo.save(littera);
        }
        return "redirect:/littera";
    }
}
