CREATE OR REPLACE FUNCTION GET_JUNIOR_FLIGHT_ATTENDANTS_BY_AIRCRAFT_TYPE(aircraft_type IN VARCHAR2)
RETURN SYS_REFCURSOR IS
    crew_cursor SYS_REFCURSOR;
BEGIN
    OPEN crew_cursor FOR
    SELECT cm.CREW_ID
    FROM CrewMembers cm
    JOIN WorkingCrew wc ON cm.CREW_ID = wc.CREW_ID
    JOIN Flights f ON wc.FLIGHT_ID = f.FLIGHT_ID
    JOIN Aircraft a ON f.AIRCRAFT_ID = a.AIRCRAFT_ID
    WHERE a.AIRCRAFT_TYPE = aircraft_type
    AND cm.CREW_ROLE = 'Junior Flight Attendant';

    RETURN crew_cursor;
END;
/