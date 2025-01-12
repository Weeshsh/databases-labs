USE bd_laby;

-- [1]
-- Sugestia: Wydatki miesieczne na zloto w 2024.
-- Modyfikacja: Brak. 
SELECT 
    FORMAT([DATA], 'yyyy-MM') AS miesiac,
    SUM(KOSZT) AS koszta
FROM ZAMOWIENIA_NA_ZLOTO
WHERE YEAR([DATA])=2024
GROUP BY FORMAT([DATA], 'yyyy-MM')
ORDER BY miesiac ASC;

-- [2]
-- Sugestia: Pracownicy, ktorzy nie pracuja ale nadal maja dostep do bazy danych.
-- Modyfikacja: Brak.
SELECT 
    IMIE, 
    NAZWISKO,
    STANOWISKO
FROM PRACOWNICY
JOIN STANOWISKA ON PRACOWNICY.STANOWISKO = STANOWISKA.NAZWA
WHERE PRACOWNICY.CZY_PRACUJE = 0
AND PRACOWNICY.STANOWISKO IS NOT NULL
ORDER BY IMIE, NAZWISKO;

-- [3]
-- Sugestia: 5 klientow z najwieksza suma z zamowien w 2024
-- Modyfikacja: Przez ostatnie 10 lat, >=2014
SELECT TOP 5 
    KLIENCI.NAZWA AS nazwa_klienta,
    SUM(PRODUKTY.CENA_SPRZEDAZY * ZAMOWIONE_PRODUKTY.ILOSC) AS ile_wydal
FROM KLIENCI 
JOIN ZAMOWIENIA_NA_PRODUKTY ON KLIENCI.NIP = ZAMOWIENIA_NA_PRODUKTY.KLIENT
JOIN ZAMOWIONE_PRODUKTY ON ZAMOWIENIA_NA_PRODUKTY.ID_ZAMOWIENIA = ZAMOWIONE_PRODUKTY.ID_ZAMOWIENIA
JOIN PRODUKTY ON ZAMOWIONE_PRODUKTY.ID_PRODUKTU = PRODUKTY.NAZWA
WHERE YEAR(ZAMOWIENIA_NA_PRODUKTY.[DATA]) >= 2014
AND ZAMOWIENIA_NA_PRODUKTY.[STATUS] = 'zrealizowane'
GROUP BY KLIENCI.NAZWA
ORDER BY ile_wydal DESC;

-- [4]
-- Autorskie: Suma zrealizowanych zyskow z zamowień/wypelnienia umow w ostatnich 4 miesiacach
-- Modyfikacja: Suma dochodow i suma wydatkow ze zrealizowanych zamowien / "dostarczonych" dostaw w poprzednim kwartale
WITH kwartal AS 
( SELECT DATEADD(QUARTER, -1, GETDATE()) AS data_poczatkowa, GETDATE() AS data_koncowa )
SELECT 
    SUM(PRODUKTY.CENA_SPRZEDAZY * ZAMOWIONE_PRODUKTY.ILOSC) AS dochody,
    SUM(ZAMOWIENIA_NA_ZLOTO.KOSZT) AS wydatki
FROM ZAMOWIENIA_NA_PRODUKTY
JOIN ZAMOWIONE_PRODUKTY ON ZAMOWIENIA_NA_PRODUKTY.ID_ZAMOWIENIA = ZAMOWIONE_PRODUKTY.ID_ZAMOWIENIA
JOIN PRODUKTY ON ZAMOWIONE_PRODUKTY.ID_PRODUKTU = PRODUKTY.NAZWA
JOIN ZAMOWIENIA_NA_ZLOTO ON ZAMOWIENIA_NA_ZLOTO.DATA BETWEEN 
    (SELECT data_poczatkowa FROM kwartal) AND (SELECT data_koncowa FROM kwartal)
WHERE ZAMOWIENIA_NA_PRODUKTY.[DATA] BETWEEN 
    (SELECT data_poczatkowa FROM kwartal) AND (SELECT data_koncowa FROM kwartal)
