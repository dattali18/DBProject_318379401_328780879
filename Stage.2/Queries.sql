-- SELECT Queries

-- Query 1
SELECT p.PASSENGER_NAME, f.FLIGHT_NUMBER, f.DEPARTURE_TIME, f.ARRIVAL_TIME
FROM Passengers p
JOIN Bookings b ON p.PASSENGER_ID = b.PASSENGER_ID
JOIN Flights f ON b.FLIGHT_ID = f.FLIGHT_ID
WHERE f.DEPARTURE_AIRPORT = (SELECT AIRPORT_ID FROM Airports WHERE LOCATION = 'JFK')
AND f.DEPARTURE_TIME >= TO_DATE('2024-05-15') AND f.DEPARTURE_TIME < TO_DATE('2024-05-16');

-- Query 2
SELECT f.FLIGHT_NUMBER, dep.AIRPORT_NAME AS DEPARTURE_AIRPORT, arr.AIRPORT_NAME AS ARRIVAL_AIRPORT, a.AIRCRAFT_TYPE, al.AIRLINE_NAME
FROM Flights f
JOIN Airports dep ON f.DEPARTURE_AIRPORT = dep.AIRPORT_ID
JOIN Airports arr ON f.ARRIVAL_AIRPORT = arr.AIRPORT_ID
JOIN Aircraft a ON f.AIRCRAFT_ID = a.AIRCRAFT_ID
JOIN Airlines al ON f.AIRLINE_ID = al.AIRLINE_ID
WHERE a.AIRCRAFT_TYPE = 'Boeing 737';

-- Query 3
SELECT f.FLIGHT_NUMBER, COUNT(b.BOOKING_ID) AS TOTAL_BOOKINGS, AVG(p.PASSENGER_AGE) AS AVG_PASSENGER_AGE
FROM Flights f
LEFT JOIN Bookings b ON f.FLIGHT_ID = b.FLIGHT_ID
LEFT JOIN Passengers p ON b.PASSENGER_ID = p.PASSENGER_ID
GROUP BY f.FLIGHT_NUMBER
ORDER BY f.FLIGHT_NUMBER;

-- Query 4
SELECT cm.CREW_NAME, cm.CREW_ROLE
FROM CrewMembers cm
JOIN Flights f ON cm.FLIGHT_ID = f.FLIGHT_ID
WHERE f.DEPARTURE_AIRPORT = (SELECT AIRPORT_ID FROM Airports WHERE AIRPORT_NAME = 'JFK Airport New York')
 AND f.ARRIVAL_AIRPORT = (SELECT AIRPORT_ID FROM Airports WHERE AIRPORT_NAME = 'LAX Airport Los Angeles')
 AND f.DEPARTURE_TIME >= '2023-06-01' AND f.DEPARTURE_TIME < '2023-06-15';

-- Query 5
SELECT
    EXTRACT(YEAR FROM f.Departure_Time) AS Year,
    EXTRACT(MONTH FROM f.Departure_Time) AS Month,
    COUNT(f.Flight_ID) AS Number_of_Flights
FROM
    Flights f
GROUP BY
    EXTRACT(YEAR FROM f.Departure_Time), EXTRACT(MONTH FROM f.Departure_Time)
ORDER BY
    Year DESC, Month DESC;

-- Query 6
SELECT
    f.Flight_Number,
    air.Airline_Name,
    p.Passenger_Name,
    (f.Arrival_Time - f.Departure_Time) AS Flight_Duration_Days,
    avg_flight_duration.Avg_Flight_Duration_Days
FROM
    Flights f
JOIN
    Airlines air ON f.Airline_ID = air.Airline_ID
JOIN
    Bookings b ON f.Flight_ID = b.Flight_ID
JOIN
    Passengers p ON b.Passenger_ID = p.Passenger_ID
JOIN (
    SELECT
        f2.Airline_ID,
        AVG(f2.Arrival_Time - f2.Departure_Time) AS Avg_Flight_Duration_Days
    FROM
        Flights f2
    WHERE
        f2.Flight_Status = 'Arrived'
    GROUP BY
        f2.Airline_ID
) avg_flight_duration ON f.Airline_ID = avg_flight_duration.Airline_ID
WHERE
    f.Flight_Status = 'Arrived'
AND
    (f.Arrival_Time - f.Departure_Time) > avg_flight_duration.Avg_Flight_Duration_Days
ORDER BY
    f.Flight_Number;

-- DELETE Queries

-- Query 1
DELETE FROM Bookings
WHERE PASSENGER_ID = (SELECT PASSENGER_ID FROM Passengers WHERE PASSENGER_NAME = 'John Doe')
 AND BOOKINGS.BOOKING_DATE >= TO_DATE('2024-05-16');

-- Query 2
DELETE FROM Flights
WHERE FLIGHT_STATUS = 'Cancelled'
 AND DEPARTURE_AIRPORT = (SELECT AIRPORT_ID FROM Airports WHERE LOCATION = 'JFK')
 AND ARRIVAL_AIRPORT = (SELECT AIRPORT_ID FROM Airports WHERE LOCATION = 'LAX');

-- Query 3
DELETE FROM Bookings
WHERE PASSENGER_ID IN (SELECT PASSENGER_ID FROM Passengers WHERE PASSENGER_AGE > 90)
 AND BOOKINGS.BOOKING_DATE >= TO_DATE('2024-05-16');

-- Query 4
DELETE FROM Bookings
WHERE Flight_ID IN (
    SELECT Flight_ID
    FROM Flights
    WHERE Flight_Status = 'Cancelled'
);

-- UPDATE Queries

-- Query 1
UPDATE Flights
SET FLIGHT_STATUS = 'Delayed'
WHERE DEPARTURE_AIRPORT = (SELECT AIRPORT_ID FROM Airports WHERE AIRPORT_NAME = 'JFK Airport New York')
 AND DEPARTURE_TIME >= '2023-06-01' AND DEPARTURE_TIME < '2023-06-02';

-- Query 2
UPDATE Aircraft a
SET a.AIRCRAFT_TYPE = 'Airbus A320'
WHERE a.AIRCRAFT_ID IN (
    SELECT f.AIRCRAFT_ID
    FROM Flights f
    JOIN Airlines al ON f.AIRLINE_ID = al.AIRLINE_ID
    WHERE al.AIRLINE_NAME = 'Delta Air Lines'
);

-- Query 3
UPDATE Flights
SET Flight_Status = 'Arrived'
WHERE Arrival_Time < SYSDATE;