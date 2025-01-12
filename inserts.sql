USE bd_laby

INSERT INTO STANOWISKA (NAZWA, POZIOM_DOSTEPU) VALUES
('Właściciel', 0),
('Sekretarz', 1),
('Kierownik Magazynu', 2),
('Kierownik Warsztatu', 2);

INSERT INTO PLACOWKI (NAZWA, ILOSC_SUROWCA, KOD_POCZTOWY, ULICA, NUMER_BUDYNKU) VALUES
('Warsztat', 100.00, '00-123', 'Marszalkowska', 1),
('Magazyn', 200.50, '01-456', 'Koszykowa', 12);

INSERT INTO FIRMY_TRANSPORTOWE (NAZWA, NUMER_TELEFONU, EMAIL) VALUES
('TransportExpress', '182313823', 'transportexpress65@gmail.com'),
('TransportX', '537856154', 'transportx638@gmail.com'),
('MegaX', '006387091', 'megax6@gmail.com'),
('GoldExpress', '222096908', 'goldexpress372@gmail.com'),
('TransportDostawa', '860749601', 'transportdostawa400@gmail.com');

INSERT INTO PRACOWNICY (IMIE, NAZWISKO, EMAIL, CZY_PRACUJE, PRZELOZONY, MIEJSCE_PRACY, STANOWISKO) VALUES
('Bartosz', 'Kozak',             'bartosz220@gmail.com', 1, NULL,         NULL,               'Właściciel'),
('Adam',   'Nowak',             'adam270@gmail.com',     1, 0,            NULL,                 'Sekretarz'),
('Krzysztof', 'Wojcik',        'krzysztof800@gmail.com', 1, 0,           'Magazyn',           'Kierownik Magazynu'),
('Jan',    'Kowalski',          'jan95@gmail.com',       1, 0,            'Warsztat',          'Kierownik Warsztatu'),
('Piotr',  'Wojcik',            'piotr166@gmail.com',    0, 2,            NULL,               NULL),
('Filip',  'Kozak',             'filip480@gmail.com',    1, 3,            'Warsztat',         NULL),
('Piotr',  'Majkut',            'piotr808@gmail.com',    0, 2,            NULL,               NULL),
('Krzysztof', 'Wojcik',        'krzysztof162@gmail.com', 1, 2,           'Magazyn',               NULL),
('Rafal',  'Majkut',            'rafal930@gmail.com',    1, 3,            'Warsztat',         NULL),
('Michal', 'Nowak',             'michal125@gmail.com',   0, 3,            NULL,               NULL),
('Jan',    'Nowak',             'jan336@gmail.com',      1, 2,            'Magazyn',               NULL),
('Krzysztof', 'Lis',           'krzysztof181@gmail.com', 0, 3,            NULL,               NULL),
('Piotr',  'Wiwniewski',        'piotr641@gmail.com',    1, 3,            'Warsztat',         NULL),
('Bartosz', 'Kozak',            'bartosz369@gmail.com',  0, 3,            NULL,               NULL),
('Michal', 'Zielinski',         'michal211@gmail.com',   0, 3,            NULL,               NULL),
('Krzysztof', 'Majewski',       'krzysztof682@gmail.com', 0, 2,            NULL,               NULL),
('Filip',  'Kozak',             'filip267@gmail.com',    0, 2,            NULL,               NULL),
('Andrzej', 'Lis',              'andrzej678@gmail.com',  1, 3,            'Warsztat',         NULL),
('Oskar',  'Kozak',             'oskar620@gmail.com',    0, 2,            NULL,               NULL),
('Oskar',  'Majkut',            'oskar326@gmail.com',    1, 2,            'Magazyn',          NULL),
-- dodatkowe dane zeby dzialaly zapytania
('Maciej',  'Wesolowski',        'maciekk@gmail.com',    0, 0,            'Magazyn',         'Kierownik Magazynu'),
('Karolina',  'Wojciechowska',        'karolinaa@gmail.com',    1, 0,            'Magazyn',         'Kierownik Magazynu'),
('Aleksander', 'Debski',            'aleksanderr@gmail.com',  0, 0,            NULL,               'Sekretarz');


