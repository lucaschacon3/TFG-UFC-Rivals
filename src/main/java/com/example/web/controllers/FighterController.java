package com.example.web.controllers;

import com.example.web.dtos.FighterDto;
import com.example.web.security.UserAppInfo;
import com.example.web.services.FavFighterService;
import com.example.web.services.FighterService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class FighterController {

    private final FighterService fighterService;
    private final FavFighterService favFighterService;

    public FighterController(FighterService fighterService, FavFighterService favFighterService) {
        this.fighterService = fighterService;
        this.favFighterService = favFighterService;
    }

    @GetMapping("/fighters")
    public String listFighters(Model model,
                               @RequestParam(defaultValue = "0") int page,
                               @RequestParam(defaultValue = "16") int size,
                               @RequestParam(defaultValue = "") String search,
                               @RequestParam(defaultValue = "") String sort,
                               @AuthenticationPrincipal UserAppInfo userApp) {


        Page<FighterDto> fightersPage = fighterService.findFilteredAndSorted(search, sort, PageRequest.of(page, size));


        model.addAttribute("fighters", fightersPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", fightersPage.getTotalPages());
        model.addAttribute("search", search);
        model.addAttribute("sort", sort);
        model.addAttribute("page", "fighters");

        model.addAttribute("favFighterIds", favFighterService.findIdFighterByIdUserApp(userApp.getId()));

        return "fighters";
    }

    @PostMapping("/fighters/favorite")
    @ResponseBody
    public ResponseEntity<Void> addFavoriteFighter(@RequestBody Map<String, Object> payload, @AuthenticationPrincipal UserAppInfo userApp) {
        if (userApp==null){
            return ResponseEntity.badRequest().build();
        }
        int fighterId = Integer.parseInt((String) payload.get("id"));
        favFighterService.save(userApp.getId(), fighterId);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/fighters/favorite")
    @ResponseBody
    public ResponseEntity<Void> deleteFavoriteFighter(@RequestBody Map<String, Object> payload) {
        int fighterId = Integer.parseInt((String) payload.get("id"));
        favFighterService.deleteById(fighterId);
        return ResponseEntity.ok().build();
    }
}
