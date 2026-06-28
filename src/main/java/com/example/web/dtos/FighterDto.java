package com.example.web.dtos;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FighterDto {
    private Integer id_fighter;

    private String name;
    private String surname;
    private String nickname;
    private String nationality;
    private int age;

    private float weight;
    private float height;
    private float reach;

    private String category;

    private int total_fights;

    private int total_wins;
    private int wins_ko;
    private int wins_sub;
    private int wins_dec;


    private int total_losses;
    private int losses_ko;
    private int losses_sub;
    private int losses_dec;


    private int total_draws;

    private Integer ranking;
    private String image;
}
