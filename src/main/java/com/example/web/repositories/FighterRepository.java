package com.example.web.repositories;


import com.example.web.dtos.FighterDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
public class FighterRepository {

    private final JdbcClient jdbcClient;

    public FighterRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    public List<FighterDto> findByRankingBetween(int start, int end) {
        return jdbcClient.sql("""
                        SELECT *
                        FROM fighter
                        WHERE ranking BETWEEN ? AND ?
                        """)
                .param(1, start)
                .param(2, end)
                .query(FighterDto.class)
                .list();
    }


    public List<FighterDto> findAllByIdFighter(int idFighter) {
        return jdbcClient.sql("""
                SELECT *
                FROM fighter
                WHERE id_fighter = ?
                """)
                .param(1, idFighter)
                .query(FighterDto.class)
                .list();
    }

    public List<FighterDto> findAllByCategory(String category) {
        return jdbcClient.sql("""
                SELECT *
                FROM fighter
                WHERE category = ?
                """)
                .param(1, category)
                .query(FighterDto.class)
                .list();
    }

    public Page<FighterDto> findByNameOrNicknamePaged(Pageable pageable, String search) {
        String pattern = "%" + search.toLowerCase() + "%";
        List<FighterDto> fullList = jdbcClient.sql("""
                SELECT *
                FROM fighter
                WHERE LOWER(name) LIKE ? OR LOWER(nickname) LIKE ?
                """)
                .param(1, pattern)
                .param(2, pattern)
                .query(FighterDto.class)
                .list();

        int start = pageable.getPageNumber() * pageable.getPageSize();
        int end = Math.min(start + pageable.getPageSize(), fullList.size());
        List<FighterDto> pageList = start > fullList.size() ? Collections.emptyList() : fullList.subList(start, end);

        return new PageImpl<>(pageList, pageable, fullList.size());
    }

    public List<FighterDto> findAll() {
        return jdbcClient.sql("""
                SELECT *
                FROM fighter
                """)
                .query(FighterDto.class)
                .list();
    }
    public Page<FighterDto> findAll(Pageable pageable) {
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int offset = currentPage * pageSize;

        String orderBy = pageable.getSort().isSorted()
                ? pageable.getSort().stream()
                .map(order -> order.getProperty() + " " + order.getDirection())
                .reduce((a, b) -> a + ", " + b)
                .orElse("id_fighter ASC")
                : "id_fighter ASC";

        String sql = """
            SELECT *
            FROM fighter
            ORDER BY %s
            LIMIT ? OFFSET ?
            """.formatted(orderBy);

        List<FighterDto> fighters = jdbcClient.sql(sql)
                .param(1, pageSize)
                .param(2, offset)
                .query(FighterDto.class)
                .list();

        int total = jdbcClient.sql("SELECT COUNT(*) FROM fighter")
                .query(Integer.class)
                .single();

        return new PageImpl<>(fighters, pageable, total);
    }

}


