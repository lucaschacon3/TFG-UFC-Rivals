package com.example.web.dtos;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavFighterDto {
    private Integer id_user_app;
    private Integer id_fighter;
}