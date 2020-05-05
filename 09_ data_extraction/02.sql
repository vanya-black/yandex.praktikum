SELECT count(CASE
                 WHEN aircrafts.model LIKE '%Boeing%' THEN 'Boeing'
                 WHEN aircrafts.model LIKE '%Airbus%' THEN 'Airbus'
             END) AS flights_amount
FROM flights
JOIN aircrafts ON aircrafts.aircraft_code = flights.aircraft_code
WHERE (flights.departure_time :: date < '2018-10-01'
       AND flights.departure_time :: date >= '2018-09-01')