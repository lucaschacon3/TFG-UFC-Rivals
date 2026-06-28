package com.example.web.services;

import com.example.web.dtos.FavFightDto;
import com.example.web.repositories.FavFightRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavFightService {

    private final FavFightRepository favFightRepository;

    public FavFightService(FavFightRepository favFightRepository) {
        this.favFightRepository = favFightRepository;
    }

    public void save(FavFightDto favFight) {
        favFightRepository.save(favFight);
    }

    public void deleteById(int idFight) {
        favFightRepository.deleteById(idFight);
    }

    public List<FavFightDto> findByIdUserApp(int idUserApp) {
        return favFightRepository.findByIdUserApp(idUserApp);

    }

}
