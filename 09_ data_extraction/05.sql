SELECT 
	T.week_number,
	T.ticket_amount,
	T.festival_week,
	T.festival_name
FROM (
(
  SELECT EXTRACT(week from flights.arrival_time::date) as week_number,
          COUNT (ticket_flights.ticket_no) as ticket_amount
  FROM flights
  JOIN airports on airports.airport_code = flights.arrival_airport
  JOIN ticket_flights on ticket_flights.flight_id = flights.flight_id
  WHERE airports.city = 'Москва' and
        CAST(flights.arrival_time AS date) BETWEEN '2018-07-23' AND '2018-09-30'
  GROUP BY week_number
) t1
LEFT JOIN 
(SELECT 		
		festival_name,	
		EXTRACT (week FROM festivals.festival_date) AS festival_week
	FROM 
		festivals
	WHERE
		festival_city = 'Москва'
	  AND CAST(festivals.festival_date AS date) BETWEEN '2018-07-23' AND '2018-09-30'
) t2 
ON 
	t1.week_number = t2.festival_week
) AS T