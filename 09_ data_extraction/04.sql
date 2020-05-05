SELECT festival_name AS festival_name,
       extract(WEEK
               FROM festival_date) AS festival_week
FROM festivals
WHERE festival_city = 'Москва'
    AND festival_date < '2018-09-30'
    AND festival_date > '2018-07-23'