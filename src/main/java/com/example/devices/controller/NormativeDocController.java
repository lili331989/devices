package com.example.devices.controller;

import com.example.devices.domain.Littera;
import com.example.devices.domain.NormativeDoc;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.ApplicationAreaRepo;
import com.example.devices.repos.NormativeDocRepo;
import com.example.devices.repos.TypeNormaDocRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/normativeDoc")
public class NormativeDocController {
    @Autowired
    private NormativeDocRepo normativeDocRepo;

    @Autowired
    private ApplicationAreaRepo applicationAreaRepo;

    @Autowired
    private TypeNormaDocRepo typeNormaDocRepo;

    @GetMapping
    public String normativeDocList(Model model){
        model.addAttribute("normativeList", normativeDocRepo.findAll());
        model.addAttribute("applicationList", applicationAreaRepo.findAll());
        model.addAttribute("typeList", typeNormaDocRepo.findAll());
        return "normativeDocList";
    }

    @GetMapping("/delete/{normativeDoc}")
    public String normativeDocPageDelete (
            @PathVariable NormativeDoc normativeDoc, Model model) throws ResourceNotFoundException {
        model.addAttribute("normativeDoc", normativeDoc);
        if (normativeDoc==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "normativeDocDelete";
    }

    @GetMapping("/edit/{normativeDoc}")
    public String normativeDocEditForm (
            @PathVariable NormativeDoc normativeDoc, Model model) throws ResourceNotFoundException {
        model.addAttribute("applicationList", applicationAreaRepo.findAll());
        model.addAttribute("typeList", typeNormaDocRepo.findAll());
        model.addAttribute("normativeDoc", normativeDoc);
        if (normativeDoc==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "normativeDocEdit";
    }

    @PostMapping ("/delete")
    public String normativeDocDelete (@RequestParam Long normativeDocId){
        normativeDocRepo.deleteById(normativeDocId);
        return "redirect:/normativeDoc";
    }

    @PostMapping ("/add")
    public String applicationAreaAdd (
            @AuthenticationPrincipal User user,
            @RequestParam String normativeDocNum,
            @RequestParam String normativeDocName,
            @RequestParam String selectTypeNormaDoc,
            @RequestParam String selectApplicationArea)  {
        NormativeDoc normativeDoc=new NormativeDoc(normativeDocNum, normativeDocName, typeNormaDocRepo.findById(Long.parseLong(selectTypeNormaDoc)).get(),applicationAreaRepo.findById(Long.parseLong(selectApplicationArea)).get(),user);
        normativeDocRepo.save(normativeDoc);
        return "redirect:/normativeDoc";
    }

    @PostMapping ("/edit")
    public String applicationAreaEdit (
            @AuthenticationPrincipal User user,
            @RequestParam Long normativeDocId,
            @RequestParam String normativeDocNum,
            @RequestParam String normativeDocName,
            @RequestParam String selectTypeNormaDoc,
            @RequestParam String selectApplicationArea) throws ResourceNotFoundException {

        Optional<NormativeDoc> result= normativeDocRepo.findById(normativeDocId);
        if (!result.isPresent()) throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        NormativeDoc normativeDoc=result.get();

        normativeDoc.setNormativeNum(normativeDocNum);
        normativeDoc.setNormativeName(normativeDocName);
        normativeDoc.setTypeNormaDoc(typeNormaDocRepo.findById(Long.parseLong(selectTypeNormaDoc)).get());
        normativeDoc.setApplicationArea(applicationAreaRepo.findById(Long.parseLong(selectApplicationArea)).get());
        normativeDoc.setUserUpdate(user);
        normativeDoc.setDateUpdate();
        normativeDoc.setDateUpdate();
        normativeDocRepo.save(normativeDoc);
        return "redirect:/normativeDoc";
    }
}
