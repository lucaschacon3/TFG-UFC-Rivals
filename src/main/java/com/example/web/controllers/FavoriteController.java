package com.example.web.controllers;

import com.example.web.security.UserAppInfo;
import com.example.web.services.FavFightService;
import com.example.web.services.FavFighterService;
import com.example.web.services.FighterService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class FavoriteController {

    private final FighterService fighterService;
    private final FavFightService favFightService;
    private final FavFighterService favFighterService;

    public FavoriteController(FighterService fighterService, FavFightService favFightService, FavFighterService favFighterService) {
        this.fighterService = fighterService;
        this.favFightService = favFightService;
        this.favFighterService = favFighterService;
    }

    @GetMapping("/favorites")
    public String favorites(Model model, @AuthenticationPrincipal UserAppInfo userApp) {
        model.addAttribute("page", "user");
        model.addAttribute("fav_fights", favFightService.findByIdUserApp(userApp.getId()));
        model.addAttribute("fav_fighters", favFighterService.findByIdUserApp(userApp.getId()));
        model.addAttribute("fighters", fighterService.findAll());

        return "favorites";
    }

    @PostMapping("/favorites/delete/fight")
    @ResponseBody
    public ResponseEntity<Void> deleteFavoriteFightFavorites(@RequestBody Map<String, Object> payload) {
        int fightId = Integer.parseInt((String) payload.get("id"));
        favFightService.deleteById(fightId);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/favorites/delete/fighter")
    @ResponseBody
    public ResponseEntity<Void> deleteFavoriteFighterFavorites(@RequestBody Map<String, Object> payload) {
        int fightId = Integer.parseInt((String) payload.get("id"));
        favFighterService.deleteById(fightId);
        return ResponseEntity.ok().build();
    }
}
