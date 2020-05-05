SELECT subq.city,
       avg(subq.num_flights) AS average_flights
FROM
    (SELECT airports.city AS city,
            count(flights.flight_id) AS num_flights,
            extract(DAY
                    FROM flights.arrival_time :: date) AS DAY
     FROM flights
     JOIN airports ON airports.airport_code = flights.arrival_airport
     WHERE (flights.arrival_time :: date < '2018-09-01'
            AND flights.arrival_time :: date >= '2018-08-01')
     GROUP BY airports.city,
              extract(DAY
                      FROM flights.arrival_time :: date)) AS subq
GROUP BY subq.city