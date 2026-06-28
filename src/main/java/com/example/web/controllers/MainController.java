package com.example.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("page", "home");
        return "home";
    }

    @GetMapping("/privacy")
    public String privacy(Model model) {
        model.addAttribute("page", "home");
        return "privacy";
    }
}