AND ZAMOWIENIA_NA_PRODUKTY.[STATUS] = 'zrealizowane'

-- Scenario 5: Monthly raw material usage for discounts
-- SELECT
--     FORMAT(Z.[DATA], 'yyyy-MM') AS Month,
--     SUM(P.ILOSC_SUROWCA_POTRZEBNA_DO_WYPRODUKOWANIA * ZPR.ILOSC) AS TotalRawMaterialUsed
-- FROM ZAMOWIENIA_NA_PRODUKTY Z
-- JOIN ZAMOWIONE_PRODUKTY ZPR ON Z.ID_ZAMOWIENIA = ZPR.ID_ZAMOWIENIA
-- JOIN PRODUKTY P ON ZPR.ID_PRODUKTU = P.NAZWA
-- WHERE Z.[STATUS] = 'zrealizowane'
-- GROUP BY FORMAT(Z.[DATA], 'yyyy-MM')
-- HAVING SUM(P.ILOSC_SUROWCA_POTRZEBNA_DO_WYPRODUKOWANIA * ZPR.ILOSC) > 100;

-- Scenario 6: Employees per manager
SELECT 
    PRACOWNICY_2.IMIE AS ManagerFirstName,
    PRACOWNICY_2.NAZWISKO AS ManagerLastName,
    COUNT(PRACOWNICY_1.ID_PRACOWNIKA) AS NumberOfEmployees
FROM PRACOWNICY PRACOWNICY_1
JOIN PRACOWNICY PRACOWNICY_2 ON PRACOWNICY_1.PRZELOZONY = PRACOWNICY_2.ID_PRACOWNIKA
GROUP BY PRACOWNICY_2.IMIE, PRACOWNICY_2.NAZWISKO
ORDER BY NumberOfEmployees DESC;

-- -- Scenario 7: Next three deliveries of raw materials
-- SELECT TOP 3
--     PS.ID_PARTII AS BatchID,
--     PS.DATA_DOSTAWY AS DeliveryDate,
--     PS.WAGA AS Weight
-- FROM PARTIE_SUROWCA PS
-- WHERE PS.DATA_DOSTAWY > GETDATE()
-- ORDER BY PS.DATA_DOSTAWY ASC;


-- [8]
-- Autorskie: 5 produktow z najlepsza marża
-- Modyfikacja: 
GO
CREATE VIEW ActiveProductsWithMargin
( nazwa_produktu, marza )
    AS SELECT PRODUKTY.NAZWA,
    CAST(REPLACE(PRODUKTY.MARZA, '%', '') AS INT) AS marza
FROM PRODUKTY
WHERE PRODUKTY.CZY_PRODUKOWANY = 1
GO

SELECT TOP 5
    nazwa_produktu,
    marza
FROM ActiveProductsWithMargin
ORDER BY marza DESC

DROP VIEW ActiveProductsWithMargin;

-- [9]
-- Autorskie: Ile powinno być surowca w warsztacie
-- Modyfikacja: 
SELECT
    PLACOWKI.NAZWA AS miejsce,
    SUM(ZAMOWIENIA_NA_ZLOTO.ILOSC) AS ile_kupione,
    SUM(PRODUKTY.ILOSC_SUROWCA_POTRZEBNA_DO_WYPRODUKOWANIA * PRODUKTY.ILOSC) AS ile_zuzyto,
    SUM(ZAMOWIENIA_NA_ZLOTO.ILOSC) - SUM(PRODUKTY.ILOSC_SUROWCA_POTRZEBNA_DO_WYPRODUKOWANIA * PRODUKTY.ILOSC) AS ile_powinno_byc
FROM ZAMOWIENIA_NA_ZLOTO
JOIN PLACOWKI ON ZAMOWIENIA_NA_ZLOTO.DOSTARCZANA_DO = PLACOWKI.NAZWA
JOIN PRODUKTY ON PLACOWKI.NAZWA = PRODUKTY.MIEJSCE_SKLADOWANIA
WHERE PLACOWKI.NAZWA = 'Warsztat'
GROUP BY PLACOWKI.NAZWA;
