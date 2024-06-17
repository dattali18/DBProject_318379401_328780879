-- Parameterized query

-- Query 1
SELECT p.PASSENGER_NAME, p.PASSENGER_PHONE, p.PASSENGER_EMAIL
FROM Passengers p
JOIN Bookings b ON p.PASSENGER_ID = b.PASSENGER_ID
JOIN Flights f ON b.FLIGHT_ID = f.FLIGHT_ID
WHERE f.FLIGHT_NUMBER = :flight_number;


-- Query 2
SELECT f.FLIGHT_NUMBER, dep.AIRPORT_NAME AS DEPARTURE_AIRPORT, arr.AIRPORT_NAME AS ARRIVAL_AIRPORT, al.AIRLINE_NAME
FROM Flights f
JOIN Airports dep ON f.DEPARTURE_AIRPORT = dep.AIRPORT_ID
JOIN Airports arr ON f.ARRIVAL_AIRPORT = arr.AIRPORT_ID
JOIN Airlines al ON f.AIRLINE_ID = al.AIRLINE_ID
WHERE al.AIRLINE_NAME = :airline_name
 AND dep.AIRPORT_NAME = :departure_airport
 AND f.DEPARTURE_TIME >= :departure_airport AND f.DEPARTURE_TIME < DATEADD(DAY, 1, :departure_date);

-- Query 3
SELECT f.FLIGHT_NUMBER, COUNT(b.BOOKING_ID) AS TOTAL_BOOKINGS, AVG(p.PASSENGER_AGE) AS AVG_PASSENGER_AGE
FROM Flights f
JOIN Bookings b ON f.FLIGHT_ID = b.FLIGHT_ID
JOIN Passengers p ON b.PASSENGER_ID = p.PASSENGER_ID
JOIN Aircraft a ON f.AIRCRAFT_ID = a.AIRCRAFT_ID
WHERE a.CAPACITY >= :min_capacity AND a.CAPACITY <= :max_capacity
GROUP BY f.FLIGHT_NUMBER;

-- Query 4
SELECT cm.CREW_NAME, cm.CREW_ROLE
FROM CrewMembers cm
JOIN Flights f ON cm.FLIGHT_ID = f.FLIGHT_ID
JOIN Airlines al ON f.AIRLINE_ID = al.AIRLINE_ID
WHERE al.AIRLINE_NAME = :airline_name
 AND f.DEPARTURE_TIME >= :start_date AND f.ARRIVAL_TIME <= :end_date;
