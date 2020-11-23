package com.example.devices.controller;

import com.example.devices.domain.Dce;
import com.example.devices.domain.DceNormativeDoc;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.DceNormativeDocRepo;
import com.example.devices.repos.DceRepo;
import com.example.devices.repos.NormativeDocRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dceNormativeDoc")
public class DceNormativeDocController {
    @Autowired
    private DceRepo dceRepo;

    @Autowired
    private NormativeDocRepo normativeDocRepo;

    @Autowired
    private DceNormativeDocRepo dceNormativeDocRepo;

    @GetMapping
    public String dceNormaList(Model model){
        model.addAttribute("dceNormaList",dceNormativeDocRepo.findAll());
        model.addAttribute("dceList", dceRepo.findAll());
        model.addAttribute("normativeDocList", normativeDocRepo.findAll());
        return "dceNormaList";
    }
    @GetMapping ("/delete/{dceNorma}")
    public String dcePageDelete(@PathVariable DceNormativeDoc dceNorma, Model model) throws ResourceNotFoundException {
        model.addAttribute("dceNorma", dceNorma);
        if (dceNorma==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "dceNormaDelete";
    }

    @PostMapping ("/add")
    public String dceNormaAdd(
            @AuthenticationPrincipal User user,
            @RequestParam String selectDce,
            @RequestParam String selectNormativeDoc){
        DceNormativeDoc dceNorma=new DceNormativeDoc(
                dceRepo.findById(Long.parseLong(selectDce)).get(),
                normativeDocRepo.findById(Long.parseLong(selectNormativeDoc)).get(),
                user);
        dceNormativeDocRepo.save(dceNorma);
        return "redirect:/dceNormativeDoc";
    }

    @PostMapping("/delete")
    public String dceNormaDelete (@RequestParam Long dceNormaId){
        dceNormativeDocRepo.deleteById(dceNormaId);
        return "redirect:/dceNormativeDoc";
    }
}
