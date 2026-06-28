package com.example.web.services;

import com.example.web.dtos.FighterDto;
import com.example.web.repositories.FighterRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FighterService {

    private final FighterRepository fighterRepository;

    public FighterService(FighterRepository fighterRepository) {
        this.fighterRepository = fighterRepository;
    }

    public List<FighterDto> findByIdFighter(Integer id) {
        return fighterRepository.findAllByIdFighter(id);
    }

    public List<FighterDto> findFightersByCategory(String category) {
        return fighterRepository.findAllByCategory(category);
    }

    public List<FighterDto> findByRankingBetween() {
        return fighterRepository.findByRankingBetween(0, 15);
    }

    public List<FighterDto> findAll() {
        return fighterRepository.findAll();
    }

    public Page<FighterDto> findFilteredAndSorted(String search, String sort, Pageable pageable) {
        Sort sortOrder = switch (sort) {
            case "weightAsc" -> Sort.by("weight").ascending();
            case "weightDesc" -> Sort.by("weight").descending();
            case "totalWinsDesc" -> Sort.by("total_wins").descending();
            case "totalWinsAsc" -> Sort.by("total_wins").ascending();
            case "winsKoDesc" -> Sort.by("wins_ko").descending();
            case "winsKoAsc" -> Sort.by("wins_ko").ascending();
            case "winsSubDesc" -> Sort.by("wins_sub").descending();
            case "winsSubAsc" -> Sort.by("wins_sub").ascending();
            default -> Sort.unsorted();
        };

        Pageable sortedPageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), sortOrder);

        if (search != null && !search.isBlank()) {
            return fighterRepository.findByNameOrNicknamePaged(sortedPageable, search);
        } else {
            return fighterRepository.findAll(sortedPageable);
        }
    }


}