INSERT INTO ZAMOWIENIA_NA_ZLOTO ([DATA], KOSZT, [STATUS], ILOSC, DOSTARCZANA_DO, FIRMA_TRANSPORTOWA) VALUES
('2011-04-19', 132798.94, 'zrealizowane', 246.54, 'Magazyn', 'MegaX'),
('2022-11-11', 189638.94, 'dostarczane', 411.06, 'Warsztat', 'GoldExpress'),
('2019-04-16', 197432.44, 'dostarczane', 224.47, 'Magazyn', 'TransportX'),
('2001-03-09', 175155.55, 'w realizacji', 222.88, 'Warsztat', 'GoldExpress'),
-- dodatkowe dane zeby dzialaly zapytania
('2007-10-27', 29347.01, 'dostarczane', 277.02, 'Magazyn', 'TransportExpress'),
('2024-01-15', 125000.50, 'zrealizowane', 450.25, 'Magazyn', 'GoldExpress'),
('2024-02-10', 94523.00, 'dostarczane', 425.00, 'Warsztat', 'MegaX'),
('2024-03-05', 175432.80, 'w realizacji', 460.75, 'Magazyn', 'TransportX'),
('2024-04-18', 55600.25, 'zrealizowane', 495.40, 'Warsztat', 'GoldExpress'),
('2024-05-12', 135000.75, 'dostarczane', 480.00, 'Magazyn', 'TransportExpress'),
('2024-06-25', 45000.50, 'zrealizowane', 120.00, 'Warsztat', 'MegaX'),
('2024-07-08', 155000.90, 'dostarczane', 470.50, 'Magazyn', 'GoldExpress'),
('2024-08-14', 198000.40, 'w realizacji', 355.00, 'Warsztat', 'TransportX'),
('2024-09-19', 130500.30, 'zrealizowane', 485.20, 'Magazyn', 'GoldExpress'),
('2024-10-23', 178000.15, 'dostarczane', 245.80, 'Warsztat', 'TransportExpress'),
('2024-11-05', 21240.00, 'w realizacji', 413.25, 'Magazyn', 'MegaX'),
('2024-12-10', 145000.60, 'zrealizowane', 315.60, 'Warsztat', 'GoldExpress'),
('2024-01-28', 115432.75, 'dostarczane', 480.00, 'Magazyn', 'TransportX'),
('2024-02-17', 175600.20, 'zrealizowane', 465.50, 'Warsztat', 'TransportExpress'),
('2024-03-22', 125000.80, 'w realizacji', 430.75, 'Magazyn', 'GoldExpress');

INSERT INTO PARTIE_SUROWCA (WAGA, DATA_DOSTAWY, ZAMOWIENIE) VALUES
(22.97, '2023-07-29', 2),
(33.26, '2021-10-21', 2),
(25.70, '2016-07-19', 4),
(51.34, '2024-09-02', 4),
(4.97, '2005-10-12', 1),
(27.42, '2005-10-22', 3),
(35.37, '2019-03-07', 1),
(16.64, '2012-08-12', 3),
(73.63, '2001-03-13', 3),
(65.79, '2005-10-05', 1),
(50.12, '2020-11-10', 1),
(9.29, '2002-10-03', 1),
(80.27, '2011-08-27', 1),
(7.48, '2012-06-07', 1),
(29.87, '2008-06-10', 3),
(41.36, '2016-05-16', 1),
(21.06, '2019-03-08', 2),
(92.74, '2006-10-15', 3),
(1.79, '2018-10-07', 3),
(92.63, '2004-03-18', 3);

INSERT INTO PRODUKTY (NAZWA, KOSZT_PRODUKCJI, CENA_SPRZEDAZY, ILOSC_SUROWCA_POTRZEBNA_DO_WYPRODUKOWANIA, ILOSC, CZY_PRODUKOWANY, MARZA, MIEJSCE_SKLADOWANIA) VALUES
('Sygnet typu 1',       4122.32,    6279.51,    2.79,   46, 1, '152%', 'Warsztat'),
('Sygnet typu 3',       2642.19,    9787.35,    1.20,   14, 1, '370%', 'Magazyn'),
('Sygnet typu 5',       1045.63,    20908.66,   10.37,  46, 1, '1999%', 'Warsztat'),
('Broszka typu 3',      1150.53,    16074.34,   3.77,   2,  0, '1397%', NULL),
('Kolczyki typu 2',     1326.60,    24715.00,   8.40,   97, 0, '1863%', NULL),
('Pierscionek typu 2',  3444.70,    23536.56,   10.79,  8, 1, '683%', 'Warsztat'),
('Naszyjnik typu 5',    3354.01,    7276.85,    10.75,  88, 0, '216%', NULL),
('Bransoletka typu 4',  710.44,     6969.47,    6.23,   1, 1, '981%', 'Magazyn'),
('Bransoletka typu 1',  1059.07,    17915.27,   6.02,   73, 0, '1691%', NULL),
('Pierscionek typu 1',  220.66,     2866.00,    14.51,  42, 0, '1265%', NULL),
('Naszyjnik typu 1',    4862.99,    23846.51,   0.37,   25, 1, '490%', 'Warsztat'),
('Broszka typu 1',      518.01,     15267.07,   3.68,   41, 1, '2947%', 'Magazyn'),
('Naszyjnik typu 4',    170.05,     3065.11,    0.63,   74, 1, '1802%', 'Warsztat'),
('Bransoletka typu 0',  628.02,     22760.70,   13.32,  35, 1, '3624%', 'Warsztat'),
('Broszka typu 5',      4125.38,    23424.71,   7.61,   80, 1, '567%', 'Magazyn'),
('Bransoletka typu 3',  4246.42,    18448.55,   7.63,   17, 1, '434%', 'Magazyn'),
('Pierscionek typu 5',  462.49,     5089.86,    9.92,   6, 0, '1100%', NULL),
('Sygnet typu 0',       2935.47,    15880.38,   10.29,  63, 0, '540%', NULL),
('Bransoletka typu 2',  1043.64,    22695.89,   9.80,   93, 0, '2174%', NULL),
('Kolczyki typu 1',     2248.97,    12700.89,   11.98,  70, 0, '564%', NULL);

