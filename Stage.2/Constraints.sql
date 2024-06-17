-- Constraints

-- Constraint 1

ALTER TABLE CrewMembers
MODIFY CREW_ROLE VARCHAR(50) NOT NULL;

-- Constraint 2

ALTER TABLE Passengers
ADD CONSTRAINT CHK_PassengerAge CHECK (PASSENGER_AGE >= 18 AND PASSENGER_AGE <= 100);

-- Constraint 3
ALTER TABLE Bookings
MODIFY (BOOKING_DATE DATE DEFAULT SYSDATE);
