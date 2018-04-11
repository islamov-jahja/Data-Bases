--1
EXPLAIN SELECT
  name_of_pharmacy,
  date_of_order,
  count_of_medicine_in_order
FROM orderr
  LEFT JOIN pharmacy p ON orderr.id_pharmacy = p.id_pharmacy
  LEFT JOIN manufacture_of_medicines m2 ON orderr.id_consigntment = m2.id_consigntment
  LEFT JOIN pharmaceutical_company company ON m2.id_company = company.id_company
  LEFT JOIN medicine m ON m2.id_medicine = m.id_medicine
WHERE company_name = 'Аргус' AND name_of_medicine = 'Кордерон';

--2
EXPLAIN SELECT name_of_medicine, MIN(date_of_order) as min
FROM orderr
  LEFT JOIN manufacture_of_medicines m2 ON orderr.id_consigntment = m2.id_consigntment
  LEFT JOIN pharmaceutical_company company ON m2.id_company = company.id_company
  LEFT JOIN medicine m ON m2.id_medicine = m.id_medicine
WHERE company_name = 'Фарма'
GROUP BY (date_of_order)
HAVING min >= '2001-05-01';

--3
EXPLAIN SELECT company_name, MIN(quality_control) as minControl, MAX(quality_control) as maxControl
FROM orderr
  LEFT JOIN pharmacy p ON orderr.id_pharmacy = p.id_pharmacy
  LEFT JOIN manufacture_of_medicines m2 ON orderr.id_consigntment = m2.id_consigntment
  LEFT JOIN pharmaceutical_company company ON m2.id_company = company.id_company
  LEFT JOIN medicine m ON m2.id_medicine = m.id_medicine
WHERE count_of_medicine_in_order >= 100
GROUP BY company.id_company, company.company_name;

--4
EXPLAIN SELECT name_of_pharmacy, surname_of_the_dealer, company_name
FROM company_dealer
  LEFT JOIN pharmaceutical_company company ON company_dealer.id_company = company.id_company
  LEFT JOIN orderr o ON company_dealer.id_dealer = o.id_dealer
  LEFT JOIN pharmacy p ON o.id_pharmacy = p.id_pharmacy
WHERE company_name = 'Гедеон Рихтер';
--5
EXPLAIN UPDATE manufacture_of_medicines AS mof
LEFT JOIN medicine m ON mof.id_medicine = m.id_medicine
SET unit_cost = unit_cost * 0.8
WHERE unit_cost > 3000 AND  durability < 7;