INSERT INTO KLIENCI (NIP, NAZWA, EMAIL, NUMER_TELEFONU) VALUES
('8269934673', 'Swarovski', 'swarovski577@gmail.com', '238689592'),
('9654153614', 'Pandora', 'pandora305@gmail.com', '198107529'),
('7563736867', 'Cartier', 'cartier695@gmail.com', '007425072'),
('3186256726', 'Tiffany & Co.', 'tiffany&co.654@gmail.com', '666727598'),
('4468258529', 'Harry Winston', 'harrywinston673@gmail.com', '967108617'),
('1791688658', 'Chopard', 'chopard581@gmail.com', '027444893'),
('1443418142', 'Bvlgari', 'bvlgari636@gmail.com', '140356456'),
('4615435829', 'Van Cleef & Arpels', 'vancleef&arpels414@gmail.com', '103988393'),
('5212445276', 'Michael Kors', 'michaelkors621@gmail.com', '770003051'),
('2185715883', 'Zales', 'zales798@gmail.com', '742614245'),
('6866963999', 'Kay Jewelers', 'kayjewelers717@gmail.com', '514213085'),
('5163288629', 'Blue Nile', 'bluenile324@gmail.com', '448277884'),
('9656138782', 'Jared', 'jared183@gmail.com', '751794839'),
('4959994644', 'H. Samuel', 'h.samuel569@gmail.com', '376409992'),
('4257871484', 'Ernest Jones', 'ernestjones489@gmail.com', '510525431'),
('9822547923', 'Thomas Sabo', 'thomassabo388@gmail.com', '068507102'),
('6471446111', 'Mikimoto', 'mikimoto266@gmail.com', '901091345'),
('9448779113', 'David Yurman', 'davidyurman590@gmail.com', '289337550'),
('9886685418', 'Aliexpress', 'aliexpress758@gmail.com', '251268706'),
('5677525133', 'Etsy', 'etsy306@gmail.com', '142149365');

INSERT INTO ZAMOWIENIA_NA_PRODUKTY ([DATA], [STATUS], KLIENT) VALUES
-- Zmienione daty, zeby pasowaly do zapytan
('2024-07-07', 'anulowane', '6866963999'),
('2024-09-10', 'przyjęte', '5212445276'),
('2024-11-21', 'anulowane', '3186256726'),
('2024-06-17', 'anulowane', '5212445276'),
('2024-09-16', 'zrealizowane', '6866963999'),
('2024-05-18', 'w realizacji', '4615435829'),
('2024-10-12', 'zrealizowane', '1791688658'),
('2024-02-07', 'zrealizowane', '3186256726'),
('2024-02-14', 'anulowane', '1443418142'),
('2024-01-28', 'zrealizowane', '7563736867'),
('2024-10-20', 'zrealizowane', '9448779113'),
('2024-03-09', 'w realizacji', '4468258529'),
('2024-07-07', 'zrealizowane', '4468258529'),
('2024-03-04', 'zrealizowane', '9654153614'),
('2024-07-27', 'anulowane', '3186256726'),
('2024-02-07', 'w realizacji', '1443418142'),
('2024-11-29', 'zrealizowane', '6866963999'),
('2024-07-17', 'anulowane', '4257871484'),
('2024-09-16', 'zrealizowane', '8269934673'),
('2024-03-14', 'przyjęte', '4959994644');

INSERT INTO ZAMOWIONE_PRODUKTY (ID_PRODUKTU, ID_ZAMOWIENIA, ILOSC) VALUES
('Naszyjnik typu 5', 9, 39),
('Sygnet typu 0', 12, 5),
('Pierscionek typu 1', 4, 10),
('Sygnet typu 3', 10, 23),
('Kolczyki typu 1', 15, 25),
('Sygnet typu 5', 0, 16),
('Pierscionek typu 2', 3, 46),
('Sygnet typu 1', 5, 41),
('Naszyjnik typu 5', 6, 32),
('Bransoletka typu 2', 11, 13),
('Pierscionek typu 2', 8, 4),
('Bransoletka typu 0', 7, 5),
('Broszka typu 5', 1, 50),
('Sygnet typu 0', 14, 40),
('Sygnet typu 5', 13, 48),
('Naszyjnik typu 1', 2, 13),
('Sygnet typu 1', 19, 40),
('Broszka typu 5', 17, 43),
('Naszyjnik typu 5', 18, 29),
('Kolczyki typu 2', 16, 36);