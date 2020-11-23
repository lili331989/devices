package com.example.devices.controller;

import com.example.devices.exceptions.ResourceNotFoundException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(DataIntegrityViolationException.class)
    public String deleteErrorPage(Model model) {
        model.addAttribute("message", "Данный объект удалить нельзя, так как он используется в других таблицах");
        return "error";
    }

    @ExceptionHandler({EmptyResultDataAccessException.class})
    public String noObject(Model model) {
        model.addAttribute("message", "Данный объект не существует, обновите таблицу");
        return "error";
    }

    @ExceptionHandler({ResourceNotFoundException.class})
    public String resourceNotFound(Model model, ResourceNotFoundException ex ) {
        model.addAttribute("message", ex.getMessage());
        return "error";
    }
}
