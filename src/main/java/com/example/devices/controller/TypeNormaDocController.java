package com.example.devices.controller;

import com.example.devices.domain.Littera;
import com.example.devices.domain.TypeNormaDoc;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.TypeNormaDocRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping ("/typeNormaDoc")
public class TypeNormaDocController {
    @Autowired
    private TypeNormaDocRepo typeNormaDocRepo;

    @GetMapping
    public String typeNormaDocList(Model model){
        model.addAttribute("typeList",typeNormaDocRepo.findAll());
        return "typeNormaDocList";
    }

    @GetMapping("/delete/{typeNormaDoc}")
    public String typeNormaDocPageDelete (
            @PathVariable TypeNormaDoc typeNormaDoc, Model model) throws ResourceNotFoundException {
        model.addAttribute("typeNormaDoc",typeNormaDoc);
        if (typeNormaDoc==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "typeNormaDocDelete";
    }

    @GetMapping("/edit/{typeNormaDoc}")
    public String typeNormaDocEditForm (
            @PathVariable TypeNormaDoc typeNormaDoc, Model model) throws ResourceNotFoundException {
        model.addAttribute("typeNormaDoc",typeNormaDoc);
        if (typeNormaDoc==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "typeNormaDocEdit";
    }

    @PostMapping ("/delete")
    public String typeNormaDocDelete(@RequestParam Long typeNormaDocId){
        typeNormaDocRepo.deleteById(typeNormaDocId);
        return "redirect:/typeNormaDoc";
    }
    @PostMapping ("/add")
    public String typeNormaDocAdd(@AuthenticationPrincipal User user, @RequestParam String typeNormaname){
        TypeNormaDoc typeNormaDoc=new TypeNormaDoc(typeNormaname, user);
        typeNormaDocRepo.save(typeNormaDoc);
        return "redirect:/typeNormaDoc";
    }
    @PostMapping ("/edit")
    public String typeNormaDocEdit(
            @AuthenticationPrincipal User user,
            @RequestParam Long typeNormaDocId,
            @RequestParam String typeNormaname) throws ResourceNotFoundException{
        Optional<TypeNormaDoc> result= typeNormaDocRepo.findById(typeNormaDocId);
        if (!result.isPresent()) throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        TypeNormaDoc typeNormaDoc=result.get();
        if(!typeNormaDoc.getTypeNormaName().equals(typeNormaname)) {
            typeNormaDoc.setTypeNormaName(typeNormaname);
            typeNormaDoc.setUserUpdate(user);
            typeNormaDoc.setDateUpdate();
            typeNormaDocRepo.save(typeNormaDoc);
        }
        return "redirect:/typeNormaDoc";
    }
}
