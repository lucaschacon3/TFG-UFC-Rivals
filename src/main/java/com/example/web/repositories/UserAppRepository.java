package com.example.web.repositories;

import com.example.web.dtos.UserAppDto;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class UserAppRepository {

    private final JdbcClient jdbcClient;

    public UserAppRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    public Optional<UserAppDto> findByUsername(String username) {
        return jdbcClient.sql("SELECT * FROM user_app WHERE username = ?")
                .params(List.of(username))
                .query(UserAppDto.class)
                .list()
                .stream()
                .findFirst();
    }

    public Optional<UserAppDto> findByEmail(String email) {
        return jdbcClient.sql("SELECT * FROM user_app WHERE email = ?")
                .params(List.of(email))
                .query(UserAppDto.class)
                .list()
                .stream()
                .findFirst();
    }

    public void deleteUser(int id_user_app) {
        jdbcClient.sql("DELETE FROM user_app WHERE id_user_app = ?")
                .param(1, id_user_app)
                .update();
    }
    public void save(UserAppDto user) {
        jdbcClient.sql("""
                            INSERT INTO user_app (username, email, password)
                            VALUES (?, ?, ?)
                        """)
                .params(List.of(
                        user.getUsername(),
                        user.getEmail(),
                        user.getPassword()
                ))
                .update();
    }
    public void updateUser(Integer id_user_app, String new_username, String new_email, String new_password) {
        StringBuilder sql = new StringBuilder("UPDATE user_app SET ");
        List<Object> params = new ArrayList<>();

        if (new_username != null && !new_username.isBlank()) {
            sql.append("username = ?, ");
            params.add(new_username);
        }

        if (new_email != null && !new_email.isBlank()) {
            sql.append("email = ?, ");
            params.add(new_email);
        }

        if (new_password != null && !new_password.isBlank()) {
            sql.append("password = ?, ");
            params.add(new_password);
        }


        if (params.isEmpty()) {
            return;
        }

        sql.setLength(sql.length() - 2);

        sql.append(" WHERE id_user_app = ?");
        params.add(id_user_app);

        jdbcClient.sql(sql.toString())
                .params(params)
                .update();
    }



}

