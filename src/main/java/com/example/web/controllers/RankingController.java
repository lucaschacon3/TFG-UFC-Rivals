package com.example.web.controllers;

import com.example.web.services.FighterService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RankingController {

    private final FighterService fighterService;

    public RankingController(FighterService fighterService) {
        this.fighterService = fighterService;
    }

    @GetMapping("/ranking")
    public String ranking(Model model) {
        model.addAttribute("page", "ranking");
        model.addAttribute("fighters", fighterService.findByRankingBetween());
        return "ranking";
    }
}
