-- Inserción de usuarios
INSERT INTO user_app (username, email, password)
VALUES ('admin', 'admin@example.com', '$2a$10$92RJfN5tcDaTZqxJA.ndfumcE7xCR.CMP/7CpGOZk/kYfs/Uka5W6'),
       ('lucas', 'lucas@example.com', '$2a$10$/4s2wlLcO3aJqZgyLS7SYenBQPT9BcpAX6u2tZtco4BjQ.K7bs4cy');

-- Inserción de peleadores
INSERT INTO fighter (
    name, surname, nickname, nationality, age, weight, height, reach, category,
    total_fights, total_wins, wins_ko, wins_sub, wins_dec,
    total_losses, losses_ko, losses_sub, losses_dec,
    total_draws, ranking, image
)
VALUES
    ('Islam', 'Makhachev', 'The Eagle 2.0', 'Russia', 32, 155.0, 5.8, 70.0, 'Lightweight', 26, 25, 5, 10, 10, 1, 0, 0, 1, 0, 1, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/7/MAKHACHEV_ISLAM_L_BELT_01-18.png?itok=lqIEHOin'),

    ('Jon', 'Jones', 'Bones', 'USA', 36, 205.0, 6.3, 84.5, 'Heavyweight', 29, 27, 10, 6, 11, 1, 0, 0, 1, 1, 2, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/JONES_JON_L_BELT_11-16.png?itok=V9GBsbVF'),

    ('Ilia', 'Topuria', 'El Matador', 'Spain', 27, 155.0, 5.6, 69.0, 'Lightweight', 15, 15, 6, 5, 4, 0, 0, 0, 0, 0, 3, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-04/TOPURIA_ILIA_L.png?itok=oi3hU1f2'),

    ('Merab', 'Dvalishvili', 'The Machine', 'Georgia', 33, 135.0, 5.5, 66.0, 'Bantamweight', 21, 17, 3, 3, 11, 4, 0, 1, 3, 0, 4, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/7/DVALISHVILI_MERAB_L_BELT_01-18.png?itok=m3PprJKJ'),

    ('Dricus', 'Du Plessis', 'Stillknocks', 'South Africa', 30, 185.0,  6.0, 76.0, 'Middleweight', 22, 20, 9, 8, 3, 2, 1, 0, 1, 0, 5, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-02/DU_PLESSIS_DRICUS_L_BELT_02-08.png?itok=eaxE5RwG'),

    ('Magomed', 'Ankalaev', 'Warrior', 'Russia', 31, 205.0, 6.2, 75.0, 'Light Heavyweight', 20, 18, 10, 1, 7, 1, 1, 0, 0, 1, 6, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/ANKALAEV_MAGOMED_L_BELTMOCK.png?itok=AsIN2Sm-'),

    ('Belal', 'Muhammad', 'Remember the Name', 'USA', 35, 170.0, 5.9, 72.0, 'Welterweight', 25, 22, 4, 1, 17, 3, 0, 0, 3, 0, 7, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/MUHAMMAD_BELAL_L_BELTMOCK.png?itok=PyjPld2r'),

    ('Alex', 'Pereira', 'Poatan', 'Brazil', 36, 205.0, 6.3, 79.0, 'Light Heavyweight', 12, 10, 8, 0, 2, 2, 1, 0, 1, 0, 8, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/PEREIRA_ALEX_L.png?itok=VcPMooxt'),

    ('Alexander', 'Volkanovski', 'The Great', 'Australia', 35, 145.0, 5.5, 71.5, 'Featherweight', 28, 26, 13, 3, 10, 2, 0, 0, 2, 0, 9, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2024-02/VOLKANOVSKI_ALEXANDER_L_BELT_02-17.png?itok=Yg4dyrTx'),

    ('Alexandre', 'Pantoja', 'The Cannibal', 'Brazil', 34, 125.0, 5.4, 67.0, 'Flyweight', 30, 26, 7, 10, 9, 4, 1, 1, 2, 0, 10, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/PANTOJA_ALEXANDRE_L_BELT_12-07.png?itok=qxZeUTNB'),

    ('Tom', 'Aspinall', 'No Time', 'UK', 31, 265.0, 6.4, 78.0, 'Heavyweight', 16, 14, 11, 2, 1, 2, 1, 1, 0, 0, 11, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ASPINALL_TOM_BELT_L_07-27.png?itok=GKLL6fSZ'),

    ('Max', 'Holloway', 'Blessed', 'USA', 32, 155.0, 5.9, 69.0, 'Lightweight', 32, 25, 12, 2, 11, 7, 1, 0, 6, 0, 12, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2024-04/HOLLOWAY_MAX_L_04-13.png?itok=uIj6eZON'),

    ('Sean', 'O''Malley', 'Sugar', 'USA', 30, 135.0, 5.9, 72.0, 'Bantamweight', 19, 17, 12, 1, 4, 1, 0, 0, 1, 1, 13, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/OMALLEY_SEAN_L_08-19.png?itok=myv3RIr7'),

    ('Charles', 'Oliveira', 'Do Bronx', 'Brazil', 34, 155.0, 5.8, 74.0, 'Lightweight', 36, 30, 9, 21, 0, 6, 2, 3, 1, 0, 14, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/OLIVEIRA_CHARLES_L_11-16.png?itok=VutZvq6g'),

    ('Arman', 'Tsarukyan', 'Ahalkalakets', 'Armenia', 27, 155.0, 5.7, 72.0, 'Lightweight', 23, 21, 8, 5, 8, 2, 1, 0, 1, 0, 15, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/TSARUKYAN_ARMAN_L_01-18.png?itok=Tz_2H31H'),

    ('Brandon', 'Royval', 'Raw Dog', 'USA', 31, 125.0, 5.7, 69.0, 'Flyweight', 21, 15, 5, 4, 6, 6, 2, 1, 3, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ROYVAL_BRANDON_L_10-12.png?itok=fxaENIvA'),

    ('Brandon', 'Moreno', 'The Assassin Baby', 'Mexico', 30, 125.0, 5.7, 66.0, 'Flyweight', 28, 20, 5, 10, 5, 6, 1, 1, 3, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/MORENO_BRANDON_L_03-29.png?itok=CnCVq4jp'),

    ('Amir', 'Albazi', 'The Prince', 'Iraq', 30, 125.0, 5.7, 70.0, 'Flyweight', 17, 16, 4, 5, 7, 1, 0, 0, 0, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ALBAZI_AMIR_L_06-03.png?itok=SVW_IOIX'),

    ('Kai', 'Kara-France', 'Don’t Blink', 'New Zealand', 30, 125.0, 5.6, 70.0, 'Flyweight', 34, 24, 10, 8, 6, 10, 3, 0, 7, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/KARA-FRANCE_KAI_L_08-17.png?itok=kP3IPaTE'),

    ('Tatsuro', 'Taira', 'The Silent Assassin', 'Japan', 24, 125.0, 5.7, 71.0, 'Flyweight', 13, 13, 3, 9, 1, 0, 0, 0, 0, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/TAIRA_TATSURO_L_12-09.png?itok=7ZMye-uF'),

    ('Manel', 'Kape', 'Starboy', 'Angola', 30, 125.0, 5.7, 74.0, 'Flyweight', 23, 17, 8, 5, 4, 6, 1, 1, 0, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-02/KAPE_MANEL_L_03-01.png?itok=O-xXM505'),

    ('Alex', 'Perez', 'The Cannibal', 'USA', 31, 125.0, 5.5, 70.0, 'Flyweight', 30, 24, 5, 4, 15, 6, 2, 1, 2, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/PEREZ_ALEX_L_06-15.png?itok=LQbMSF9K'),

    ('Asu', 'Almabayev', 'The Eagle', 'Kazakhstan', 28, 125.0, 5.6, 70.0, 'Flyweight', 21, 21, 8, 9, 4, 0, 0, 0, 1, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ALMABAYEV_ASU_L_06-15.png?itok=IfIz7Vfp'),

    ('Steve', 'Erceg', 'The Natural', 'Australia', 31, 145.0, 5.7, 72.0, 'Featherweight', 11, 10, 1, 5, 4, 1, 0, 0, 1, 0, NULL, 'https://www.ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ERCEG_STEVEN_L_08-17.png?itok=cZopQQ03'),

    ('Tagir', 'Ulanbekov', 'Ulanbekov', 'Russia', 32, 125.0, 5.6, 70.0, 'Flyweight', 18, 15, 1, 8, 6, 3, 0, 1, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/7/ULANBEKOV_TAGIR_L_01-18.png?itok=RfKG_X9T'),

    ('Petr', 'Yan', 'No Mercy', 'Russia', 31, 135.0, 5.6, 67.0, 'Bantamweight', 21, 16, 7, 1, 8, 5, 0, 1, 4, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/YAN_PETR_L_11-23.png?itok=8cRYCM2i'),

    ('Umar', 'Nurmagomedov', 'Nurmagomedov', 'Russia', 28, 135.0, 5.7, 69.0, 'Bantamweight', 17, 17, 2, 7, 8, 0, 0, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/NURMAGOMEDOV_UMAR_L_01-18.png?itok=X97OXEvg'),

    ('Cory', 'Sandhagen', 'The Sandman', 'USA', 32, 135.0, 5.9, 70.0, 'Bantamweight', 20, 17, 7, 3, 7, 3, 0, 2, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/SANDHAGEN_CORY_L_08-03.png?itok=hXNi-hXF'),

    ('Deiveson', 'Figueiredo', 'Deus da Guerra', 'Brazil', 36, 135.0, 5.4, 68.0, 'Bantamweight', 25, 22, 9, 10, 3, 3, 1, 1, 1, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/FIGUEIREDO_DEIVESON_L_04-13.png?itok=lhpYVc-5'),

    ('Song', 'Yadong', 'Kung Fu Monkey', 'China', 26, 135.0, 5.7, 67.0, 'Bantamweight', 26, 21, 9, 3, 9, 7, 2, 1, 4, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/YADONG_SONG_L_03-09.png?itok=2zjh7mWv'),

    ('Marlon', 'Vera', 'Chito', 'Ecuador', 31, 135.0, 5.7, 70.5, 'Bantamweight', 30, 21, 8, 10, 3, 9, 1, 3, 6, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/VERA_MARLON_L_08-03.png?itok=Qfw0DG8R'),

    ('Rob', 'Font', 'Font', 'USA', 36, 135.0, 5.7, 71.5, 'Bantamweight', 26, 20, 9, 4, 7, 6, 1, 1, 4, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-02/FONT_ROB_L_02-22.png?itok=AF5g7o1C'),

    ('Henry', 'Cejudo', 'Triple C', 'USA', 37, 135.0, 5.3, 64.0, 'Bantamweight', 20, 16, 8, 0, 8, 4, 0, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-02/CEJUDO_HENRY_L_02-22.png?itok=Hwyyh0_e'),

    ('Mario', 'Bautista', 'Bautista', 'USA', 30, 135.0, 5.7, 69.0, 'Bantamweight', 16, 13, 3, 6, 4, 3, 1, 0, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/BAUTISTA_MARIO_L_01-13.png?itok=SveBx9ds'),

    ('Diego', 'Lopes', 'Lopes', 'Brazil', 29, 145.0, 5.8, 72.0, 'Featherweight', 28, 23, 9, 11, 3, 6, 3, 1, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/LOPES_DIEGO_L_09-14.png?itok=-o2RFKjp'),

    ('Movsar', 'Evloev', 'Evloev', 'Russia', 30, 145.0, 5.7, 72.5, 'Featherweight', 18, 18, 3, 4, 11, 0, 0, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/EVLOEV_MOVSAR_L_12-07.png?itok=geMkyFuo'),

    ('Yair', 'Rodriguez', 'El Pantera', 'Mexico', 31, 145.0, 5.9, 71.0, 'Featherweight', 19, 15, 5, 4, 6, 4, 1, 2, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-04/RODRIGUEZ_YAIR_L_04-12.png?itok=M2SQXf7r'),

    ('Arnold', 'Allen', 'Almighty', 'England', 30, 145.0, 5.7, 70.0, 'Featherweight', 21, 19, 7, 4, 8, 2, 0, 1, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ALLEN_ARNOLD_L_07-27.png?itok=yso3XZix'),

    ('Brian', 'Ortega', 'T-City', 'USA', 33, 145.0, 5.7, 69.0, 'Featherweight', 19, 16, 3, 8, 5, 3, 1, 2, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ORTEGA_BRIAN_L_09-14.png?itok=nQGr2UG7'),

    ('Lerone', 'Murphy', 'Murphy', 'England', 32, 145.0, 5.7, 73.0, 'Featherweight', 14, 13, 7, 1, 5, 0, 0, 0, 0, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/MURPHY_LERONE_L_10-26.png?itok=mGUkR8YI'),

    ('Aljamain', 'Sterling', 'Funk Master', 'USA', 35, 145.0, 5.6, 71.0, 'Featherweight', 26, 23, 3, 8, 12, 4, 1, 1, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/STERLING_ALJAMAIN_L_04-13.png?itok=3vN-pNb8'),

    ('Josh', 'Emmett', 'Emmett', 'USA', 39, 145.0, 5.5, 70.0, 'Featherweight', 23, 19, 7, 2, 10, 4, 2, 0, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-04/EMMETT_JOSH_L_04-05.png?itok=10DgXQCO'),

    ('Justin', 'Gaethje', 'The Highlight', 'USA', 35, 155.0, 5.9, 70.0, 'Lightweight', 30, 25, 20, 1, 4, 5, 2, 1, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/GAETHJE_JUSTIN_L_03-08.png?itok=kwf_QNqP'),

    ('Dustin', 'Poirier', 'The Diamond', 'USA', 35, 155.0, 5.7, 72.0, 'Lightweight', 38, 29, 14, 8, 7, 8, 2, 3, 3, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/POIRIER_DUSTIN_L_06-01.png?itok=tYwkmJWo'),

    ('Dan', 'Hooker', 'The Hangman', 'New Zealand', 34, 155.0, 6.0, 75.0, 'Lightweight', 34, 23, 11, 7, 5, 11, 4, 3, 4, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/HOOKER_DAN_L_08-17.png?itok=nQrCj9pI'),

    ('Mateusz', 'Gamrot', 'Gamer', 'Poland', 33, 155.0, 5.8, 70.0, 'Lightweight', 25, 23, 8, 5, 10, 2, 0, 0, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/GAMROT_MATEUSZ_L_08-17.png?itok=G1hhQKSJ'),

    ('Paddy', 'Pimblett', 'The Baddy', 'England', 29, 155.0, 5.8, 73.0, 'Lightweight', 24, 21, 6, 9, 6, 3, 1, 1, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/PIMBLETT_PADDY_L_07-27.png?itok=8AhFK3fD'),

    ('Beneil', 'Dariush', 'Dariush', 'Iran', 35, 155.0, 5.8, 72.0, 'Lightweight', 27, 22, 5, 8, 9, 6, 3, 1, 2, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/DARIUSH_BENEIL_L_01-18.png?itok=NwvnvtHT'),

    ('Renato', 'Moicano', 'Moicano', 'Brazil', 35, 155.0, 5.9, 72.0, 'Lightweight', 25, 18, 1, 10, 7, 6, 3, 2, 1, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/12/MOICANO_RENATO_L_09-28.png?itok=shB04cps'),

    ('Sean', 'Brady', 'Brady', 'USA', 31, 170.0, 5.7, 72.5, 'Welterweight', 18, 16, 3, 4, 9, 2, 1, 0, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/BRADY_SEAN_L_09-07.png?itok=mv2_s_xe'),

    ('Shavkat', 'Rakhmonov', 'Nomad', 'Kazakhstan', 29, 170.0, 6.0, 77.0, 'Welterweight', 18, 18, 8, 10, 0, 0, 0, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/RAKHMONOV_SHAVKAT_L_12-07.png?itok=K3ZHUxcA'),

    ('Leon', 'Edwards', 'Rocky', 'England', 33, 170.0, 6.0, 74.0, 'Welterweight', 25, 22, 7, 3, 12, 3, 0, 0, 3, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/EDWARDS_LEON_L_03-22.png?itok=MiJPU4eW'),

    ('Kamaru', 'Usman', 'The Nigerian Nightmare', 'Nigeria', 36, 170.0, 6.0, 76.0, 'Welterweight', 24, 20, 9, 1, 10, 4, 1, 0, 3, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/USMAN_KAMARU_L_10-21.png?itok=wvHAAckO'),

    ('Jack', 'Della Maddalena', 'Della Maddalena', 'Australia', 27, 170.0, 5.9, 73.0, 'Welterweight', 18, 17, 11, 2, 4, 1, 1, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/DELLA_MADDALENA_JACK_L_09-16.png?itok=i8a0wa2Z'),

    ('Joaquin', 'Buckley', 'Buckley', 'USA', 30, 170.0, 5.8, 76.0, 'Welterweight', 23, 18, 12, 0, 6, 5, 3, 1, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/BUCKLEY_JOAQUIN_L_05-11.png?itok=Eo9RHVqq'),

    ('Ian', 'Machado Garry', 'The Future', 'Ireland', 26, 170.0, 6.2, 74.0, 'Welterweight', 14, 14, 7, 1, 6, 0, 0, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/GARRY_IAN_L_06-29.png?itok=_QZma9ZQ'),

    ('Gilbert', 'Burns', 'Durinho', 'Brazil', 37, 170.0, 5.8, 71.0, 'Welterweight', 28, 22, 6, 9, 7, 6, 3, 1, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/BURNS_GILBERT_L_09-07.png?itok=Tb925Ifg'),

    ('Colby', 'Covington', 'Chaos', 'USA', 36, 170.0, 5.9, 72.0, 'Welterweight', 21, 17, 4, 1, 12, 4, 1, 0, 3, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/COVINGTON_COLBY_L_12-14.png?itok=sDus9-13'),

    ('Geoff', 'Neal', 'Handz of Steel', 'USA', 34, 170.0, 5.9, 75.0, 'Welterweight', 20, 15, 9, 0, 6, 5, 2, 1, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/NEAL_GEOFF_L_10-26.png?itok=vGRC43p2'),

    ('Nassourdine', 'Imavov', 'Imavov', 'France', 29, 185.0, 6.2, 75.0, 'Middleweight', 19, 13, 5, 1, 7, 4, 1, 1, 2, 2, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/IMAVOV_NASSOURDINE_L_09-28.png?itok=FySV-4op'),

    ('Sean', 'Strickland', 'Tarzan', 'USA', 33, 185.0, 6.0, 76.0, 'Middleweight', 32, 28, 11, 4, 13, 5, 1, 1, 3, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/STRICKLAND_SEAN_L_06-01.png?itok=1H_Rlfl2'),

    ('Khamzat', 'Chimaev', 'Borz', 'Sweden', 30, 185.0, 6.1, 75.0, 'Middleweight', 13, 13, 6, 5, 2, 0, 0, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2021-11/71660%252Fprofile-galery%252Ffullbodyleft-picture%252FCHIMAEV_KHAMZAT_L_10-30.png?itok=V3ZFO1BC'),

    ('Israel', 'Adesanya', 'The Last Stylebender', 'New Zealand', 34, 185.0, 6.3, 80.0, 'Middleweight', 27, 24, 16, 0, 8, 3, 1, 0, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/ADESANYA_ISRAEL_L_02-01.png?itok=uHEBSpXh'),

    ('Robert', 'Whittaker', 'The Reaper', 'Australia', 33, 185.0, 5.9, 73.5, 'Middleweight', 31, 25, 9, 5, 11, 6, 2, 1, 3, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/WHITTAKER_ROBERT_L_10-26.png?itok=b1T7xhu8'),

    ('Caio', 'Borralho', 'Borralho', 'Brazil', 31, 185.0, 6.0, 75.0, 'Middleweight', 18, 15, 4, 4, 7, 1, 0, 0, 1, 2, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/BORRALHO_CAIO_L_08-24.png?itok=RONo-yLr'),

    ('Jared', 'Cannonier', 'The Killa Gorilla', 'USA', 40, 185.0, 5.9, 77.5, 'Middleweight', 23, 17, 10, 2, 5, 6, 2, 1, 3, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-02/CANNONIER_JARED_L_02-15.png?itok=nJ2QCV6V'),

    ('Roman', 'Dolidze', 'Dolidze', 'Georgia', 35, 185.0, 6.1, 76.0, 'Middleweight', 15, 12, 7, 3, 2, 3, 1, 1, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/DOLIDZE_ROMAN_L_10-05.png?itok=m40B84qS'),

    ('Anthony', 'Hernandez', 'Fluffy', 'USA', 30, 185.0, 6.0, 75.0, 'Middleweight', 14, 11, 2, 7, 2, 3, 1, 0, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/HERNANDEZ_ANTHONY_L_10-19.png?itok=xHRiqCVc'),

    ('Marvin', 'Vettori', 'The Italian Dream', 'Italy', 30, 185.0, 6.0, 74.0, 'Middleweight', 26, 19, 2, 9, 8, 7, 0, 2, 5, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/VETTORI_MARVIN_L_03-15.png?itok=fT6-Ivk4'),

    ('Jiri', 'Prochazka', 'Denisa', 'Czech Republic', 31, 205.0, 6.3, 80.0, 'Light Heavyweight', 33, 29, 25, 3, 1, 4, 2, 1, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/7/PROCHAZKA_JIRI_L_01-18.png?itok=LhCgFVUQ'),

    ('Carlos', 'Ulberg', 'Ulberg', 'New Zealand', 33, 205.0, 6.3, 77.0, 'Light Heavyweight', 11, 9, 6, 0, 3, 2, 1, 0, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ULBERG_CARLOS_L_05-11.png?itok=Ya9m_BwW'),

    ('Jamahal', 'Hill', 'Sweet Dreams', 'USA', 32, 205.0, 6.3, 79.0, 'Light Heavyweight', 14, 12, 7, 0, 5, 2, 1, 0, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/HILL_JAMAHAL_L_01-18.png?itok=s5fMCvfw'),

    ('Jan', 'Blachowicz', 'Prince of Cieszyn', 'Poland', 41, 205.0, 6.1, 78.0, 'Light Heavyweight', 39, 29, 9, 9, 11, 10, 2, 4, 4, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/BLACHOWICZ_JAN_L_03-22.png?itok=TDS_PpCh'),

    ('Aleksandar', 'Rakic', 'Rakic', 'Austria', 32, 205.0, 6.4, 78.0, 'Light Heavyweight', 17, 14, 9, 1, 4, 3, 1, 0, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/RAKIC_ALEKSANDAR_L_10-26.png?itok=Es-YLUP9'),

    ('Khalil', 'Rountree Jr.', 'The War Horse', 'USA', 34, 205.0, 6.0, 76.5, 'Light Heavyweight', 19, 13, 8, 0, 5, 5, 2, 0, 3, 1, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/ROUNTREE_KHALIL_L_12-09.png?itok=aXcnDWfh'),

    ('Dominick', 'Reyes', 'The Devastator', 'USA', 34, 205.0, 6.3, 77.0, 'Light Heavyweight', 17, 12, 7, 2, 3, 5, 4, 1, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/REYES_DOMINICK_L_12-07.png?itok=MsFW-60k'),

    ('Volkan', 'Oezdemir', 'No Time', 'Switzerland', 34, 205.0, 6.1, 75.0, 'Light Heavyweight', 24, 19, 12, 1, 6, 7, 5, 1, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/OEZDEMIR_VOLKAN_L_11-23.png?itok=h3gABWqo'),

    ('Nikita', 'Krylov', 'The Miner', 'Ukraine', 32, 205.0, 6.2, 77.5, 'Light Heavyweight', 38, 30, 12, 16, 2, 8, 3, 4, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-04/KRYLOV_NIKITA_L_04-12.png?itok=yKhZ1b8J'),

    ('Ciryl', 'Gane', 'Bon Gamin', 'France', 34, 265.0, 6.4, 81.0, 'Heavyweight', 14, 12, 6, 3, 3, 2, 1, 1, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/GANE_CIRYL_L_12-07.png?itok=xHAw_MFv'),

    ('Alexander', 'Volkov', 'Drago', 'Russia', 35, 265.0, 6.6, 80.0, 'Heavyweight', 47, 37, 25, 3, 9, 10, 3, 2, 5, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/VOLKOV_ALEXANDER_L_06-22.png?itok=vFYLFYZ2'),

    ('Sergei', 'Pavlovich', 'Pavlovich', 'Russia', 32, 265.0, 6.2, 84.0, 'Heavyweight', 19, 17, 14, 0, 3, 2, 2, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/PAVLOVICH_SERGEI_L_02-01.png?itok=7fYf_bcq'),

    ('Curtis', 'Blaydes', 'Razor', 'USA', 33, 265.0, 6.3, 80.0, 'Heavyweight', 21, 17, 12, 0, 5, 4, 4, 0, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/BLAYDES_CURTIS_L_03-08.png?itok=u46HNVJN'),

    ('Jailton', 'Almeida', 'Malhadinho', 'Brazil', 33, 265.0, 6.2, 79.0, 'Heavyweight', 22, 20, 7, 12, 1, 2, 1, 1, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/7/ALMEIDA_JAILTON_L_01-18.png?itok=BP77bDIe'),

    ('Serghei', 'Spivac', 'Polar Bear', 'Moldova', 29, 265.0, 6.2, 78.0, 'Heavyweight', 19, 16, 7, 7, 2, 3, 2, 1, 0, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2022-03/7976d658-43f8-4c33-9ae0-4ec3b8a2403d%252FSPIVAC_SERGHEI_L_03-05.png?itok=c_9auiAO'),

    ('Marcin', 'Tybura', 'Tybura', 'Poland', 38, 265.0, 6.2, 78.0, 'Heavyweight', 32, 24, 9, 6, 9, 8, 5, 1, 2, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-03/TYBURA_MARCIN_L_03-22.png?itok=DDbTM3HF'),

    ('Derrick', 'Lewis', 'The Black Beast', 'USA', 39, 265.0, 6.2, 79.0, 'Heavyweight', 40, 27, 22, 1, 4, 13, 7, 1, 5, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/LEWIS_DERRICK_L_11-02.png?itok=cpfc0Eg2'),

    ('Tai', 'Tuivasa', 'Bam Bam', 'Australia', 31, 265.0, 6.1, 75.0, 'Heavyweight', 20, 15, 13, 0, 2, 5, 3, 1, 1, 0, NULL, 'https://ufc.com/images/styles/athlete_bio_full_body/s3/2025-01/5/TUIVASA_TAI_L_08-17.png?itok=ki-GFieH');


