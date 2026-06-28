package com.example.web.repositories;

import com.example.web.dtos.FavFightDto;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FavFightRepository {

    private final JdbcClient jdbcClient;

    public FavFightRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    public void save(FavFightDto favFight) {
        jdbcClient.sql("""
            INSERT INTO fav_fight (id_user_app, id_fighter1, id_fighter2, percentage_f1, percentage_f2, date_fight)
            VALUES (?, ?, ?, ?, ?,?)
        """)
                .param(1, favFight.getId_user())
                .param(2, favFight.getId_fighter1())
                .param(3, favFight.getId_fighter2())
                .param(4, favFight.getPercentage_f1())
                .param(5, favFight.getPercentage_f2())
                .param(6, favFight.getDate_fight())
                .update();
    }

    public void deleteById(int idFight) {
        jdbcClient.sql("DELETE FROM fav_fight WHERE id_fight = ?")
                .param(1, idFight)
                .update();
    }

    public List<FavFightDto> findByIdUserApp(int idUserApp) {
        return jdbcClient.sql("""
                        SELECT *
                        FROM fav_fight
                        WHERE id_user_app=  ?
                        """)
                .param(1, idUserApp)
                .query(FavFightDto.class)
                .list();
    }
}
