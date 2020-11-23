package com.example.devices.controller;

import com.example.devices.domain.Littera;
import com.example.devices.domain.Role;
import com.example.devices.domain.User;
import com.example.devices.exceptions.ResourceNotFoundException;
import com.example.devices.repos.RoleRepo;
import com.example.devices.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority ('ROLE_ADMIN')")
public class UserController {

    @Autowired
    private UserRepo userRepo;
    @Autowired
    private RoleRepo roleRepo;

    @GetMapping
    public String userList( Model model){
        model.addAttribute("users",userRepo.findAll());
        model.addAttribute("roles", roleRepo.findAll());
        return "userList";
    }

    @GetMapping ("{user}")
    public String userEditForm (@PathVariable User user, Model model) throws ResourceNotFoundException{
        model.addAttribute("user", user);
        model.addAttribute("roles", roleRepo.findAll());
        if (user==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "userEdit";
    }

    @GetMapping ("delete/{user}")
    public String userDelete(@PathVariable User user, Model model) throws ResourceNotFoundException {
        model.addAttribute("user", user);
        if (user==null){
            throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        }
        return "userDelete";
    }


    @PostMapping
    public String userSave (
            @AuthenticationPrincipal User userUpdate,
            @RequestParam  String username,
            @RequestParam  String userpassword,
            @RequestParam  String userfirstname,
            @RequestParam  String userlastname,
            @RequestParam  String useradditionalname,
            @RequestParam Map<String, String> form,
            @RequestParam (required = false) String useractive,
            @RequestParam Long userId) throws ResourceNotFoundException{
        Optional<User> result= userRepo.findById(userId);
        if (!result.isPresent()) throw new ResourceNotFoundException("Данный объект не существует, обновите таблицу");
        User user=result.get();
        user.setUsername(username);
        user.setPassword(userpassword);
        user.setFirstname(userfirstname);
        user.setLastname(userlastname);
        user.setAdditionalname(useradditionalname);
        List<Role> roles =roleRepo.findAll();
        user.getRoles().clear();
        if ("on".equals(useractive)) user.setActive(true);
        else user.setActive(false);

        for (String key: form.keySet()){
            Role role=roleRepo.findByName(key);
            if (roles.contains(role)) user.getRoles().add(role);
        }
        user.setDateUpdate();
        user.setUserUpdate(userUpdate);
        userRepo.save (user);
        return "redirect:/user";
    }


    @PostMapping("add")
    public String addUser (
            @AuthenticationPrincipal User userCreate,
            @RequestParam String username,
            @RequestParam String userpassword,
            @RequestParam String userfirstname,
            @RequestParam String userlastname,
            @RequestParam String useradditionalname,
            @RequestParam Map<String, String> form,
            @RequestParam (required = false) String useractive,
            Model model
    ) throws ResourceNotFoundException{
        User userFromDb = userRepo.findByUsername(username);
        if (userFromDb != null){
            throw new ResourceNotFoundException("Данный пользователь " + username+" уже существует");
        }

        User user= new User(userCreate);
        user.setUsername(username);
        user.setPassword(userpassword);
        user.setFirstname(userfirstname);
        user.setLastname(userlastname);
        user.setAdditionalname(useradditionalname);
        List<Role> roles =roleRepo.findAll();
        Set<Role> userRoles= new HashSet<>();
        for (String key: form.keySet()){
            Role role=roleRepo.findByName(key);
            if (roles.contains(role)) userRoles.add(role);
        }
        user.setRoles(userRoles);
        if ("on".equals(useractive)) user.setActive(true);
        else user.setActive(false);
        userRepo.save (user);
        return "redirect:/user";
    }

    @PostMapping("delete")
    public String delete(@RequestParam Long userId){
        userRepo.deleteById(userId);
        return "redirect:/user";
    }

}
