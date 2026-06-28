package com.example.web.repositories;

import com.example.web.dtos.FavFighterDto;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FavFighterRepository {

    private final JdbcClient jdbcClient;

    public FavFighterRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    public void save(int id_user_app, int fighter_id) {
        jdbcClient.sql("""
            INSERT INTO fav_fighter (id_user_app, id_fighter)
            VALUES (?, ?)
        """)
                .param(1, id_user_app)
                .param(2, fighter_id)
                .update();
    }

    public void deleteById(int idFighter) {
        jdbcClient.sql("DELETE FROM fav_fighter WHERE id_fighter = ?")
                .param(1, idFighter)
                .update();
    }

    public List<FavFighterDto> findByIdUserApp(int idUserApp) {
        return jdbcClient.sql("""
                        SELECT *
                        FROM fav_fighter
                        WHERE id_user_app=  ?
                        """)
                .param(1, idUserApp)
                .query(FavFighterDto.class)
                .list();
    }

    public List<Integer> findIdFighterByIdUserApp(int idUserApp) {
        return jdbcClient.sql("""
                        SELECT id_fighter
                        FROM fav_fighter
                        WHERE id_user_app=  ?
                        """)
                .param(1, idUserApp)
                .query(Integer.class)
                .list();
    }
}
