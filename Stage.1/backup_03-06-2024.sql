prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by danie on Monday, June 3, 2024
set feedback off
set define off

prompt Creating AIRCRAFT...
create table AIRCRAFT
(
  aircraft_id   INTEGER not null,
  aircraft_type VARCHAR2(100) not null,
  capacity      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AIRCRAFT
  add primary key (AIRCRAFT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AIRLINES...
create table AIRLINES
(
  airline_id   INTEGER not null,
  airline_name VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AIRLINES
  add primary key (AIRLINE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AIRPORTS...
create table AIRPORTS
(
  airport_id   INTEGER not null,
  airport_name VARCHAR2(50) not null,
  location     VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AIRPORTS
  add primary key (AIRPORT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating FLIGHTS...
create table FLIGHTS
(
  flight_id         INTEGER not null,
  flight_number     VARCHAR2(15) not null,
  departure_time    DATE not null,
  arrival_time      DATE not null,
  departure_airport INTEGER not null,
  arrival_airport   INTEGER not null,
  flight_status     VARCHAR2(50) not null,
  aircraft_id       INTEGER not null,
  airline_id        INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FLIGHTS
  add primary key (FLIGHT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FLIGHTS
  add foreign key (AIRCRAFT_ID)
  references AIRCRAFT (AIRCRAFT_ID);
alter table FLIGHTS
  add foreign key (AIRLINE_ID)
  references AIRLINES (AIRLINE_ID);
alter table FLIGHTS
  add foreign key (DEPARTURE_AIRPORT)
  references AIRPORTS (AIRPORT_ID);
alter table FLIGHTS
  add foreign key (ARRIVAL_AIRPORT)
  references AIRPORTS (AIRPORT_ID);

prompt Creating PASSENGERS...
create table PASSENGERS
(
  passenger_id    INTEGER not null,
  passenger_name  VARCHAR2(100) not null,
  passenger_phone VARCHAR2(20) not null,
  passenger_email VARCHAR2(150) not null,
  passport_number VARCHAR2(100) not null,
  passenger_age   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PASSENGERS
  add primary key (PASSENGER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BOOKINGS...
create table BOOKINGS
(
  booking_id   INTEGER not null,
  seat_number  VARCHAR2(10) not null,
  booking_date DATE not null,
  passenger_id INTEGER not null,
  flight_id    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BOOKINGS
  add primary key (BOOKING_ID, PASSENGER_ID, FLIGHT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BOOKINGS
  add foreign key (PASSENGER_ID)
  references PASSENGERS (PASSENGER_ID);
alter table BOOKINGS
  add foreign key (FLIGHT_ID)
  references FLIGHTS (FLIGHT_ID);

prompt Creating CREWMEMBERS...
create table CREWMEMBERS
(
  crew_id   INTEGER not null,
  crew_name VARCHAR2(100) not null,
  crew_role VARCHAR2(50) not null,
  flight_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CREWMEMBERS
  add primary key (CREW_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CREWMEMBERS
  add foreign key (FLIGHT_ID)
  references FLIGHTS (FLIGHT_ID);

prompt Disabling triggers for AIRCRAFT...
alter table AIRCRAFT disable all triggers;
prompt Disabling triggers for AIRLINES...
alter table AIRLINES disable all triggers;
prompt Disabling triggers for AIRPORTS...
alter table AIRPORTS disable all triggers;
prompt Disabling triggers for FLIGHTS...
alter table FLIGHTS disable all triggers;
prompt Disabling triggers for PASSENGERS...
alter table PASSENGERS disable all triggers;
prompt Disabling triggers for BOOKINGS...
alter table BOOKINGS disable all triggers;
prompt Disabling triggers for CREWMEMBERS...
alter table CREWMEMBERS disable all triggers;
prompt Disabling foreign key constraints for FLIGHTS...
alter table FLIGHTS disable constraint SYS_C008496;
alter table FLIGHTS disable constraint SYS_C008497;
alter table FLIGHTS disable constraint SYS_C008498;
alter table FLIGHTS disable constraint SYS_C008499;
prompt Disabling foreign key constraints for BOOKINGS...
alter table BOOKINGS disable constraint SYS_C008506;
alter table BOOKINGS disable constraint SYS_C008507;
prompt Disabling foreign key constraints for CREWMEMBERS...
alter table CREWMEMBERS disable constraint SYS_C008513;
prompt Deleting CREWMEMBERS...
delete from CREWMEMBERS;
commit;
prompt Deleting BOOKINGS...
delete from BOOKINGS;
commit;
prompt Deleting PASSENGERS...
delete from PASSENGERS;
commit;
prompt Deleting FLIGHTS...
delete from FLIGHTS;
commit;
prompt Deleting AIRPORTS...
delete from AIRPORTS;
commit;
prompt Deleting AIRLINES...
delete from AIRLINES;
commit;
prompt Deleting AIRCRAFT...
delete from AIRCRAFT;
commit;
prompt Loading AIRCRAFT...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (1, 'Ilyushin Il-96', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (2, 'Boeing 767', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (3, 'Pilatus PC-12', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (4, 'Boeing 787 Dreamliner', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (5, 'Antonov An-148', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (6, 'Airbus A310', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (7, 'Embraer E195', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (8, 'Antonov An-148', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (9, 'Cessna Citation X', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (10, 'Tupolev Tu-204', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (11, 'Airbus A330', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (12, 'Boeing 777', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (13, 'Pilatus PC-12', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (14, 'Bombardier CRJ900', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (15, 'Boeing 757', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (16, 'Tupolev Tu-204', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (17, 'Cessna 172', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (18, 'Airbus A220', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (19, 'Boeing 717', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (20, 'Boeing 717', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (21, 'Gulfstream G650', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (22, 'Airbus A380', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (23, 'Mitsubishi Regional Jet', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (24, 'Mitsubishi Regional Jet', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (25, 'Airbus A350', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (26, 'Beechcraft King Air 250', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (27, 'Antonov An-158', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (28, 'Boeing 737', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (29, 'Beechcraft King Air 350', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (30, 'Beechcraft King Air 350', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (31, 'Airbus A310', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (32, 'Boeing 727', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (33, 'Boeing 737', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (34, 'Beechcraft King Air 250', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (35, 'Airbus A220', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (36, 'Airbus A321', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (37, 'Comac ARJ21', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (38, 'Boeing 757', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (39, 'Bombardier CRJ900', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (40, 'Antonov An-148', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (41, 'Sukhoi Superjet 100', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (42, 'Bombardier CRJ700', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (43, 'Cessna Citation X', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (44, 'Airbus A380', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (45, 'Boeing 757', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (46, 'Sukhoi Superjet 100', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (47, 'Cessna 172', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (48, 'Cessna 172', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (49, 'Bombardier CS100', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (50, 'Embraer E195', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (51, 'Boeing 787 Dreamliner', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (52, 'Boeing 767', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (53, 'Airbus A340', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (54, 'Airbus A321', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (55, 'Sukhoi Superjet 100', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (56, 'Gulfstream G650', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (57, 'Airbus A380', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (58, 'Boeing 777', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (59, 'Airbus A380', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (60, 'Bombardier CRJ900', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (61, 'Bombardier CS300', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (62, 'Boeing 720', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (63, 'Tupolev Tu-214', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (64, 'Boeing 787 Dreamliner', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (65, 'Boeing 717', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (66, 'Antonov An-158', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (67, 'Beechcraft King Air 250', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (68, 'Antonov An-148', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (69, 'Beechcraft King Air 250', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (70, 'Bombardier CS300', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (71, 'Airbus A380', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (72, 'Bombardier CRJ200', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (73, 'McDonnell Douglas MD-11', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (74, 'Antonov An-148', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (75, 'Airbus A350', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (76, 'Boeing 720', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (77, 'Gulfstream G550', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (78, 'Beechcraft King Air 250', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (79, 'Airbus A380', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (80, 'Boeing 720', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (81, 'Bombardier CRJ200', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (82, 'Bombardier Q400', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (83, 'Boeing 717', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (84, 'Beechcraft King Air 250', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (85, 'Cessna 172', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (86, 'Lockheed L-1011', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (87, 'Bombardier CRJ700', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (88, 'Mitsubishi Regional Jet', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (89, 'McDonnell Douglas MD-11', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (90, 'Sukhoi Superjet 100', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (91, 'Boeing 767', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (92, 'Embraer E175', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (93, 'Beechcraft King Air 250', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (94, 'Cessna 172', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (95, 'Lockheed L-1011', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (96, 'Gulfstream G550', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (97, 'Boeing 777', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (98, 'Beechcraft King Air 250', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (99, 'Boeing 720', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (100, 'Ilyushin Il-96', 400);
commit;
prompt 100 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (101, 'Comac C919', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (102, 'Cessna 182', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (103, 'Antonov An-148', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (104, 'Boeing 747', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (105, 'Bombardier CS300', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (106, 'Gulfstream G650', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (107, 'Ilyushin Il-96', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (108, 'Gulfstream G650', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (109, 'Cessna 172', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (110, 'Boeing 757', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (111, 'Embraer E175', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (112, 'McDonnell Douglas MD-11', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (113, 'Comac C919', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (114, 'Embraer E195', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (115, 'Bombardier CRJ200', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (116, 'Boeing 737', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (117, 'Pilatus PC-24', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (118, 'Airbus A340', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (119, 'Boeing 737', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (120, 'Bombardier CS100', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (121, 'Boeing 720', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (122, 'Boeing 747', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (123, 'Boeing 737', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (124, 'Bombardier CRJ200', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (125, 'McDonnell Douglas DC-10', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (126, 'Comac ARJ21', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (127, 'Sukhoi Superjet 100', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (128, 'Tupolev Tu-204', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (129, 'McDonnell Douglas DC-10', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (130, 'McDonnell Douglas MD-11', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (131, 'Cessna Citation X', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (132, 'Dassault Falcon 7X', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (133, 'Gulfstream G550', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (134, 'Beechcraft King Air 250', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (135, 'Boeing 787 Dreamliner', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (136, 'Pilatus PC-24', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (137, 'Airbus A350', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (138, 'Bombardier CRJ700', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (139, 'Sukhoi Superjet 100', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (140, 'Cessna 172', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (141, 'Gulfstream G550', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (142, 'Ilyushin Il-96', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (143, 'Cessna 182', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (144, 'Bombardier CRJ900', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (145, 'Airbus A310', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (146, 'Embraer E175', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (147, 'Embraer E190', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (148, 'Tupolev Tu-214', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (149, 'Tupolev Tu-204', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (150, 'Cessna 172', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (151, 'Airbus A340', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (152, 'Bombardier CS300', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (153, 'Cessna Citation X', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (154, 'Boeing 720', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (155, 'Airbus A330', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (156, 'Tupolev Tu-214', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (157, 'Gulfstream G650', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (158, 'Antonov An-158', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (159, 'Tupolev Tu-204', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (160, 'Antonov An-158', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (161, 'Boeing 747', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (162, 'Airbus A310', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (163, 'Bombardier CRJ900', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (164, 'Tupolev Tu-204', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (165, 'Bombardier Q400', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (166, 'Airbus A220', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (167, 'Sukhoi Superjet 100', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (168, 'Bombardier Q400', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (169, 'Gulfstream G280', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (170, 'Bombardier CS100', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (171, 'Cessna 172', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (172, 'Bombardier CS100', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (173, 'Gulfstream G280', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (174, 'Boeing 767', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (175, 'Boeing 737', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (176, 'Bombardier Q400', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (177, 'Airbus A350', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (178, 'Airbus A310', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (179, 'Cessna Citation X', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (180, 'Boeing 720', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (181, 'Airbus A310', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (182, 'Comac ARJ21', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (183, 'Comac ARJ21', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (184, 'Dassault Falcon 2000', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (185, 'Boeing 737', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (186, 'Bombardier CS100', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (187, 'McDonnell Douglas MD-11', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (188, 'Embraer E195', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (189, 'Boeing 787 Dreamliner', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (190, 'Cessna 182', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (191, 'Gulfstream G550', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (192, 'McDonnell Douglas MD-11', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (193, 'McDonnell Douglas MD-11', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (194, 'McDonnell Douglas MD-11', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (195, 'Antonov An-148', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (196, 'Dassault Falcon 2000', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (197, 'Comac C919', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (198, 'Embraer E190', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (199, 'Ilyushin Il-96', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (200, 'Boeing 720', 280);
commit;
prompt 200 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (201, 'McDonnell Douglas DC-10', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (202, 'Pilatus PC-24', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (203, 'Boeing 737', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (204, 'Boeing 717', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (205, 'Airbus A330', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (206, 'Bombardier CRJ900', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (207, 'Bombardier CS100', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (208, 'Boeing 737', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (209, 'Boeing 787 Dreamliner', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (210, 'Comac C919', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (211, 'Sukhoi Superjet 100', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (212, 'Bombardier CRJ200', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (213, 'Boeing 757', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (214, 'Cessna 182', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (215, 'Mitsubishi Regional Jet', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (216, 'Cessna 172', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (217, 'Bombardier Q400', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (218, 'Bombardier CRJ900', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (219, 'Dassault Falcon 2000', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (220, 'Sukhoi Superjet 100', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (221, 'Pilatus PC-24', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (222, 'McDonnell Douglas DC-10', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (223, 'Airbus A340', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (224, 'Boeing 737', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (225, 'Antonov An-148', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (226, 'Airbus A330', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (227, 'Cessna 182', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (228, 'Airbus A330', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (229, 'Boeing 720', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (230, 'Cessna Citation X', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (231, 'Embraer E175', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (232, 'Gulfstream G280', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (233, 'Airbus A320', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (234, 'Gulfstream G650', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (235, 'Bombardier CS300', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (236, 'Beechcraft King Air 250', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (237, 'Pilatus PC-24', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (238, 'Gulfstream G280', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (239, 'Airbus A310', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (240, 'Embraer E190', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (241, 'Tupolev Tu-204', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (242, 'Tupolev Tu-204', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (243, 'Tupolev Tu-214', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (244, 'Embraer E175', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (245, 'Cessna 172', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (246, 'Airbus A380', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (247, 'Cessna Citation X', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (248, 'Cessna Citation X', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (249, 'Dassault Falcon 2000', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (250, 'Sukhoi Superjet 100', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (251, 'Airbus A380', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (252, 'Gulfstream G550', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (253, 'Bombardier CRJ700', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (254, 'Comac C919', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (255, 'McDonnell Douglas MD-11', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (256, 'McDonnell Douglas MD-11', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (257, 'Boeing 777', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (258, 'Boeing 767', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (259, 'Boeing 720', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (260, 'Comac ARJ21', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (261, 'Boeing 737', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (262, 'Mitsubishi Regional Jet', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (263, 'Lockheed L-1011', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (264, 'Bombardier CRJ900', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (265, 'Boeing 777', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (266, 'Tupolev Tu-204', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (267, 'Beechcraft King Air 250', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (268, 'Embraer E175', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (269, 'Gulfstream G550', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (270, 'Lockheed L-1011', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (271, 'Airbus A220', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (272, 'Boeing 727', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (273, 'Comac ARJ21', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (274, 'Embraer E195', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (275, 'Embraer E190', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (276, 'Sukhoi Superjet 100', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (277, 'Boeing 747', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (278, 'Ilyushin Il-96', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (279, 'Gulfstream G650', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (280, 'Antonov An-148', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (281, 'Pilatus PC-12', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (282, 'Boeing 720', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (283, 'Airbus A350', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (284, 'Mitsubishi Regional Jet', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (285, 'Airbus A350', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (286, 'Gulfstream G550', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (287, 'Gulfstream G650', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (288, 'Airbus A380', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (289, 'Boeing 777', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (290, 'Mitsubishi Regional Jet', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (291, 'Boeing 747', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (292, 'Embraer E190', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (293, 'Dassault Falcon 2000', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (294, 'Beechcraft King Air 250', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (295, 'Bombardier CS300', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (296, 'Bombardier CS100', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (297, 'Lockheed L-1011', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (298, 'Antonov An-148', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (299, 'Gulfstream G650', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (300, 'Bombardier Q400', 150);
commit;
prompt 300 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (301, 'Comac C919', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (302, 'Mitsubishi Regional Jet', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (303, 'Boeing 717', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (304, 'Tupolev Tu-204', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (305, 'Bombardier CRJ700', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (306, 'Embraer E190', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (307, 'Embraer E195', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (308, 'Bombardier CS100', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (309, 'Boeing 767', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (310, 'Gulfstream G650', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (311, 'Boeing 717', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (312, 'Pilatus PC-12', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (313, 'Sukhoi Superjet 100', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (314, 'Sukhoi Superjet 100', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (315, 'Bombardier Q400', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (316, 'Dassault Falcon 2000', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (317, 'Boeing 757', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (318, 'Boeing 717', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (319, 'Boeing 737', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (320, 'Ilyushin Il-96', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (321, 'McDonnell Douglas DC-10', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (322, 'Bombardier CRJ200', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (323, 'Antonov An-148', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (324, 'Cessna 172', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (325, 'Airbus A220', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (326, 'Boeing 787 Dreamliner', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (327, 'Bombardier CS100', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (328, 'Embraer E175', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (329, 'Airbus A321', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (330, 'Bombardier Q400', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (331, 'Airbus A380', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (332, 'Comac ARJ21', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (333, 'Boeing 757', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (334, 'Airbus A330', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (335, 'Boeing 787 Dreamliner', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (336, 'Embraer E195', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (337, 'Gulfstream G550', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (338, 'Beechcraft King Air 350', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (339, 'Embraer E175', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (340, 'Dassault Falcon 7X', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (341, 'Boeing 727', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (342, 'Bombardier CRJ200', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (343, 'Boeing 717', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (344, 'Boeing 747', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (345, 'Airbus A350', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (346, 'Airbus A380', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (347, 'Pilatus PC-12', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (348, 'Airbus A310', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (349, 'Gulfstream G280', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (350, 'Antonov An-158', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (351, 'Bombardier Q400', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (352, 'Boeing 737', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (353, 'Beechcraft King Air 250', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (354, 'McDonnell Douglas MD-11', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (355, 'Bombardier CS300', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (356, 'Bombardier CRJ900', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (357, 'Gulfstream G280', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (358, 'Bombardier CRJ700', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (359, 'Antonov An-148', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (360, 'Airbus A310', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (361, 'Bombardier CRJ700', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (362, 'Pilatus PC-24', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (363, 'Pilatus PC-24', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (364, 'Bombardier Q400', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (365, 'Airbus A220', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (366, 'Beechcraft King Air 250', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (367, 'McDonnell Douglas DC-10', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (368, 'Bombardier CRJ200', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (369, 'Airbus A320', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (370, 'Boeing 720', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (371, 'Embraer E195', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (372, 'Airbus A340', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (373, 'Beechcraft King Air 350', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (374, 'Airbus A340', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (375, 'Boeing 777', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (376, 'Bombardier CS300', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (377, 'Boeing 777', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (378, 'McDonnell Douglas MD-11', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (379, 'Tupolev Tu-214', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (380, 'Antonov An-158', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (381, 'Boeing 787 Dreamliner', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (382, 'Cessna 172', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (383, 'Airbus A321', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (384, 'Boeing 757', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (385, 'Boeing 757', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (386, 'Sukhoi Superjet 100', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (387, 'Boeing 767', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (388, 'Cessna Citation X', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (389, 'Dassault Falcon 7X', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (390, 'Airbus A220', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (391, 'Boeing 777', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (392, 'Tupolev Tu-204', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (393, 'Antonov An-158', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (394, 'Dassault Falcon 7X', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (395, 'Airbus A321', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (396, 'Boeing 777', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (397, 'Pilatus PC-24', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (398, 'Boeing 757', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (399, 'Boeing 777', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (400, 'Ilyushin Il-96', 280);
commit;
prompt 400 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (401, 'Boeing 717', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (402, 'Airbus A380', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (403, 'Tupolev Tu-214', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (404, 'Boeing 737', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (405, 'Bombardier Q400', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (406, 'Pilatus PC-12', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (407, 'Ilyushin Il-96', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (408, 'Tupolev Tu-214', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (409, 'McDonnell Douglas MD-11', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (410, 'Cessna Citation X', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (411, 'Antonov An-158', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (412, 'Airbus A320', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (413, 'Bombardier CRJ200', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (414, 'Boeing 727', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (415, 'Airbus A380', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (416, 'Gulfstream G550', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (417, 'Gulfstream G280', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (418, 'Tupolev Tu-204', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (419, 'Airbus A330', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (420, 'Airbus A320', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (421, 'Boeing 767', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (422, 'Bombardier Q400', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (423, 'Bombardier CRJ900', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (424, 'Antonov An-148', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (425, 'Airbus A310', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (426, 'Airbus A340', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (427, 'Gulfstream G550', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (428, 'Airbus A320', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (429, 'Embraer E175', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (430, 'Boeing 767', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (431, 'Airbus A310', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (432, 'Embraer E175', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (433, 'Airbus A310', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (434, 'Airbus A330', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (435, 'Embraer E190', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (436, 'Comac C919', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (437, 'Cessna Citation X', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (438, 'Embraer E175', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (439, 'Comac ARJ21', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (440, 'Embraer E195', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (441, 'Boeing 747', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (442, 'Beechcraft King Air 250', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (443, 'Lockheed L-1011', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (444, 'Ilyushin Il-96', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (445, 'Gulfstream G650', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (446, 'Boeing 727', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (447, 'Boeing 747', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (448, 'Comac ARJ21', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (449, 'Bombardier Q400', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (450, 'Cessna Citation X', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (451, 'Ilyushin Il-96', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (452, 'Embraer E175', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (453, 'Airbus A321', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (454, 'McDonnell Douglas DC-10', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (455, 'Beechcraft King Air 350', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (456, 'Boeing 767', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (457, 'Bombardier CS300', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (458, 'Airbus A321', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (459, 'Sukhoi Superjet 100', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (460, 'Bombardier CRJ900', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (461, 'Boeing 720', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (462, 'Lockheed L-1011', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (463, 'Dassault Falcon 2000', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (464, 'Cessna Citation X', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (465, 'Boeing 787 Dreamliner', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (466, 'Bombardier CRJ900', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (467, 'Beechcraft King Air 250', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (468, 'Ilyushin Il-96', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (469, 'Comac C919', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (470, 'Embraer E190', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (471, 'Dassault Falcon 2000', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (472, 'Tupolev Tu-214', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (473, 'Gulfstream G650', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (474, 'Airbus A350', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (475, 'Pilatus PC-12', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (476, 'Embraer E175', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (477, 'Bombardier CS100', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (478, 'Ilyushin Il-96', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (479, 'Ilyushin Il-96', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (480, 'McDonnell Douglas MD-11', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (481, 'Comac C919', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (482, 'Boeing 737', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (483, 'Airbus A330', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (484, 'Airbus A310', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (485, 'Boeing 720', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (486, 'Bombardier CS100', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (487, 'Boeing 717', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (488, 'Gulfstream G280', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (489, 'Airbus A340', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (490, 'Pilatus PC-12', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (491, 'McDonnell Douglas DC-10', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (492, 'Embraer E190', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (493, 'Boeing 757', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (494, 'Bombardier CRJ900', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (495, 'Bombardier CRJ200', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (496, 'Tupolev Tu-204', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (497, 'Bombardier CRJ200', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (498, 'McDonnell Douglas DC-10', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (499, 'Boeing 787 Dreamliner', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (500, 'Comac C919', 280);
commit;
prompt 500 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (501, 'Comac ARJ21', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (502, 'Pilatus PC-12', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (503, 'Bombardier CRJ200', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (504, 'Airbus A321', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (505, 'Embraer E195', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (506, 'Boeing 720', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (507, 'Dassault Falcon 7X', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (508, 'Comac C919', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (509, 'Sukhoi Superjet 100', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (510, 'Airbus A350', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (511, 'Cessna Citation X', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (512, 'Airbus A340', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (513, 'Boeing 727', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (514, 'Airbus A350', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (515, 'Tupolev Tu-204', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (516, 'Bombardier CRJ900', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (517, 'Mitsubishi Regional Jet', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (518, 'Boeing 767', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (519, 'McDonnell Douglas DC-10', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (520, 'Boeing 737', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (521, 'McDonnell Douglas MD-11', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (522, 'Lockheed L-1011', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (523, 'Boeing 737', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (524, 'McDonnell Douglas MD-11', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (525, 'Pilatus PC-24', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (526, 'Beechcraft King Air 250', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (527, 'Boeing 757', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (528, 'Antonov An-158', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (529, 'Mitsubishi Regional Jet', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (530, 'Airbus A340', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (531, 'Bombardier CS100', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (532, 'McDonnell Douglas MD-11', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (533, 'Boeing 747', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (534, 'Tupolev Tu-214', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (535, 'Bombardier CRJ700', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (536, 'Pilatus PC-24', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (537, 'Dassault Falcon 2000', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (538, 'Beechcraft King Air 250', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (539, 'Airbus A220', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (540, 'Airbus A380', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (541, 'Lockheed L-1011', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (542, 'Boeing 777', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (543, 'Tupolev Tu-214', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (544, 'Boeing 717', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (545, 'Cessna 172', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (546, 'Airbus A321', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (547, 'Bombardier Q400', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (548, 'Cessna 172', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (549, 'Airbus A320', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (550, 'Boeing 777', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (551, 'Bombardier CRJ900', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (552, 'Airbus A350', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (553, 'Tupolev Tu-204', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (554, 'Comac C919', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (555, 'Antonov An-148', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (556, 'Gulfstream G280', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (557, 'Tupolev Tu-204', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (558, 'Bombardier CS300', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (559, 'Comac ARJ21', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (560, 'Airbus A350', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (561, 'Tupolev Tu-214', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (562, 'Boeing 717', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (563, 'Bombardier CS300', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (564, 'Bombardier CS100', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (565, 'Gulfstream G280', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (566, 'Embraer E175', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (567, 'Comac ARJ21', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (568, 'Airbus A310', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (569, 'Boeing 767', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (570, 'Tupolev Tu-204', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (571, 'Boeing 720', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (572, 'Tupolev Tu-214', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (573, 'Beechcraft King Air 250', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (574, 'Boeing 787 Dreamliner', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (575, 'Tupolev Tu-204', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (576, 'Antonov An-158', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (577, 'Dassault Falcon 2000', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (578, 'Airbus A220', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (579, 'Tupolev Tu-204', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (580, 'Boeing 747', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (581, 'Embraer E190', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (582, 'Embraer E195', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (583, 'Gulfstream G650', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (584, 'Airbus A340', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (585, 'Boeing 717', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (586, 'Bombardier CRJ200', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (587, 'Gulfstream G280', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (588, 'Embraer E190', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (589, 'Comac C919', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (590, 'McDonnell Douglas DC-10', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (591, 'McDonnell Douglas DC-10', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (592, 'Ilyushin Il-96', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (593, 'Tupolev Tu-214', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (594, 'Airbus A321', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (595, 'Antonov An-158', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (596, 'Tupolev Tu-204', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (597, 'Bombardier CRJ200', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (598, 'Pilatus PC-24', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (599, 'Mitsubishi Regional Jet', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (600, 'Embraer E195', 242);
commit;
prompt 600 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (601, 'Dassault Falcon 7X', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (602, 'Comac ARJ21', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (603, 'Embraer E195', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (604, 'McDonnell Douglas MD-11', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (605, 'McDonnell Douglas DC-10', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (606, 'Bombardier CRJ700', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (607, 'Embraer E195', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (608, 'Gulfstream G280', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (609, 'Airbus A340', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (610, 'Boeing 727', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (611, 'Embraer E195', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (612, 'Beechcraft King Air 350', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (613, 'Airbus A350', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (614, 'Airbus A350', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (615, 'Airbus A321', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (616, 'Boeing 737', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (617, 'Boeing 720', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (618, 'Airbus A330', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (619, 'Boeing 737', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (620, 'Ilyushin Il-96', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (621, 'Boeing 727', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (622, 'Gulfstream G280', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (623, 'Tupolev Tu-214', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (624, 'Bombardier CRJ900', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (625, 'Bombardier CS100', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (626, 'Comac C919', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (627, 'Cessna 182', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (628, 'Embraer E190', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (629, 'Bombardier Q400', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (630, 'McDonnell Douglas MD-11', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (631, 'Airbus A380', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (632, 'Bombardier CRJ700', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (633, 'Bombardier CS100', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (634, 'Boeing 747', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (635, 'Airbus A310', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (636, 'Tupolev Tu-214', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (637, 'Bombardier CRJ700', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (638, 'Gulfstream G650', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (639, 'Tupolev Tu-214', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (640, 'Boeing 737', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (641, 'Cessna 182', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (642, 'Beechcraft King Air 350', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (643, 'Bombardier CRJ900', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (644, 'Antonov An-148', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (645, 'Boeing 727', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (646, 'Comac C919', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (647, 'Pilatus PC-24', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (648, 'Airbus A330', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (649, 'Airbus A220', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (650, 'Boeing 787 Dreamliner', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (651, 'Bombardier Q400', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (652, 'Boeing 720', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (653, 'Gulfstream G280', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (654, 'Boeing 777', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (655, 'Bombardier CRJ700', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (656, 'Cessna Citation X', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (657, 'Bombardier CS100', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (658, 'Bombardier CRJ700', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (659, 'Comac C919', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (660, 'Pilatus PC-24', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (661, 'Boeing 767', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (662, 'Gulfstream G550', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (663, 'Gulfstream G550', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (664, 'Beechcraft King Air 250', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (665, 'McDonnell Douglas DC-10', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (666, 'Antonov An-158', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (667, 'Boeing 787 Dreamliner', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (668, 'Boeing 767', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (669, 'Boeing 777', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (670, 'Airbus A380', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (671, 'Mitsubishi Regional Jet', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (672, 'Bombardier CRJ200', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (673, 'Gulfstream G550', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (674, 'Gulfstream G650', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (675, 'Gulfstream G650', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (676, 'Boeing 720', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (677, 'Airbus A340', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (678, 'Lockheed L-1011', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (679, 'Airbus A330', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (680, 'Beechcraft King Air 250', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (681, 'Antonov An-148', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (682, 'Airbus A350', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (683, 'Boeing 787 Dreamliner', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (684, 'Boeing 777', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (685, 'Comac ARJ21', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (686, 'Airbus A320', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (687, 'Gulfstream G280', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (688, 'Mitsubishi Regional Jet', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (689, 'Lockheed L-1011', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (690, 'McDonnell Douglas MD-11', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (691, 'Beechcraft King Air 250', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (692, 'Bombardier CRJ700', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (693, 'McDonnell Douglas DC-10', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (694, 'Pilatus PC-24', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (695, 'Boeing 747', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (696, 'Sukhoi Superjet 100', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (697, 'Boeing 787 Dreamliner', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (698, 'McDonnell Douglas MD-11', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (699, 'Airbus A380', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (700, 'Dassault Falcon 2000', 230);
commit;
prompt 700 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (701, 'Lockheed L-1011', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (702, 'Airbus A380', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (703, 'Pilatus PC-24', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (704, 'Beechcraft King Air 350', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (705, 'Embraer E195', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (706, 'Cessna 172', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (707, 'Embraer E175', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (708, 'Boeing 757', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (709, 'Beechcraft King Air 250', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (710, 'Dassault Falcon 2000', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (711, 'Cessna Citation X', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (712, 'Airbus A320', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (713, 'Boeing 727', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (714, 'Boeing 737', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (715, 'Boeing 727', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (716, 'Boeing 720', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (717, 'Airbus A340', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (718, 'McDonnell Douglas DC-10', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (719, 'Bombardier CS100', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (720, 'Pilatus PC-12', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (721, 'Antonov An-148', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (722, 'Boeing 727', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (723, 'Cessna 172', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (724, 'Comac ARJ21', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (725, 'Dassault Falcon 7X', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (726, 'Airbus A220', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (727, 'Pilatus PC-12', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (728, 'Airbus A321', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (729, 'Gulfstream G650', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (730, 'Boeing 787 Dreamliner', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (731, 'Dassault Falcon 2000', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (732, 'Gulfstream G550', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (733, 'Boeing 767', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (734, 'Tupolev Tu-204', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (735, 'McDonnell Douglas DC-10', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (736, 'Gulfstream G650', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (737, 'Antonov An-158', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (738, 'Boeing 737', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (739, 'McDonnell Douglas MD-11', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (740, 'Comac ARJ21', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (741, 'Beechcraft King Air 250', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (742, 'Embraer E190', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (743, 'Airbus A321', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (744, 'Bombardier CS100', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (745, 'Ilyushin Il-96', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (746, 'Airbus A320', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (747, 'Boeing 717', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (748, 'Boeing 717', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (749, 'Airbus A380', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (750, 'Bombardier CS100', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (751, 'Airbus A380', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (752, 'Lockheed L-1011', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (753, 'Airbus A321', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (754, 'Bombardier CRJ700', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (755, 'Bombardier CS300', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (756, 'Boeing 767', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (757, 'Airbus A350', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (758, 'Gulfstream G650', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (759, 'Cessna 172', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (760, 'Gulfstream G650', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (761, 'Boeing 737', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (762, 'Airbus A320', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (763, 'Antonov An-148', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (764, 'Boeing 777', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (765, 'Gulfstream G650', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (766, 'Bombardier CRJ700', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (767, 'Bombardier CS300', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (768, 'Tupolev Tu-214', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (769, 'Airbus A330', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (770, 'Bombardier CS300', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (771, 'Airbus A350', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (772, 'Airbus A321', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (773, 'Embraer E190', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (774, 'Lockheed L-1011', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (775, 'Bombardier Q400', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (776, 'Airbus A350', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (777, 'Cessna Citation X', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (778, 'Boeing 767', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (779, 'Lockheed L-1011', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (780, 'Bombardier CS100', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (781, 'Comac C919', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (782, 'Boeing 767', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (783, 'Embraer E195', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (784, 'Pilatus PC-12', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (785, 'Gulfstream G550', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (786, 'Sukhoi Superjet 100', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (787, 'Boeing 747', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (788, 'Boeing 757', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (789, 'Airbus A330', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (790, 'Beechcraft King Air 250', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (791, 'Ilyushin Il-96', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (792, 'Boeing 727', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (793, 'Boeing 757', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (794, 'Tupolev Tu-204', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (795, 'Airbus A380', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (796, 'Antonov An-148', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (797, 'Airbus A321', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (798, 'Dassault Falcon 7X', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (799, 'Boeing 757', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (800, 'Beechcraft King Air 250', 100);
commit;
prompt 800 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (801, 'Cessna 172', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (802, 'Airbus A380', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (803, 'Beechcraft King Air 250', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (804, 'Comac C919', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (805, 'Tupolev Tu-204', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (806, 'Embraer E190', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (807, 'Dassault Falcon 2000', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (808, 'Gulfstream G650', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (809, 'Pilatus PC-12', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (810, 'Mitsubishi Regional Jet', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (811, 'Sukhoi Superjet 100', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (812, 'Cessna 172', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (813, 'Airbus A350', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (814, 'Airbus A380', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (815, 'Dassault Falcon 7X', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (816, 'Gulfstream G650', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (817, 'Bombardier CRJ200', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (818, 'Airbus A321', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (819, 'Airbus A340', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (820, 'McDonnell Douglas DC-10', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (821, 'Comac ARJ21', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (822, 'Airbus A380', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (823, 'Embraer E190', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (824, 'Gulfstream G280', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (825, 'Mitsubishi Regional Jet', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (826, 'Bombardier Q400', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (827, 'Airbus A220', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (828, 'Mitsubishi Regional Jet', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (829, 'Airbus A340', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (830, 'Tupolev Tu-204', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (831, 'McDonnell Douglas DC-10', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (832, 'Bombardier CRJ900', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (833, 'Bombardier CS100', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (834, 'Boeing 727', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (835, 'Embraer E190', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (836, 'Gulfstream G650', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (837, 'Airbus A320', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (838, 'Mitsubishi Regional Jet', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (839, 'Tupolev Tu-204', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (840, 'Boeing 727', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (841, 'Bombardier CS100', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (842, 'Beechcraft King Air 350', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (843, 'Boeing 787 Dreamliner', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (844, 'Tupolev Tu-204', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (845, 'Antonov An-148', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (846, 'Antonov An-148', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (847, 'Boeing 737', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (848, 'Dassault Falcon 7X', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (849, 'Pilatus PC-24', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (850, 'Boeing 777', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (851, 'Lockheed L-1011', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (852, 'Airbus A310', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (853, 'McDonnell Douglas DC-10', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (854, 'Bombardier CS100', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (855, 'Airbus A340', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (856, 'Embraer E190', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (857, 'Embraer E190', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (858, 'Antonov An-148', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (859, 'Airbus A350', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (860, 'Airbus A340', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (861, 'Mitsubishi Regional Jet', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (862, 'Boeing 727', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (863, 'Embraer E190', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (864, 'Mitsubishi Regional Jet', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (865, 'Comac C919', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (866, 'Embraer E175', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (867, 'Airbus A321', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (868, 'Tupolev Tu-204', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (869, 'Cessna 182', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (870, 'Boeing 717', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (871, 'McDonnell Douglas MD-11', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (872, 'Boeing 737', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (873, 'Cessna 182', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (874, 'Tupolev Tu-204', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (875, 'Boeing 787 Dreamliner', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (876, 'Airbus A330', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (877, 'Airbus A321', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (878, 'Airbus A321', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (879, 'Pilatus PC-24', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (880, 'Dassault Falcon 2000', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (881, 'Embraer E190', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (882, 'Boeing 747', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (883, 'Bombardier CRJ900', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (884, 'McDonnell Douglas DC-10', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (885, 'Boeing 737', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (886, 'Comac C919', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (887, 'Sukhoi Superjet 100', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (888, 'Gulfstream G280', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (889, 'McDonnell Douglas MD-11', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (890, 'Boeing 720', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (891, 'Boeing 777', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (892, 'Dassault Falcon 2000', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (893, 'Airbus A350', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (894, 'Cessna 172', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (895, 'Bombardier CRJ900', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (896, 'Bombardier CRJ700', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (897, 'Boeing 767', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (898, 'Pilatus PC-24', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (899, 'Boeing 727', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (900, 'Tupolev Tu-214', 100);
commit;
prompt 900 records committed...
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (901, 'Bombardier CS100', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (902, 'Gulfstream G550', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (903, 'Beechcraft King Air 350', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (904, 'Boeing 767', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (905, 'Tupolev Tu-204', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (906, 'Antonov An-158', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (907, 'Pilatus PC-12', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (908, 'Beechcraft King Air 350', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (909, 'Beechcraft King Air 250', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (910, 'Pilatus PC-24', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (911, 'Boeing 737', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (912, 'Comac C919', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (913, 'Airbus A340', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (914, 'Airbus A310', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (915, 'Airbus A350', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (916, 'Lockheed L-1011', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (917, 'Bombardier CS300', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (918, 'Antonov An-148', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (919, 'Airbus A321', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (920, 'Embraer E175', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (921, 'Gulfstream G280', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (922, 'Bombardier CS300', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (923, 'Cessna Citation X', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (924, 'Airbus A320', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (925, 'Airbus A310', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (926, 'Dassault Falcon 7X', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (927, 'Antonov An-158', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (928, 'Gulfstream G550', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (929, 'McDonnell Douglas MD-11', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (930, 'Boeing 777', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (931, 'Embraer E190', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (932, 'Boeing 787 Dreamliner', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (933, 'Boeing 757', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (934, 'McDonnell Douglas DC-10', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (935, 'Lockheed L-1011', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (936, 'Cessna 172', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (937, 'Bombardier CRJ700', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (938, 'Boeing 767', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (939, 'Bombardier CS100', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (940, 'Airbus A320', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (941, 'Airbus A350', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (942, 'Boeing 720', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (943, 'Bombardier CRJ900', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (944, 'Airbus A320', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (945, 'Beechcraft King Air 250', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (946, 'Airbus A330', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (947, 'Cessna 172', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (948, 'Bombardier CRJ900', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (949, 'Bombardier CRJ700', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (950, 'Bombardier CRJ700', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (951, 'Lockheed L-1011', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (952, 'Airbus A380', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (953, 'Dassault Falcon 7X', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (954, 'Dassault Falcon 2000', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (955, 'Boeing 737', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (956, 'Pilatus PC-12', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (957, 'Sukhoi Superjet 100', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (958, 'Cessna Citation X', 140);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (959, 'Airbus A321', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (960, 'Beechcraft King Air 350', 215);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (961, 'Boeing 777', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (962, 'Dassault Falcon 7X', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (963, 'Boeing 757', 300);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (964, 'Bombardier CRJ700', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (965, 'Tupolev Tu-204', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (966, 'Bombardier CS300', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (967, 'Airbus A321', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (968, 'Cessna 182', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (969, 'Pilatus PC-24', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (970, 'Embraer E175', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (971, 'Airbus A340', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (972, 'Sukhoi Superjet 100', 100);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (973, 'Comac C919', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (974, 'Ilyushin Il-96', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (975, 'Beechcraft King Air 250', 280);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (976, 'Boeing 757', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (977, 'Comac ARJ21', 460);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (978, 'Gulfstream G280', 230);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (979, 'Beechcraft King Air 250', 190);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (980, 'Comac ARJ21', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (981, 'Boeing 747', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (982, 'Pilatus PC-24', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (983, 'Ilyushin Il-96', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (984, 'Tupolev Tu-214', 420);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (985, 'Ilyushin Il-96', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (986, 'Bombardier CRJ200', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (987, 'Mitsubishi Regional Jet', 320);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (988, 'Ilyushin Il-96', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (989, 'Embraer E195', 260);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (990, 'Dassault Falcon 2000', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (991, 'Boeing 777', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (992, 'Airbus A340', 150);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (993, 'Pilatus PC-12', 242);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (994, 'Boeing 747', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (995, 'Cessna Citation X', 400);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (996, 'Airbus A310', 170);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (997, 'Airbus A310', 500);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (998, 'Tupolev Tu-204', 200);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (999, 'Airbus A380', 350);
insert into AIRCRAFT (aircraft_id, aircraft_type, capacity)
values (1000, 'Bombardier CS300', 320);
commit;
prompt 1000 records loaded
prompt Loading AIRLINES...
insert into AIRLINES (airline_id, airline_name)
values (1, 'JetSky Airlines');
insert into AIRLINES (airline_id, airline_name)
values (2, 'AeroLink');
insert into AIRLINES (airline_id, airline_name)
values (3, 'SkyHigh Airways');
insert into AIRLINES (airline_id, airline_name)
values (4, 'StarFlyer');
insert into AIRLINES (airline_id, airline_name)
values (5, 'AirWave');
insert into AIRLINES (airline_id, airline_name)
values (6, 'FlyAway');
insert into AIRLINES (airline_id, airline_name)
values (7, 'SkyConnect');
insert into AIRLINES (airline_id, airline_name)
values (8, 'EagleAir');
insert into AIRLINES (airline_id, airline_name)
values (9, 'CloudNine Airlines');
insert into AIRLINES (airline_id, airline_name)
values (10, 'BlueSky Aviation');
insert into AIRLINES (airline_id, airline_name)
values (11, 'Sunrise Airways');
insert into AIRLINES (airline_id, airline_name)
values (12, 'Nimbus Airlines');
insert into AIRLINES (airline_id, airline_name)
values (13, 'VistaJet');
insert into AIRLINES (airline_id, airline_name)
values (14, 'GlobalWings');
insert into AIRLINES (airline_id, airline_name)
values (15, 'Harmony Air');
insert into AIRLINES (airline_id, airline_name)
values (16, 'AirHorizon');
insert into AIRLINES (airline_id, airline_name)
values (17, 'SwiftAir');
insert into AIRLINES (airline_id, airline_name)
values (18, 'VistaFly');
insert into AIRLINES (airline_id, airline_name)
values (19, 'Summit Airlines');
insert into AIRLINES (airline_id, airline_name)
values (20, 'AirQuest');
insert into AIRLINES (airline_id, airline_name)
values (21, 'Pioneer Air');
insert into AIRLINES (airline_id, airline_name)
values (22, 'Alpha Airlines');
insert into AIRLINES (airline_id, airline_name)
values (23, 'JourneyJet');
insert into AIRLINES (airline_id, airline_name)
values (24, 'Infinity Air');
insert into AIRLINES (airline_id, airline_name)
values (25, 'AirVenture');
insert into AIRLINES (airline_id, airline_name)
values (26, 'SkyQuest');
insert into AIRLINES (airline_id, airline_name)
values (27, 'PrimeAir');
insert into AIRLINES (airline_id, airline_name)
values (28, 'Galactic Airways');
insert into AIRLINES (airline_id, airline_name)
values (29, 'SkyVoyage');
insert into AIRLINES (airline_id, airline_name)
values (30, 'Nova Airlines');
insert into AIRLINES (airline_id, airline_name)
values (31, 'Explorer Air');
insert into AIRLINES (airline_id, airline_name)
values (32, 'Majestic Airlines');
insert into AIRLINES (airline_id, airline_name)
values (33, 'ApexAir');
insert into AIRLINES (airline_id, airline_name)
values (34, 'SkyGuard');
insert into AIRLINES (airline_id, airline_name)
values (35, 'Wingspan Airways');
insert into AIRLINES (airline_id, airline_name)
values (36, 'Skyline Air');
insert into AIRLINES (airline_id, airline_name)
values (37, 'Frontier Wings');
insert into AIRLINES (airline_id, airline_name)
values (38, 'Ascend Air');
insert into AIRLINES (airline_id, airline_name)
values (39, 'SkyBound');
insert into AIRLINES (airline_id, airline_name)
values (40, 'Eclipse Airways');
insert into AIRLINES (airline_id, airline_name)
values (41, 'SkyBridge');
insert into AIRLINES (airline_id, airline_name)
values (42, 'Radiant Air');
insert into AIRLINES (airline_id, airline_name)
values (43, 'OmniAir');
insert into AIRLINES (airline_id, airline_name)
values (44, 'Celestial Airlines');
insert into AIRLINES (airline_id, airline_name)
values (45, 'Zenith Air');
insert into AIRLINES (airline_id, airline_name)
values (46, 'AirVoyager');
insert into AIRLINES (airline_id, airline_name)
values (47, 'SkyGlide');
insert into AIRLINES (airline_id, airline_name)
values (48, 'Pinnacle Airlines');
insert into AIRLINES (airline_id, airline_name)
values (49, 'Altitude Air');
insert into AIRLINES (airline_id, airline_name)
values (50, 'Voyager Airways');
commit;
prompt 50 records loaded
prompt Loading AIRPORTS...
insert into AIRPORTS (airport_id, airport_name, location)
values (1000, 'JFK Airport', 'JFK');
insert into AIRPORTS (airport_id, airport_name, location)
values (1, 'Man Airport', 'MJC');
insert into AIRPORTS (airport_id, airport_name, location)
values (2, 'Saposoa Airport', 'SQU');
insert into AIRPORTS (airport_id, airport_name, location)
values (3, 'King Cove Airport', 'KVC');
insert into AIRPORTS (airport_id, airport_name, location)
values (4, 'Lal Bahadur Shastri Airport', 'VNS');
insert into AIRPORTS (airport_id, airport_name, location)
values (5, 'Garanhuns Airport', 'QGP');
insert into AIRPORTS (airport_id, airport_name, location)
values (6, 'Grand Junction Regional Airport', 'GJT');
insert into AIRPORTS (airport_id, airport_name, location)
values (7, 'Mampikony Airport', 'WMP');
insert into AIRPORTS (airport_id, airport_name, location)
values (8, 'Higuerote Airport', 'HGE');
insert into AIRPORTS (airport_id, airport_name, location)
values (9, 'Makokou Airport', 'MKU');
insert into AIRPORTS (airport_id, airport_name, location)
values (10, 'Adak Airport', 'ADK');
insert into AIRPORTS (airport_id, airport_name, location)
values (11, 'Tromsø Airport', 'TOS');
insert into AIRPORTS (airport_id, airport_name, location)
values (12, 'Ziro Airport', 'ZER');
insert into AIRPORTS (airport_id, airport_name, location)
values (13, 'Rapid City Regional Airport', 'RAP');
insert into AIRPORTS (airport_id, airport_name, location)
values (14, 'Fulton County Airport', 'RCR');
insert into AIRPORTS (airport_id, airport_name, location)
values (15, 'Henbury Airport', 'HRY');
insert into AIRPORTS (airport_id, airport_name, location)
values (16, 'Tauramena Airport', 'TAU');
insert into AIRPORTS (airport_id, airport_name, location)
values (17, 'Ignace Municipal Airport', 'ZUC');
insert into AIRPORTS (airport_id, airport_name, location)
values (18, 'Wanxian Airport', 'WXN');
insert into AIRPORTS (airport_id, airport_name, location)
values (19, 'Wellsville Municipal Arpt,Tarantine Field', 'ELZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (20, 'Lyon-Bron Airport', 'LYN');
insert into AIRPORTS (airport_id, airport_name, location)
values (21, 'Le Havre Octeville Airport', 'LEH');
insert into AIRPORTS (airport_id, airport_name, location)
values (22, 'Boké Baralande Airport', 'BKJ');
insert into AIRPORTS (airport_id, airport_name, location)
values (23, 'Kupiano Airport', 'KUP');
insert into AIRPORTS (airport_id, airport_name, location)
values (24, 'Agra Airport', 'AGR');
insert into AIRPORTS (airport_id, airport_name, location)
values (25, 'São José Airport', '0');
insert into AIRPORTS (airport_id, airport_name, location)
values (26, 'Nairobi Wilson Airport', 'WIL');
insert into AIRPORTS (airport_id, airport_name, location)
values (27, 'Nkaus Airport', 'NKU');
insert into AIRPORTS (airport_id, airport_name, location)
values (28, 'Liboi Airport', 'LBK');
insert into AIRPORTS (airport_id, airport_name, location)
values (29, 'Southeast Texas Regional Airport', 'BPT');
insert into AIRPORTS (airport_id, airport_name, location)
values (30, 'Long Banga Airport', 'LBP');
insert into AIRPORTS (airport_id, airport_name, location)
values (31, 'Aurukun Airport', 'AUU');
insert into AIRPORTS (airport_id, airport_name, location)
values (32, 'Santa Bárbara Airport', 'ISD');
insert into AIRPORTS (airport_id, airport_name, location)
values (33, 'Salem Airport', 'SXV');
insert into AIRPORTS (airport_id, airport_name, location)
values (34, 'Orinduik Airport', 'ORJ');
insert into AIRPORTS (airport_id, airport_name, location)
values (35, 'Seal Bay Seaplane Base', 'SYB');
insert into AIRPORTS (airport_id, airport_name, location)
values (36, 'Laoag International Airport', 'LAO');
insert into AIRPORTS (airport_id, airport_name, location)
values (37, 'Nyala Airport', 'UYL');
insert into AIRPORTS (airport_id, airport_name, location)
values (38, 'Tapuruquara Airport', 'IRZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (39, 'Jurien Bay Airport', 'JUR');
insert into AIRPORTS (airport_id, airport_name, location)
values (40, 'Ponta do Ouro Airport', 'PDD');
insert into AIRPORTS (airport_id, airport_name, location)
values (41, 'Gorakhpur Airport', 'GOP');
insert into AIRPORTS (airport_id, airport_name, location)
values (42, 'Oslo, Fornebu Airport', 'FBU');
insert into AIRPORTS (airport_id, airport_name, location)
values (43, 'El Recreo Airport', 'ELJ');
insert into AIRPORTS (airport_id, airport_name, location)
values (44, 'Oshakati Airport', 'OHI');
insert into AIRPORTS (airport_id, airport_name, location)
values (45, 'Emo River Airstrip', 'EMO');
insert into AIRPORTS (airport_id, airport_name, location)
values (46, 'Daytona Beach International Airport', 'DAB');
insert into AIRPORTS (airport_id, airport_name, location)
values (47, 'Ardmore Downtown Executive Airport', 'AHD');
insert into AIRPORTS (airport_id, airport_name, location)
values (48, 'Takhli Airport', 'TKH');
insert into AIRPORTS (airport_id, airport_name, location)
values (49, 'Dadu Airport', 'DDU');
insert into AIRPORTS (airport_id, airport_name, location)
values (50, 'Sentani International Airport', 'DJJ');
insert into AIRPORTS (airport_id, airport_name, location)
values (51, 'Lympne Airport', 'LYM');
insert into AIRPORTS (airport_id, airport_name, location)
values (52, 'Londolozi Airport', 'LDZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (53, 'Louis Armstrong New Orleans International Airport', 'MSY');
insert into AIRPORTS (airport_id, airport_name, location)
values (54, 'Spring Creek Airport', 'SCG');
insert into AIRPORTS (airport_id, airport_name, location)
values (55, 'Alldays Airport', 'ADY');
insert into AIRPORTS (airport_id, airport_name, location)
values (56, 'A L Mangham Jr. Regional Airport', 'OCH');
insert into AIRPORTS (airport_id, airport_name, location)
values (57, 'Great Barrier Aerodrome', 'GBZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (58, 'Boundiali Airport', 'BXI');
insert into AIRPORTS (airport_id, airport_name, location)
values (59, 'O R Tambo International', 'JNB');
insert into AIRPORTS (airport_id, airport_name, location)
values (60, 'Kempegowda International Airport', 'BLR');
insert into AIRPORTS (airport_id, airport_name, location)
values (61, 'Riverton Regional Airport', 'RIW');
insert into AIRPORTS (airport_id, airport_name, location)
values (62, 'Bimin Airport', 'BIZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (63, 'Daloa Airport', 'DJO');
insert into AIRPORTS (airport_id, airport_name, location)
values (64, 'Indira Gandhi International Airport', 'DEL');
insert into AIRPORTS (airport_id, airport_name, location)
values (65, 'Arapiraca Airport', 'APQ');
insert into AIRPORTS (airport_id, airport_name, location)
values (66, 'Liepaja International Airport', 'LPX');
insert into AIRPORTS (airport_id, airport_name, location)
values (67, 'Puerto Paez Airport', 'PPZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (68, 'Nkaus Airport', 'NKU');
insert into AIRPORTS (airport_id, airport_name, location)
values (69, 'Mönchengladbach Airport', 'MGL');
insert into AIRPORTS (airport_id, airport_name, location)
values (70, 'Paris-Le Bourget Airport', 'LBG');
insert into AIRPORTS (airport_id, airport_name, location)
values (71, 'Wellington International Airport', 'WLG');
insert into AIRPORTS (airport_id, airport_name, location)
values (72, 'Guacamayas Airport', 'GCA');
insert into AIRPORTS (airport_id, airport_name, location)
values (73, 'Tibooburra Airport', 'TYB');
insert into AIRPORTS (airport_id, airport_name, location)
values (74, 'Saenz Peña Airport', 'SZQ');
insert into AIRPORTS (airport_id, airport_name, location)
values (75, 'Vance W. Amory International Airport', 'NEV');
insert into AIRPORTS (airport_id, airport_name, location)
values (76, 'Nha Trang Air Base', 'NHA');
insert into AIRPORTS (airport_id, airport_name, location)
values (77, 'Mahendranagar Airport', 'XMG');
insert into AIRPORTS (airport_id, airport_name, location)
values (78, 'Carlos Ruhl Airport', 'CZB');
insert into AIRPORTS (airport_id, airport_name, location)
values (79, 'Boende Airport', 'BNB');
insert into AIRPORTS (airport_id, airport_name, location)
values (80, 'Sachigo Lake Airport', 'ZPB');
insert into AIRPORTS (airport_id, airport_name, location)
values (81, 'Pontes e Lacerda Airport', 'LCB');
insert into AIRPORTS (airport_id, airport_name, location)
values (82, 'Congonhas Airport', 'CGH');
insert into AIRPORTS (airport_id, airport_name, location)
values (83, 'Carlos Miguel Gimenez Airport', 'PIL');
insert into AIRPORTS (airport_id, airport_name, location)
values (84, 'Jefferson County International Airport', 'TWD');
insert into AIRPORTS (airport_id, airport_name, location)
values (85, 'Batesville Regional Airport', 'BVX');
insert into AIRPORTS (airport_id, airport_name, location)
values (86, 'Bella Bella (Campbell Island) Airport', 'ZEL');
insert into AIRPORTS (airport_id, airport_name, location)
values (87, 'Nogliki Airport', 'NGK');
insert into AIRPORTS (airport_id, airport_name, location)
values (88, 'Gympie Airport', 'GYP');
insert into AIRPORTS (airport_id, airport_name, location)
values (89, 'Viveros Island Airport', 'IVI');
insert into AIRPORTS (airport_id, airport_name, location)
values (90, 'Zamzama Heliport', 'ZIZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (91, 'Deauville-Saint-Gatien Airport', 'DOL');
insert into AIRPORTS (airport_id, airport_name, location)
values (92, 'Napperby Airport', 'NPP');
insert into AIRPORTS (airport_id, airport_name, location)
values (93, 'Valence-Chabeuil Airport', 'VAF');
insert into AIRPORTS (airport_id, airport_name, location)
values (94, 'Fort Yukon Airport', 'FYU');
insert into AIRPORTS (airport_id, airport_name, location)
values (95, 'De La Independencia Airport', 'QRC');
insert into AIRPORTS (airport_id, airport_name, location)
values (96, 'Kalay Airport', 'KMV');
insert into AIRPORTS (airport_id, airport_name, location)
values (97, 'Rae Lakes Airport', 'YRA');
insert into AIRPORTS (airport_id, airport_name, location)
values (98, 'Mangshi Airport', 'LUM');
insert into AIRPORTS (airport_id, airport_name, location)
values (99, 'Santa Vitória do Palmar Airport', 'CTQ');
commit;
prompt 100 records committed...
insert into AIRPORTS (airport_id, airport_name, location)
values (100, 'Thousand Islands Regional Tackaberry Airport', 'XBR');
insert into AIRPORTS (airport_id, airport_name, location)
values (101, 'Alexandra Airport', 'ALR');
insert into AIRPORTS (airport_id, airport_name, location)
values (102, 'Ercan International Airport', 'ECN');
insert into AIRPORTS (airport_id, airport_name, location)
values (103, 'Kalymnos Airport', 'JKL');
insert into AIRPORTS (airport_id, airport_name, location)
values (104, 'Mammoth Yosemite Airport', 'MMH');
insert into AIRPORTS (airport_id, airport_name, location)
values (105, 'Chelyabinsk Balandino Airport', 'CEK');
insert into AIRPORTS (airport_id, airport_name, location)
values (106, 'Okierabu Airport', 'OKE');
insert into AIRPORTS (airport_id, airport_name, location)
values (107, 'Rickenbacker International Airport', 'LCK');
insert into AIRPORTS (airport_id, airport_name, location)
values (108, 'Jacksonville International Airport', 'JAX');
insert into AIRPORTS (airport_id, airport_name, location)
values (109, 'Jingdezhen Airport', 'JDZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (110, 'Lastourville Airport', 'LTL');
insert into AIRPORTS (airport_id, airport_name, location)
values (111, 'Kira Airport', 'KIQ');
insert into AIRPORTS (airport_id, airport_name, location)
values (112, 'Moanamani Airport', 'ONI');
insert into AIRPORTS (airport_id, airport_name, location)
values (113, 'RAF Benson', 'BEX');
insert into AIRPORTS (airport_id, airport_name, location)
values (114, 'Kar Kar Airport', 'KRX');
insert into AIRPORTS (airport_id, airport_name, location)
values (115, 'Whistler/Green Lake Water Aerodrome', 'YWS');
insert into AIRPORTS (airport_id, airport_name, location)
values (116, 'Langimar Airport', 'LNM');
insert into AIRPORTS (airport_id, airport_name, location)
values (117, 'Bellona/Anua Airport', 'BNY');
insert into AIRPORTS (airport_id, airport_name, location)
values (118, 'Tehachapi Municipal Airport', 'TSP');
insert into AIRPORTS (airport_id, airport_name, location)
values (119, 'Maués Airport', 'MBZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (120, 'Zinder Airport', 'ZND');
insert into AIRPORTS (airport_id, airport_name, location)
values (121, 'San Salvador de Paul Airport', 'SVV');
insert into AIRPORTS (airport_id, airport_name, location)
values (122, 'Santorini Airport', 'JTR');
insert into AIRPORTS (airport_id, airport_name, location)
values (123, 'Kemi-Tornio Airport', 'KEM');
insert into AIRPORTS (airport_id, airport_name, location)
values (124, 'Méndez Airport', 'MZD');
insert into AIRPORTS (airport_id, airport_name, location)
values (125, 'Moorea Airport', 'MOZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (126, 'Marawaka Airport', 'MWG');
insert into AIRPORTS (airport_id, airport_name, location)
values (127, 'Sanga Sanga Airport', 'TWT');
insert into AIRPORTS (airport_id, airport_name, location)
values (128, 'Stebbins Airport', 'WBB');
insert into AIRPORTS (airport_id, airport_name, location)
values (129, 'Coleman Municipal Airport', 'COM');
insert into AIRPORTS (airport_id, airport_name, location)
values (130, 'Begumpet Airport', 'BPM');
insert into AIRPORTS (airport_id, airport_name, location)
values (131, 'Easterwood Field', 'CLL');
insert into AIRPORTS (airport_id, airport_name, location)
values (132, 'Aishalton Airport', 'AHL');
insert into AIRPORTS (airport_id, airport_name, location)
values (133, 'Keshod Airport', 'IXK');
insert into AIRPORTS (airport_id, airport_name, location)
values (134, 'St Gallen Altenrhein Airport', 'ACH');
insert into AIRPORTS (airport_id, airport_name, location)
values (135, 'Bulagtai Resort Airport', 'UGT');
insert into AIRPORTS (airport_id, airport_name, location)
values (136, 'Honinabi Airport', 'HNN');
insert into AIRPORTS (airport_id, airport_name, location)
values (137, 'Booue Airport', 'BGB');
insert into AIRPORTS (airport_id, airport_name, location)
values (138, 'Banak Airport', 'LKL');
insert into AIRPORTS (airport_id, airport_name, location)
values (139, 'Elizabeth Field', 'FID');
insert into AIRPORTS (airport_id, airport_name, location)
values (140, 'New Chitose Airport', 'CTS');
insert into AIRPORTS (airport_id, airport_name, location)
values (141, 'Taldykorgan Airport', 'TDK');
insert into AIRPORTS (airport_id, airport_name, location)
values (142, 'Pyay Airport', 'PRU');
insert into AIRPORTS (airport_id, airport_name, location)
values (143, 'Chennai International Airport', 'MAA');
insert into AIRPORTS (airport_id, airport_name, location)
values (144, 'Cagliari Elmas Airport', 'CAG');
insert into AIRPORTS (airport_id, airport_name, location)
values (145, 'Kaieteur International Airport', 'KAI');
insert into AIRPORTS (airport_id, airport_name, location)
values (146, 'Leshukonskoye Airport', 'LDG');
insert into AIRPORTS (airport_id, airport_name, location)
values (147, 'Wilbarger County Airport', 'WIB');
insert into AIRPORTS (airport_id, airport_name, location)
values (148, 'Cotulla-La Salle County Airport', 'COT');
insert into AIRPORTS (airport_id, airport_name, location)
values (149, 'Roberts Army Heliport', 'SYL');
insert into AIRPORTS (airport_id, airport_name, location)
values (150, 'Angoon Seaplane Base', 'AGN');
insert into AIRPORTS (airport_id, airport_name, location)
values (151, 'Bouarfa Airport', 'UAR');
insert into AIRPORTS (airport_id, airport_name, location)
values (152, 'Fritzlar Airport', 'FRZ');
insert into AIRPORTS (airport_id, airport_name, location)
values (153, 'Sultan Azlan Shah Airport', 'IPH');
insert into AIRPORTS (airport_id, airport_name, location)
values (154, 'Achinsk Airport', 'ACS');
insert into AIRPORTS (airport_id, airport_name, location)
values (155, 'Pangnirtung Airport', 'YXP');
insert into AIRPORTS (airport_id, airport_name, location)
values (156, 'Presidente Nicolau Lobato International Airport', 'DIL');
insert into AIRPORTS (airport_id, airport_name, location)
values (157, 'Gorakhpur Airport', 'GOP');
insert into AIRPORTS (airport_id, airport_name, location)
values (158, 'Jeongseok Airport', 'JDG');
insert into AIRPORTS (airport_id, airport_name, location)
values (159, 'Port of Poulsbo Marina Moorage Seaplane Base', 'PUL');
insert into AIRPORTS (airport_id, airport_name, location)
values (160, 'King Salmon Airport', 'AKN');
insert into AIRPORTS (airport_id, airport_name, location)
values (161, 'Baise Youjiang Airport', 'AEB');
insert into AIRPORTS (airport_id, airport_name, location)
values (162, 'Alxa Right Banner Badanjilin Airport', 'RHT');
insert into AIRPORTS (airport_id, airport_name, location)
values (163, 'Bultfontein Airport', 'UTE');
insert into AIRPORTS (airport_id, airport_name, location)
values (164, 'Tum Airport', 'TUJ');
insert into AIRPORTS (airport_id, airport_name, location)
values (165, 'Tte. Julio Gallardo Airport', 'PNT');
insert into AIRPORTS (airport_id, airport_name, location)
values (166, 'Ua Pou Airport', 'UAP');
insert into AIRPORTS (airport_id, airport_name, location)
values (167, 'Camiguin Airport', 'CGM');
insert into AIRPORTS (airport_id, airport_name, location)
values (168, 'Syros Airport', 'JSY');
insert into AIRPORTS (airport_id, airport_name, location)
values (169, 'Francisco Beltrão Airport', 'FBE');
insert into AIRPORTS (airport_id, airport_name, location)
values (170, 'Kerama Airport', 'KJP');
insert into AIRPORTS (airport_id, airport_name, location)
values (171, 'Djambala Airport', 'DJM');
insert into AIRPORTS (airport_id, airport_name, location)
values (172, 'Sir Grantley Adams International Airport', 'BGI');
insert into AIRPORTS (airport_id, airport_name, location)
values (173, 'Frank Pais International Airport', 'HOG');
insert into AIRPORTS (airport_id, airport_name, location)
values (174, 'San Cristobal de las Casas Airport', 'SZT');
insert into AIRPORTS (airport_id, airport_name, location)
values (175, 'Kadanwari Airport', 'KCF');
insert into AIRPORTS (airport_id, airport_name, location)
values (176, 'New Plymouth Airport', 'NPL');
insert into AIRPORTS (airport_id, airport_name, location)
values (177, 'Drake Field', 'FYV');
insert into AIRPORTS (airport_id, airport_name, location)
values (178, 'São Borja Airport', 'QOJ');
insert into AIRPORTS (airport_id, airport_name, location)
values (179, 'Bella Yella Airport', 'BYL');
insert into AIRPORTS (airport_id, airport_name, location)
values (180, 'Viveros Island Airport', 'IVI');
insert into AIRPORTS (airport_id, airport_name, location)
values (181, 'Roi Et Airport', 'ROI');
insert into AIRPORTS (airport_id, airport_name, location)
values (182, 'London City Airport', 'LCY');
insert into AIRPORTS (airport_id, airport_name, location)
values (183, 'Toulouse-Blagnac Airport', 'TLS');
insert into AIRPORTS (airport_id, airport_name, location)
values (184, 'Tungsten (Cantung) Airport', 'TNS');
insert into AIRPORTS (airport_id, airport_name, location)
values (185, 'Cadete FAP Guillermo Del Castillo Paredes Airport', 'TPP');
insert into AIRPORTS (airport_id, airport_name, location)
values (186, 'Lands End Airport', 'LEQ');
insert into AIRPORTS (airport_id, airport_name, location)
values (187, 'Gdansk Lech Walesa Airport', 'GDN');
insert into AIRPORTS (airport_id, airport_name, location)
values (188, 'Martinique Aimé Césaire International Airport', 'FDF');
insert into AIRPORTS (airport_id, airport_name, location)
values (189, 'Headingly Airport', 'HIP');
insert into AIRPORTS (airport_id, airport_name, location)
values (190, 'Kaohsiung International Airport', 'KHH');
insert into AIRPORTS (airport_id, airport_name, location)
values (191, 'Nyngan Airport', 'NYN');
insert into AIRPORTS (airport_id, airport_name, location)
values (192, 'Split Airport', 'SPU');
insert into AIRPORTS (airport_id, airport_name, location)
values (193, 'El Bayadh Airport', 'EBH');
insert into AIRPORTS (airport_id, airport_name, location)
values (194, 'Egal International Airport', 'HGA');
insert into AIRPORTS (airport_id, airport_name, location)
values (195, 'Sable Island Landing Strip', 'YSA');
insert into AIRPORTS (airport_id, airport_name, location)
values (196, 'Guardiamarina Zañartu Airport', 'WPU');
insert into AIRPORTS (airport_id, airport_name, location)
values (197, 'Togiak Airport', 'TOG');
insert into AIRPORTS (airport_id, airport_name, location)
values (198, 'Shenzhen Baoan International Airport', 'SZX');
insert into AIRPORTS (airport_id, airport_name, location)
values (199, 'Menyamya Airport', 'MYX');
commit;
prompt 200 records committed...
insert into AIRPORTS (airport_id, airport_name, location)
values (200, 'Amchitka Army Airfield', 'AHT');
commit;
prompt 201 records loaded
prompt Loading FLIGHTS...
prompt Table is empty
prompt Loading PASSENGERS...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (1, 'Oralla Ingledew', '+7 241 388 1911', 'oingledew0@tamu.edu', 'D7Z-YIX-MLM', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (2, 'Iolanthe Fontenot', '+86 467 677 0584', 'ifontenot1@instagram.com', 'E4Z-CS7-9GJ', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (3, 'Orlan Chainey', '+268 102 652 6906', 'ochainey2@desdev.cn', '4BH-9OE-90T', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (4, 'Zebadiah Pluvier', '+1 801 113 9262', 'zpluvier3@tmall.com', '58M-YFF-3TE', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (5, 'Gabbi Kenrat', '+84 129 877 3930', 'gkenrat4@zimbio.com', 'KX2-D9W-3VY', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (6, 'Rosamund Eccleshare', '+63 432 599 4726', 'reccleshare5@google.com.hk', 'JKA-P1G-I95', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (7, 'Harold Mandell', '+62 165 485 0863', 'hmandell6@paginegialle.it', 'Y4Z-5K1-CIT', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (8, 'Christopher Wilcocke', '+55 480 112 5527', 'cwilcocke7@who.int', 'R4E-29W-J77', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (9, 'Zondra Haruard', '+1 269 309 9033', 'zharuard8@dagondesign.com', 'D9Q-L8M-1VJ', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (10, 'Annelise Tonbridge', '+62 556 420 0996', 'atonbridge9@angelfire.com', 'XA2-T0Q-CSG', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (11, 'Roger Attwoull', '+46 138 734 0995', 'rattwoulla@opensource.org', 'Q0S-43S-7AW', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (12, 'Port Beilby', '+380 720 655 6488', 'pbeilbyb@shutterfly.com', '8YR-XFT-Q0V', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (13, 'Ingrim Merricks', '+48 280 914 7453', 'imerricksc@deliciousdays.com', 'Z2O-SFD-SFK', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (14, 'Timoteo Jirusek', '+86 958 712 4484', 'tjirusekd@techcrunch.com', 'ET0-GL9-48H', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (15, 'Orion Leese', '+94 689 418 1586', 'oleesee@goodreads.com', 'K0M-468-7ID', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (16, 'Janelle Muro', '+46 355 100 1709', 'jmurof@sitemeter.com', 'HSU-EIV-8X9', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (17, 'Datha Blune', '+225 176 242 0546', 'dbluneg@google.ru', 'VY2-5Z3-FVO', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (18, 'Cointon Alwin', '+86 657 950 3234', 'calwinh@pen.io', 'ZRH-AH9-6W1', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (19, 'Bill Suart', '+1 417 985 0322', 'bsuarti@163.com', 'TWY-4VV-WA6', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (20, 'Alysia Dinsale', '+46 889 876 3544', 'adinsalej@hubpages.com', '6Y8-PT2-S8B', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (21, 'Sheridan Goldes', '+33 318 240 3853', 'sgoldesk@yahoo.co.jp', '1YF-7AD-M35', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (22, 'Siusan McMurthy', '+86 431 260 7904', 'smcmurthyl@topsy.com', 'B9U-15V-CBH', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (23, 'Fredra Juszczyk', '+86 738 745 1132', 'fjuszczykm@pbs.org', 'V7Q-0BB-J8E', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (24, 'Averil Keeting', '+63 283 298 2049', 'akeetingn@microsoft.com', 'IST-EQA-EPC', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (25, 'Rafaelia Bielefeld', '+55 406 911 4985', 'rbielefeldo@blinklist.com', '6VZ-CJK-EEO', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (26, 'Brigid Vernham', '+52 819 609 1567', 'bvernhamp@narod.ru', '14I-B9V-66P', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (27, 'Gareth Lumley', '+380 179 947 2045', 'glumleyq@cam.ac.uk', 'U36-AAQ-AL8', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (28, 'Delcine Haselhurst', '+66 140 181 1779', 'dhaselhurstr@blogger.com', 'TMC-X08-5D7', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (29, 'Harlie Newstead', '+86 169 433 0615', 'hnewsteads@ezinearticles.com', 'L9S-MO9-5V0', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (30, 'Charlene Dunnaway', '+27 153 325 5603', 'cdunnawayt@chronoengine.com', 'DS8-2YH-8CT', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (31, 'Sonni Corner', '+7 880 363 5646', 'scorneru@facebook.com', '5B7-A7D-WWC', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (32, 'Elisabet Muino', '+46 972 383 8420', 'emuinov@mapy.cz', 'AW6-420-586', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (33, 'Zaccaria Nussey', '+58 438 868 9590', 'znusseyw@nhs.uk', 'V2W-B11-233', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (34, 'Orion Ashment', '+380 947 857 1731', 'oashmentx@state.gov', 'WKT-1DD-VAK', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (35, 'Amelie Howlett', '+63 246 545 7358', 'ahowletty@cam.ac.uk', '9ND-J9V-VDN', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (36, 'Rosabel Wise', '+33 154 624 2395', 'rwisez@vimeo.com', '2VF-6SL-IO7', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (37, 'Susanne Borrowman', '+55 910 622 8260', 'sborrowman10@reference.com', 'AFP-CIN-G3D', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (38, 'Cathrin Bartot', '+62 441 274 9004', 'cbartot11@microsoft.com', 'AKK-WZF-IMP', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (39, 'Celeste Lombard', '+241 697 849 1718', 'clombard12@wiley.com', 'U3A-Q83-N29', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (40, 'Bibby Blackah', '+86 987 729 0630', 'bblackah13@pen.io', 'DAQ-BJX-CED', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (41, 'Corrina Fishenden', '+62 683 255 0251', 'cfishenden14@nbcnews.com', '371-3CZ-Q43', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (42, 'Madeline Hassan', '+351 584 754 3681', 'mhassan15@w3.org', 'T0H-OSS-F3I', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (43, 'Kiah Cuerdall', '+234 374 352 2319', 'kcuerdall16@dot.gov', '0KP-14L-WFS', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (44, 'Norina Lante', '+7 577 489 1150', 'nlante17@zimbio.com', '8YH-GZL-G4Q', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (45, 'Thaddus Porcher', '+380 424 947 4531', 'tporcher18@dedecms.com', '9UL-G5G-ZBA', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (46, 'Gayel Beckingham', '+58 883 813 6279', 'gbeckingham19@census.gov', 'RHD-TVX-QPV', 12);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (47, 'Margot McNutt', '+62 595 279 3649', 'mmcnutt1a@quantcast.com', 'GYA-S6U-FHX', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (48, 'Lishe OSherrin', '+251 466 641 1243', 'losherrin1b@woothemes.com', '8D0-3GT-5HW', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (49, 'Wes Vanichkin', '+972 492 504 1040', 'wvanichkin1c@google.ru', 'PTK-0NP-0C0', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (50, 'Thorndike Bartholin', '+86 742 184 5480', 'tbartholin1d@answers.com', 'U1U-NFH-YB5', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (51, 'Howard Towersey', '+62 852 866 9299', 'htowersey1e@surveymonkey.com', 'DRX-I73-9NW', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (52, 'Estevan Andriveaux', '+57 548 130 3752', 'eandriveaux1f@youtube.com', '8KK-SD2-AKC', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (53, 'Charlene Giddings', '+507 773 950 3631', 'cgiddings1g@diigo.com', '89G-C3A-VBR', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (54, 'Car Shilito', '+7 597 689 9170', 'cshilito1h@ning.com', 'MH6-5UC-O8C', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (55, 'Nissa Kidwell', '+66 146 295 5044', 'nkidwell1i@hp.com', '8E5-F44-H5H', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (56, 'Emilee Andriveau', '+380 533 501 7715', 'eandriveau1j@free.fr', 'N6G-12L-F2M', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (57, 'Zsazsa Cheater', '+62 687 281 9526', 'zcheater1k@vk.com', '4BU-53A-SRK', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (58, 'Rosie Duigan', '+7 169 201 3523', 'rduigan1l@mtv.com', 'HA3-Z1L-VDV', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (59, 'Madelina Hoovart', '+51 296 883 7978', 'mhoovart1m@google.ca', 'FFZ-T1O-RW0', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (60, 'Karolina Corneliussen', '+507 422 932 9468', 'kcorneliussen1n@friendfeed.com', 'Z6E-RLM-4N7', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (61, 'Devora Cole', '+94 840 905 9118', 'dcole1o@dyndns.org', '84K-K5X-27F', 11);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (62, 'Sabrina Maddinon', '+33 307 519 3181', 'smaddinon1p@sina.com.cn', 'CLQ-ESD-I6T', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (63, 'Tabbi Iacobetto', '+1 232 556 8359', 'tiacobetto1q@gov.uk', 'D1B-KBG-7SE', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (64, 'Georgette Franckton', '+63 875 173 7741', 'gfranckton1r@histats.com', '6FC-22H-QQL', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (65, 'Gilbertine Casina', '+880 425 991 9867', 'gcasina1s@infoseek.co.jp', 'Z6A-8A1-7NR', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (66, 'Gerda Gergus', '+351 454 706 2827', 'ggergus1t@nih.gov', '0KF-18F-FPR', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (67, 'Pam Spawforth', '+62 942 193 7337', 'pspawforth1u@slashdot.org', 'ITU-8HB-J0U', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (68, 'Odey Helliker', '+507 358 985 2429', 'ohelliker1v@usa.gov', 'V3J-ZKO-WOT', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (69, 'Salomone Binford', '+63 967 700 9254', 'sbinford1w@ow.ly', 'B5A-9H6-G6E', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (70, 'Milena Conlon', '+86 550 319 5639', 'mconlon1x@wikia.com', 'IJY-6O6-A8J', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (71, 'Zechariah Kezor', '+86 627 704 6052', 'zkezor1y@yahoo.co.jp', '3JG-IM9-1TQ', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (72, 'Cathyleen Petrussi', '+967 947 262 9922', 'cpetrussi1z@toplist.cz', 'KEF-MLH-BF6', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (73, 'Burl Draysey', '+994 279 183 2543', 'bdraysey20@forbes.com', 'WX2-0XX-UJ0', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (74, 'Dominick Huscroft', '+48 718 672 6063', 'dhuscroft21@netscape.com', 'RQG-WF8-0UV', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (75, 'Devondra Pierce', '+226 419 458 4554', 'dpierce22@joomla.org', '7LQ-TY7-7TJ', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (76, 'Suzette Kobpal', '+503 444 573 3119', 'skobpal23@boston.com', 'FN8-2X6-6IW', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (77, 'Stephi Snoday', '+86 676 450 7187', 'ssnoday24@plala.or.jp', '2BO-3ZJ-QRT', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (78, 'Esther Rubinowitsch', '+62 634 403 4245', 'erubinowitsch25@google.com.au', 'PJ3-32H-LKM', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (79, 'Adiana Larkkem', '+46 376 388 2305', 'alarkkem26@digg.com', '6CN-0A0-Y0W', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (80, 'Merle Grieves', '+33 287 913 5705', 'mgrieves27@samsung.com', '50S-D9L-KTH', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (81, 'Nikoletta Filipyev', '+7 675 392 5367', 'nfilipyev28@uiuc.edu', 'VQF-DOG-Y2H', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (82, 'Shayne Seden', '+48 536 282 4336', 'sseden29@technorati.com', 'LJB-2PF-BCH', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (83, 'Viola Klulicek', '+1 516 615 8063', 'vklulicek2a@netscape.com', 'QNA-81P-HM7', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (84, 'Janeva Hopkynson', '+48 657 826 7965', 'jhopkynson2b@fastcompany.com', 'D6L-QOH-LXL', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (85, 'Hyacinthe Dorwood', '+970 274 713 8392', 'hdorwood2c@joomla.org', 'TOY-VHU-YZX', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (86, 'Catlee Ferier', '+86 998 812 7099', 'cferier2d@engadget.com', '9BE-EU7-7DU', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (87, 'Kerri Stempe', '+62 855 451 8363', 'kstempe2e@mashable.com', 'NBW-N9J-N1J', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (88, 'Mike Wells', '+58 304 847 8019', 'mwells2f@51.la', 'C27-2C8-93R', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (89, 'Andreas Farran', '+30 512 414 7663', 'afarran2g@reddit.com', '9XE-I56-MG7', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (90, 'Vernon Dobbing', '+420 263 229 2727', 'vdobbing2h@earthlink.net', 'J7A-ETW-2IN', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (91, 'Holly Rockhall', '+46 658 527 1322', 'hrockhall2i@xrea.com', '7RB-6V6-FER', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (92, 'Clifford Fynan', '+81 182 216 2557', 'cfynan2j@toplist.cz', '1VU-J00-KM1', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (93, 'West Scullin', '+1 954 117 7964', 'wscullin2k@twitter.com', 'NIG-K8N-9OM', 12);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (94, 'Larry Rawsthorne', '+7 725 756 0321', 'lrawsthorne2l@ca.gov', 'MI0-2IH-4MW', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (95, 'Celie Eouzan', '+596 479 383 8918', 'ceouzan2m@devhub.com', 'I6L-B82-DF0', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (96, 'Letti Lobe', '+242 102 964 2525', 'llobe2n@dedecms.com', 'BFQ-C19-4UU', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (97, 'Robbin Jurkowski', '+254 266 339 7921', 'rjurkowski2o@tmall.com', '2NM-MMI-5XG', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (98, 'Franklyn Fleetham', '+66 136 534 1586', 'ffleetham2p@ibm.com', 'A8A-C0L-YYU', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (99, 'Bobbie Garvagh', '+46 723 134 7452', 'bgarvagh2q@webmd.com', 'CFH-FAY-8V6', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (100, 'Marten Litzmann', '+33 946 376 5090', 'mlitzmann2r@mail.ru', 'XA9-R2C-KKI', 23);
commit;
prompt 100 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (101, 'Dav Migheli', '+63 239 336 1357', 'dmigheli2s@ucsd.edu', 'NHP-KF7-O2I', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (102, 'Estel Flello', '+86 694 167 5590', 'eflello2t@tamu.edu', 'I1V-2NW-R8A', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (103, 'Derby Goldman', '+31 111 846 2982', 'dgoldman2u@soup.io', 'FGR-EA2-UC1', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (104, 'Sauveur Bergstram', '+33 666 307 9651', 'sbergstram2v@barnesandnoble.com', 'ZJJ-MYY-2PS', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (105, 'Yurik Treverton', '+86 999 496 7615', 'ytreverton2w@exblog.jp', '0LA-4JH-TMY', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (106, 'Temp Philippsohn', '+386 278 204 2775', 'tphilippsohn2x@weather.com', '05M-05T-ZK5', 31);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (107, 'Victor Grigoryev', '+48 954 533 6905', 'vgrigoryev2y@salon.com', '3H2-5AZ-XF5', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (108, 'Kassie Gerriessen', '+33 283 308 1517', 'kgerriessen2z@bbc.co.uk', 'ZTE-ZD8-0JE', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (109, 'Dannel Bachelar', '+86 282 661 5216', 'dbachelar30@diigo.com', 'Q1K-I8G-KV6', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (110, 'Hall Lamport', '+258 541 480 1995', 'hlamport31@hexun.com', 'G0S-8A8-9S8', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (111, 'Gunar Roselli', '+226 284 453 9467', 'groselli32@chron.com', 'KH1-XWT-2S4', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (112, 'Lonny Onele', '+86 329 474 0815', 'lonele33@gizmodo.com', 'E0M-FQO-B3H', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (113, 'Miller Backen', '+880 535 345 0981', 'mbacken34@scientificamerican.com', 'YK5-VUU-LK0', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (114, 'Robyn Kemish', '+1 813 216 8240', 'rkemish35@ask.com', '9IO-CAG-IMM', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (115, 'Lefty Tabard', '+55 104 589 7927', 'ltabard36@uiuc.edu', 'J8A-U3S-2R0', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (116, 'Aubrey Pynner', '+509 419 627 7142', 'apynner37@cornell.edu', 'TG8-EHF-WJM', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (117, 'Batsheva Papaccio', '+86 304 820 1667', 'bpapaccio38@ustream.tv', '6WE-CGA-QFM', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (118, 'Kalina Cufley', '+86 922 176 8468', 'kcufley39@altervista.org', 'PQY-N4U-SJN', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (119, 'Homerus Paulino', '+48 414 770 1757', 'hpaulino3a@is.gd', 'QS6-PD3-Q6R', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (120, 'Caril Waylen', '+86 792 697 6135', 'cwaylen3b@intel.com', 'MO9-PB1-GYY', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (121, 'Abigail Crosse', '+502 940 403 1255', 'acrosse3c@latimes.com', 'X2N-A8J-OYS', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (122, 'Karilynn Izakoff', '+359 373 560 0341', 'kizakoff3d@toplist.cz', 'Z2Q-BTZ-WA9', 61);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (123, 'Rik Ertel', '+46 795 482 8261', 'rertel3e@imageshack.us', 'O2I-QV1-V1J', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (124, 'Gabbey Malenoir', '+48 908 785 1664', 'gmalenoir3f@chronoengine.com', 'LI8-HTG-WI3', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (125, 'Vern McMeeking', '+63 579 758 8157', 'vmcmeeking3g@is.gd', 'IWZ-776-6CE', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (126, 'Marlie Faivre', '+385 790 935 6902', 'mfaivre3h@columbia.edu', 'LSD-E3K-HW7', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (127, 'Koral Cousin', '+355 256 826 4579', 'kcousin3i@jalbum.net', 'JHW-CLV-PWF', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (128, 'Corinna Destouche', '+7 132 359 8936', 'cdestouche3j@businesswire.com', 'U3X-5OG-15K', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (129, 'Gretna Vasnetsov', '+45 552 865 4896', 'gvasnetsov3k@instagram.com', '7UZ-HDC-3TD', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (130, 'Isac Detoile', '+351 432 469 7585', 'idetoile3l@blogger.com', '8BK-VAU-90J', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (131, 'Taylor Willoway', '+48 987 165 6279', 'twilloway3m@constantcontact.com', 'ZJ4-W1C-AE1', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (132, 'Ogden Southan', '+48 220 639 2675', 'osouthan3n@weibo.com', 'CZL-2JU-40I', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (133, 'Wake Ferreri', '+62 305 961 2441', 'wferreri3o@slideshare.net', '14M-60M-Y6U', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (134, 'Karrie Traise', '+55 274 986 0585', 'ktraise3p@opensource.org', '3I3-0C0-J5V', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (135, 'Lonnie Hazeldene', '+57 168 395 0815', 'lhazeldene3q@archive.org', 'EF5-0DF-7EH', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (136, 'Marlin Ruzicka', '+351 951 194 3316', 'mruzicka3r@shinystat.com', 'F22-T02-VHJ', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (137, 'Lynnell Stebbins', '+62 227 106 9803', 'lstebbins3s@gnu.org', 'FCJ-DFR-7WI', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (138, 'Nicolai Smy', '+82 591 436 1226', 'nsmy3t@miibeian.gov.cn', '81W-5ND-PW6', 61);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (139, 'Martino Littlekit', '+593 990 475 8140', 'mlittlekit3u@icq.com', 'Q7W-0X8-P54', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (140, 'Biron Willavoys', '+55 474 397 4171', 'bwillavoys3v@arizona.edu', 'B8W-9JH-XQL', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (141, 'Parke Wyne', '+62 363 166 5440', 'pwyne3w@independent.co.uk', 'GN2-VFT-6UN', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (142, 'Barrie Fidian', '+86 795 105 3584', 'bfidian3x@netlog.com', '94P-VQQ-X6Z', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (143, 'Gibby Anwell', '+7 828 641 9052', 'ganwell3y@wp.com', '8HZ-ES6-R4U', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (144, 'Reinaldos Hubberstey', '+62 568 596 2978', 'rhubberstey3z@uol.com.br', 'OPB-VU4-2PI', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (145, 'Skippie McLanachan', '+48 978 517 5207', 'smclanachan40@goo.gl', 'OR2-39W-DY3', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (146, 'Gian Selbie', '+86 801 259 9666', 'gselbie41@hao123.com', 'CFM-2GK-577', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (147, 'Clarine Dominka', '+351 113 172 2258', 'cdominka42@harvard.edu', 'IYR-XLG-A10', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (148, 'Stewart Dibson', '+351 987 118 7232', 'sdibson43@imageshack.us', 'EGS-FEN-PTP', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (149, 'Pail Wedon', '+226 481 973 5302', 'pwedon44@businessinsider.com', 'X9C-G2F-005', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (150, 'Garrick Rainton', '+355 950 686 4613', 'grainton45@sciencedaily.com', '2F5-7PZ-1PR', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (151, 'Shirley Rizzotto', '+62 117 333 7359', 'srizzotto46@squarespace.com', '5MO-HHW-QJO', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (152, 'Raffaello Steynor', '+251 409 562 4846', 'rsteynor47@usatoday.com', 'VVF-2EU-9O5', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (153, 'Martina Hurlestone', '+62 637 166 6180', 'mhurlestone48@simplemachines.org', 'ZM4-LL2-DJ2', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (154, 'Kassia Watkinson', '+86 147 931 5155', 'kwatkinson49@businessweek.com', 'SE1-PDX-O13', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (155, 'Annabal Beazer', '+7 173 669 4665', 'abeazer4a@jugem.jp', 'ZLA-563-O1Y', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (156, 'Larine Brawn', '+46 777 448 9634', 'lbrawn4b@microsoft.com', 'ZUH-3KN-2EG', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (157, 'Dyana Bortol', '+62 195 544 5975', 'dbortol4c@illinois.edu', '122-1UQ-ZC6', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (158, 'Vidovik Peckham', '+86 521 611 1845', 'vpeckham4d@house.gov', '4D2-T8C-0CJ', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (159, 'Banky Norwood', '+86 166 357 9490', 'bnorwood4e@goodreads.com', 'YSE-TT3-7FD', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (160, 'Dredi Wooland', '+55 988 494 1687', 'dwooland4f@livejournal.com', 'AV9-P0R-MP1', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (161, 'Cherise Brangan', '+33 355 484 7164', 'cbrangan4g@businesswire.com', '2OB-SIT-92J', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (162, 'Darryl Tothacot', '+66 410 805 4534', 'dtothacot4h@people.com.cn', 'NYV-GNH-JH1', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (163, 'Irvin De Vile', '+63 229 561 0238', 'ide4i@e-recht24.de', 'YLE-EMR-8O6', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (164, 'Brigid Belton', '+505 234 502 7390', 'bbelton4j@canalblog.com', 'O5O-R5Q-HAG', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (165, 'Marilyn Driver', '+86 373 736 8217', 'mdriver4k@aboutads.info', 'LDZ-VPC-MF1', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (166, 'Grata Hames', '+45 157 520 5239', 'ghames4l@joomla.org', 'Q5D-T1S-9EW', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (167, 'Valera Gowdie', '+81 447 189 2904', 'vgowdie4m@cbc.ca', '403-U8C-5Q2', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (168, 'Brock Ceeley', '+505 533 902 5531', 'bceeley4n@columbia.edu', 'J4E-C1T-G40', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (169, 'Mahmoud MacKenzie', '+48 277 165 7037', 'mmackenzie4o@dell.com', '0F5-LP6-S2H', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (170, 'Colly Kibbel', '+256 339 780 2120', 'ckibbel4p@ehow.com', 'O9W-J15-Y9F', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (171, 'Ahmad Dominique', '+880 451 530 2458', 'adominique4q@trellian.com', 'Q02-N55-574', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (172, 'Kara-lynn Farmar', '+94 132 910 5231', 'kfarmar4r@addthis.com', '026-HXQ-UX1', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (173, 'Erie Shervil', '+351 426 976 6919', 'eshervil4s@mediafire.com', 'P0V-LEE-F22', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (174, 'Nanni Dickie', '+62 446 449 6224', 'ndickie4t@wufoo.com', 'WHB-37W-QII', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (175, 'Reeva Vasilyevski', '+55 826 974 9887', 'rvasilyevski4u@networkadvertising.org', '4FO-GDZ-7IU', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (176, 'Kamillah Dongall', '+90 496 208 5500', 'kdongall4v@baidu.com', 'AN3-ELQ-VK9', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (177, 'Tyne Hardcastle', '+86 124 568 1195', 'thardcastle4w@columbia.edu', 'TTC-QWS-EGK', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (178, 'Chauncey Atkirk', '+7 311 894 6439', 'catkirk4x@hostgator.com', 'GEF-NUD-JWE', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (179, 'Zebulen Angier', '+66 868 865 4534', 'zangier4y@meetup.com', 'JK3-5BG-OCF', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (180, 'Freddie Dering', '+63 718 599 7811', 'fdering4z@tripadvisor.com', 'J51-EPN-VI1', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (181, 'Leighton Brastead', '+63 158 102 6757', 'lbrastead50@mit.edu', '34R-MY3-BY4', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (182, 'Earvin Fenelow', '+58 284 492 0917', 'efenelow51@fema.gov', '7X6-OAD-Z68', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (183, 'Berty Dmitrienko', '+420 573 363 5985', 'bdmitrienko52@hao123.com', '26S-AM8-RFS', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (184, 'Gottfried Peers', '+7 546 346 4012', 'gpeers53@examiner.com', '9QS-YZ5-W4R', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (185, 'Angie Duffyn', '+86 957 679 7781', 'aduffyn54@mtv.com', 'JET-458-Z5Q', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (186, 'Loise Prestney', '+33 350 631 0920', 'lprestney55@sun.com', 'QFM-HXW-XTI', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (187, 'Temple Lodden', '+63 214 368 5765', 'tlodden56@diigo.com', 'ORN-IZR-0B4', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (188, 'Jeremiah Wilmington', '+55 191 538 0002', 'jwilmington57@w3.org', 'X5A-59M-Y3S', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (189, 'Alejandra Heskey', '+256 119 784 9982', 'aheskey58@paginegialle.it', 'QOR-Z1Q-AS1', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (190, 'Janella Gatchel', '+48 848 476 2739', 'jgatchel59@who.int', 'X04-BS9-GX1', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (191, 'Portia Kemp', '+351 328 959 0551', 'pkemp5a@guardian.co.uk', 'RGK-KW7-VPI', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (192, 'Kaleena Basset', '+48 704 399 7347', 'kbasset5b@google.com', 'UYD-FED-PWN', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (193, 'Devlen Hanes', '+86 524 391 1319', 'dhanes5c@webs.com', 'Y58-LP6-WOT', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (194, 'Addia McKeeman', '+86 756 130 1329', 'amckeeman5d@sogou.com', 'OIG-UW1-AKZ', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (195, 'Aluino Sacks', '+1 309 830 2210', 'asacks5e@ft.com', '5VV-RTT-OC6', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (196, 'Cleo Shieber', '+968 755 433 0619', 'cshieber5f@simplemachines.org', 'GDR-FBO-U2L', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (197, 'Anders Heake', '+86 352 497 2457', 'aheake5g@newyorker.com', 'H3H-L9B-LOA', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (198, 'Ethelred Coupman', '+63 519 259 5716', 'ecoupman5h@symantec.com', 'IS4-ELD-ELM', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (199, 'Hartley Arger', '+7 456 395 9446', 'harger5i@cbsnews.com', 'CV7-GQK-C24', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (200, 'Nataniel Hatherley', '+255 268 340 9124', 'nhatherley5j@tripadvisor.com', 'I9K-DAX-NHF', 4);
commit;
prompt 200 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (201, 'Rutger Kellie', '+380 811 835 0628', 'rkellie5k@google.co.uk', '6SK-2ED-V4O', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (202, 'Bartel Rodenburg', '+46 699 345 9343', 'brodenburg5l@opera.com', 'KQ3-V9Z-VCV', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (203, 'Shem Shadwick', '+86 829 485 6625', 'sshadwick5m@furl.net', 'GNJ-OYB-LJR', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (204, 'Josh Meade', '+63 152 610 4691', 'jmeade5n@google.ru', '0U9-A5J-IZS', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (205, 'Keven Roseman', '+86 202 402 1474', 'kroseman5o@bluehost.com', 'TQD-KMU-FSO', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (206, 'Aura Dinjes', '+63 965 657 1695', 'adinjes5p@bbc.co.uk', '13F-MID-00L', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (207, 'Tammy Ludee', '+62 233 697 0694', 'tludee5q@bloomberg.com', '56G-331-BP8', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (208, 'Heda Mallinson', '+81 786 788 0333', 'hmallinson5r@blogs.com', 'UHG-APP-K3Q', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (209, 'Jorrie Heinschke', '+53 763 362 3038', 'jheinschke5s@mapy.cz', '58C-VST-J4F', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (210, 'Emmanuel Tyers', '+98 926 531 2424', 'etyers5t@mlb.com', '47E-06U-W7J', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (211, 'Agathe Valiant', '+358 384 537 3909', 'avaliant5u@mail.ru', 'EPK-ES8-NVG', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (212, 'Sander Craise', '+86 386 605 1969', 'scraise5v@bloglines.com', 'LW6-CIA-2Y1', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (213, 'Vanda Roughley', '+244 591 566 5521', 'vroughley5w@state.gov', 'L5C-RWU-2YB', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (214, 'Theadora Izard', '+998 751 535 0104', 'tizard5x@loc.gov', 'ENA-UTG-XU4', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (215, 'Gearard Oppy', '+63 184 259 8512', 'goppy5y@jimdo.com', 'MYK-VLV-FSP', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (216, 'Dorey Carruthers', '+33 855 588 3484', 'dcarruthers5z@earthlink.net', 'GGG-J75-KAL', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (217, 'Rea Dowdle', '+55 925 915 2909', 'rdowdle60@wikispaces.com', '7Z4-IR9-ALT', 12);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (218, 'Em Lisle', '+86 698 587 7920', 'elisle61@networksolutions.com', '6WO-7CL-WEV', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (219, 'Sharl Grosvener', '+86 128 742 1587', 'sgrosvener62@usa.gov', '6GH-A85-OFN', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (220, 'Frederik Rosel', '+86 938 986 0913', 'frosel63@google.it', '3A7-25Y-F1Q', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (221, 'Myrta Weymouth', '+86 326 459 9426', 'mweymouth64@wikia.com', 'S3K-5MV-IMN', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (222, 'Kattie Dolohunty', '+44 781 888 9956', 'kdolohunty65@imgur.com', 'WDB-SE1-KB0', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (223, 'Iona Spurdle', '+48 593 396 7500', 'ispurdle66@sciencedaily.com', '9U1-5HY-G8Y', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (224, 'Derek Grimditch', '+86 410 132 4709', 'dgrimditch67@nasa.gov', '8IL-HIT-NKF', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (225, 'Katharyn Oxteby', '+63 383 854 8909', 'koxteby68@live.com', 'JTO-GM0-0SE', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (226, 'Alejandrina Reilinger', '+977 684 756 8878', 'areilinger69@jigsy.com', 'DDL-0Z3-Y77', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (227, 'Vergil MacMeanma', '+86 968 466 1794', 'vmacmeanma6a@businesswire.com', 'FAY-ZA8-GZL', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (228, 'Victoir Douberday', '+994 832 542 5810', 'vdouberday6b@salon.com', '2WR-9XH-7CG', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (229, 'Aldrich St. Clair', '+86 953 159 2045', 'ast6c@list-manage.com', '1VN-XLE-V3Y', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (230, 'Heda Accomb', '+880 265 160 1698', 'haccomb6d@shop-pro.jp', 'GEA-OP4-0GQ', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (231, 'Shalna Sibborn', '+81 753 471 5239', 'ssibborn6e@photobucket.com', '232-KUN-X1T', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (232, 'Dyann Dobey', '+86 441 961 1276', 'ddobey6f@senate.gov', 'NJA-VDF-GC4', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (233, 'Dalton Downer', '+63 387 863 5208', 'ddowner6g@nsw.gov.au', '6K6-6X4-YEG', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (234, 'Ingaborg Glass', '+33 606 378 8146', 'iglass6h@google.pl', '2EN-6G5-AW5', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (235, 'Juliann Olin', '+351 765 269 0882', 'jolin6i@wufoo.com', '6ER-6PJ-PYX', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (236, 'Denny Yerbury', '+62 184 845 4397', 'dyerbury6j@twitpic.com', 'ZG9-DHL-XZQ', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (237, 'Kandy Stark', '+53 380 749 6692', 'kstark6k@google.com.au', '6ZL-SMQ-DRZ', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (238, 'Henrik Casserly', '+86 893 297 4274', 'hcasserly6l@washingtonpost.com', 'B8V-BBP-4RF', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (239, 'Duffy Pocklington', '+86 812 276 5795', 'dpocklington6m@webs.com', 'AO4-JE9-9GD', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (240, 'Frederik Diable', '+39 161 375 5554', 'fdiable6n@jugem.jp', 'AAG-X8N-4CU', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (241, 'Dora Prestney', '+46 222 479 3396', 'dprestney6o@wikispaces.com', 'SDS-8MV-7L5', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (242, 'Seward Skotcher', '+7 885 650 9100', 'sskotcher6p@cbslocal.com', '09S-FIC-NBM', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (243, 'Lorinda Allans', '+62 469 315 0574', 'lallans6q@fastcompany.com', 'U1E-R0E-QMZ', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (244, 'Faythe Haire', '+57 346 314 9509', 'fhaire6r@constantcontact.com', 'WYU-78N-EEN', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (245, 'Corissa Billam', '+62 157 341 6814', 'cbillam6s@addtoany.com', 'B26-336-BZQ', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (246, 'Yorgo Biss', '+33 251 910 1947', 'ybiss6t@spiegel.de', 'SQ9-LQP-FW0', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (247, 'Waring Tyre', '+1 812 283 5855', 'wtyre6u@hatena.ne.jp', '04B-CNW-7OA', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (248, 'Hurlee Crebott', '+86 422 552 2909', 'hcrebott6v@telegraph.co.uk', 'MB3-U3X-FNK', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (249, 'Alfie Tythacott', '+7 130 738 2381', 'atythacott6w@moonfruit.com', '8ZD-UO8-XYU', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (250, 'Harriett Czaple', '+504 191 834 3615', 'hczaple6x@mediafire.com', 'VMA-VI2-485', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (251, 'Harriott Plumley', '+62 109 486 9708', 'hplumley6y@comsenz.com', 'Y20-3EG-4V4', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (252, 'Rosy Andrews', '+33 128 297 8117', 'randrews6z@washingtonpost.com', 'Z14-I33-0RC', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (253, 'Ondrea Laval', '+62 582 396 2707', 'olaval70@who.int', '4JC-N5R-X68', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (254, 'Cheri Hillborne', '+52 664 410 0684', 'chillborne71@nih.gov', 'MVP-X6Y-QEE', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (255, 'Claudine MacSherry', '+63 933 833 1680', 'cmacsherry72@mayoclinic.com', '61Z-R3M-W0G', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (256, 'Arie Crisp', '+86 169 145 4721', 'acrisp73@miitbeian.gov.cn', '55A-4A7-A12', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (257, 'Emilie Dohms', '+86 896 329 1020', 'edohms74@pinterest.com', 'UNK-NN0-DTK', 31);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (258, 'Audie Boch', '+30 905 667 3225', 'aboch75@cbc.ca', 'N29-JZH-X6W', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (259, 'Cherilynn Curnock', '+86 269 219 0862', 'ccurnock76@wunderground.com', 'MII-HDI-HK3', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (260, 'Julian Hatrick', '+48 919 115 6629', 'jhatrick77@gmpg.org', 'RJV-8Z0-4RT', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (261, 'Kiersten Meaton', '+1 605 284 4691', 'kmeaton78@xing.com', 'CHI-33S-MOV', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (262, 'Inesita Juden', '+62 941 603 2417', 'ijuden79@reddit.com', 'TXE-M72-3QF', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (263, 'Dael Cossans', '+591 378 311 9974', 'dcossans7a@cloudflare.com', 'X3L-A20-L7E', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (264, 'Bettina Garard', '+55 520 761 2362', 'bgarard7b@yelp.com', 'YER-IFS-FWS', 11);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (265, 'Vinni Rebichon', '+976 364 340 8099', 'vrebichon7c@nih.gov', 'H5K-C1N-MI2', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (266, 'Carmina Rosenbush', '+55 511 811 8412', 'crosenbush7d@chronoengine.com', 'P8H-IJ1-44O', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (267, 'Rinaldo Itzchaki', '+81 911 455 5604', 'ritzchaki7e@scribd.com', '93H-X0C-IJ1', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (268, 'Lou Siaspinski', '+55 292 500 7898', 'lsiaspinski7f@exblog.jp', 'XHV-G7W-ED8', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (269, 'Ruthanne Okill', '+7 855 765 8539', 'rokill7g@csmonitor.com', 'ZST-B1D-EP1', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (270, 'Paton Betteney', '+54 893 700 7277', 'pbetteney7h@noaa.gov', 'THB-0AT-5CO', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (271, 'Jodi Muckeen', '+92 755 919 6312', 'jmuckeen7i@noaa.gov', 'TM3-1SR-LFB', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (272, 'Adrianne Skouling', '+86 955 840 4276', 'askouling7j@utexas.edu', 'UII-RLD-OIS', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (273, 'Clive Stockdale', '+86 875 383 9703', 'cstockdale7k@dion.ne.jp', 'PQR-C7E-UMX', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (274, 'Harris Benneyworth', '+351 301 923 7731', 'hbenneyworth7l@fema.gov', 'IW4-ERA-1MR', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (275, 'Vitoria Budnk', '+48 958 123 2069', 'vbudnk7m@google.nl', '9NQ-D8T-0A5', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (276, 'Fawne MacSkeaghan', '+62 549 701 0106', 'fmacskeaghan7n@cornell.edu', '84K-NGW-JAK', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (277, 'Bram Forgan', '+62 254 401 6759', 'bforgan7o@hexun.com', 'XVE-QI5-WHE', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (278, 'Flore Matthensen', '+358 323 254 9055', 'fmatthensen7p@kickstarter.com', 'Y02-ZI8-RKD', 11);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (279, 'Winnie Gethin', '+381 226 529 9667', 'wgethin7q@yandex.ru', 'UUB-2FW-W5W', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (280, 'Holly Ceschelli', '+33 321 436 4520', 'hceschelli7r@elpais.com', 'N7N-S5P-7JL', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (281, 'Jessamine Skellon', '+234 982 605 1724', 'jskellon7s@ihg.com', 'NOK-7L5-VGL', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (282, 'Abner Leyshon', '+351 729 563 6821', 'aleyshon7t@yandex.ru', 'E4Y-4S4-K6Q', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (283, 'Cybil Dudenie', '+1 322 873 7707', 'cdudenie7u@timesonline.co.uk', 'I70-Q34-CZ7', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (284, 'Rice Vince', '+62 376 871 6593', 'rvince7v@bigcartel.com', 'XNN-8VK-OYX', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (285, 'Monti Verrillo', '+86 635 565 4779', 'mverrillo7w@storify.com', 'JIP-X1U-9HI', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (286, 'Barde Bangle', '+62 433 665 2187', 'bbangle7x@apache.org', '5GJ-LNX-UD2', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (287, 'Tomasine Paddison', '+86 962 928 0694', 'tpaddison7y@shop-pro.jp', '75Z-VTV-BOB', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (288, 'Nicolle Orrah', '+62 560 146 8334', 'norrah7z@tinypic.com', 'IDW-29G-3EX', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (289, 'Dareen Finlan', '+95 357 701 4937', 'dfinlan80@gov.uk', 'EVC-UXL-VGU', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (290, 'Jeff Harp', '+257 129 794 6574', 'jharp81@so-net.ne.jp', 'BDF-GC6-5UQ', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (291, 'Tera Featherbie', '+86 613 919 3214', 'tfeatherbie82@tinypic.com', '3KS-RSI-9H9', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (292, 'Herbie Palk', '+1 214 617 6866', 'hpalk83@a8.net', 'MSS-6AJ-3N0', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (293, 'Danny Pennigar', '+228 775 274 7805', 'dpennigar84@amazon.de', '132-Z1L-PYW', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (294, 'Dillon Toulmin', '+380 103 993 9942', 'dtoulmin85@omniture.com', '3NN-X1Q-0GD', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (295, 'Tades Dymond', '+62 976 226 9083', 'tdymond86@storify.com', 'JN5-1B0-DSY', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (296, 'Helaina Extance', '+62 239 866 7255', 'hextance87@issuu.com', 'G6C-JZE-95D', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (297, 'Saidee Hesser', '+84 781 386 4042', 'shesser88@ocn.ne.jp', 'BLE-8V5-QEV', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (298, 'Lulita Muscott', '+51 737 453 3729', 'lmuscott89@hhs.gov', '2JG-7ME-USN', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (299, 'Issi Comazzo', '+86 124 423 0262', 'icomazzo8a@issuu.com', 'EXU-B8N-B8E', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (300, 'Hillie Sinderland', '+57 607 537 5252', 'hsinderland8b@arstechnica.com', 'A6U-D8P-QJ6', 25);
commit;
prompt 300 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (301, 'Laverna Janks', '+46 663 706 5626', 'ljanks8c@creativecommons.org', 'E5O-0F0-SZB', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (302, 'Merissa McRory', '+7 311 791 0065', 'mmcrory8d@wikia.com', '8PW-0JP-L3B', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (303, 'Idalia Paton', '+84 180 896 6402', 'ipaton8e@netscape.com', 'YCI-L1F-WBT', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (304, 'Fredelia ODonnell', '+54 908 618 8194', 'fodonnell8f@cornell.edu', 'VPB-S8Q-HLY', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (305, 'Florance De Normanville', '+86 388 321 8370', 'fde8g@google.pl', '66C-GPB-XSW', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (306, 'Demetrius Weson', '+54 694 534 7371', 'dweson8h@bluehost.com', 'K1W-CVL-AAR', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (307, 'Howard Novill', '+63 806 228 2456', 'hnovill8i@prlog.org', '5KT-4PR-6AU', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (308, 'Nels Wallage', '+62 936 696 5631', 'nwallage8j@comcast.net', '23F-2U8-MK9', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (309, 'Gilbertina Priel', '+62 315 451 4748', 'gpriel8k@huffingtonpost.com', 'HGV-Q7Q-DFZ', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (310, 'Libby Jaffra', '+86 383 893 1001', 'ljaffra8l@webmd.com', '4AA-VMJ-90J', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (311, 'Gareth Arnao', '+55 327 501 9166', 'garnao8m@archive.org', 'XD2-W49-W32', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (312, 'Cherri Triggle', '+63 177 422 7132', 'ctriggle8n@sfgate.com', '8B8-1EP-6TE', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (313, 'Lynette Gorhardt', '+46 504 394 3725', 'lgorhardt8o@odnoklassniki.ru', 'EGA-XVG-MPE', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (314, 'Vivienne Blaydon', '+46 986 844 4950', 'vblaydon8p@europa.eu', '5FS-CVV-7H8', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (315, 'Issiah Leeves', '+46 697 633 8028', 'ileeves8q@networksolutions.com', 'WYU-TY5-2SU', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (316, 'Lewiss Climpson', '+1 248 801 3918', 'lclimpson8r@harvard.edu', 'VC6-MYR-YL5', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (317, 'Lanny Antoniou', '+55 730 805 0644', 'lantoniou8s@dmoz.org', 'DRE-7BB-928', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (318, 'Ambros Bache', '+86 611 198 8228', 'abache8t@rakuten.co.jp', 'ETS-NRH-634', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (319, 'Antoni Rumble', '+86 857 438 0740', 'arumble8u@tamu.edu', 'Q0S-D7D-OZH', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (320, 'Dominik Galbreth', '+86 762 934 1984', 'dgalbreth8v@eventbrite.com', 'AIA-0IJ-A7A', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (321, 'Christan Gierck', '+251 171 688 2274', 'cgierck8w@usnews.com', 'I1Y-D3C-E6B', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (322, 'Arnold Johnikin', '+62 198 194 6486', 'ajohnikin8x@phoca.cz', '5N0-S4A-IXZ', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (323, 'Tim Walrond', '+62 309 727 8435', 'twalrond8y@blog.com', '8KF-Z6M-FMU', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (324, 'Crystal Defont', '+86 645 840 2771', 'cdefont8z@samsung.com', 'YW9-E5M-B7M', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (325, 'Pauly Bracegirdle', '+995 523 395 4979', 'pbracegirdle90@theguardian.com', 'UM8-ALE-QRP', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (326, 'Sissy Perryn', '+33 857 932 6163', 'sperryn91@hubpages.com', 'FUK-VH6-PIZ', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (327, 'Griffith Mariner', '+7 940 572 5915', 'gmariner92@imdb.com', 'RIR-3GF-E1F', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (328, 'Nina Heggman', '+62 976 764 4753', 'nheggman93@usatoday.com', 'VHD-RQE-BE5', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (329, 'Dory Gravy', '+86 691 666 2960', 'dgravy94@networksolutions.com', '3ZD-PP5-SQQ', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (330, 'Temp Ollerhead', '+86 679 701 5684', 'tollerhead95@blogspot.com', 'YLT-NUY-N73', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (331, 'Bryn Linforth', '+351 827 208 5307', 'blinforth96@yellowpages.com', 'TQD-YO6-11Y', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (332, 'Weylin Sirett', '+86 215 865 4861', 'wsirett97@aol.com', 'SLD-PTQ-AF2', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (333, 'Jenilee Blamey', '+86 801 887 1476', 'jblamey98@blogtalkradio.com', 'P1U-04G-J86', 61);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (334, 'Merilyn Gravatt', '+53 628 791 4458', 'mgravatt99@homestead.com', 'X1N-GFM-7RN', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (335, 'Godfry Venmore', '+86 161 151 8061', 'gvenmore9a@uiuc.edu', '640-9NJ-Z10', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (336, 'Norrie Buckmaster', '+55 482 121 6177', 'nbuckmaster9b@dell.com', 'SN3-4U9-GCN', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (337, 'Annemarie Hoggin', '+62 158 385 4214', 'ahoggin9c@people.com.cn', '2DR-1IB-LSF', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (338, 'Alidia De Bell', '+86 375 458 8433', 'ade9d@netvibes.com', 'AJU-C72-NBK', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (339, 'Jessie Tabb', '+359 190 158 6645', 'jtabb9e@ox.ac.uk', '0HC-2VO-A0B', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (340, 'Kamila Prestwich', '+62 645 586 3232', 'kprestwich9f@jiathis.com', 'DTL-D78-JTH', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (341, 'Keelby Rosten', '+86 116 832 2977', 'krosten9g@ca.gov', 'I3G-QJ0-17T', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (342, 'Antin Esby', '+84 237 923 9817', 'aesby9h@narod.ru', 'O9Q-2YP-NAI', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (343, 'Anatole Whitehorne', '+351 131 757 8166', 'awhitehorne9i@umn.edu', 'OXT-A2K-SNB', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (344, 'Blinnie Sewley', '+51 741 252 2186', 'bsewley9j@live.com', 'OET-4FN-1WK', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (345, 'Florry Borsi', '+86 215 326 9739', 'fborsi9k@accuweather.com', 'ULB-ZU3-5XK', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (346, 'Taddeo Ringsell', '+86 675 124 7035', 'tringsell9l@gravatar.com', '1RE-WBB-YDD', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (347, 'Cleopatra Tebbutt', '+48 849 514 7102', 'ctebbutt9m@hhs.gov', 'T8K-KRN-8WK', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (348, 'Aloin Griffey', '+351 586 808 7317', 'agriffey9n@1und1.de', '9NA-HW8-UHZ', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (349, 'Glen Latek', '+86 422 648 7434', 'glatek9o@mtv.com', 'C5I-4V0-PRD', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (350, 'Willem McKiddin', '+27 286 729 7586', 'wmckiddin9p@multiply.com', 'U0E-WKP-3DZ', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (351, 'Avram Hazart', '+234 551 726 7889', 'ahazart9q@state.gov', 'E29-SIY-MIQ', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (352, 'Davin Asals', '+86 733 746 0188', 'dasals9r@java.com', 'ERO-ES3-WVC', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (353, 'Fernandina Togwell', '+86 482 653 8836', 'ftogwell9s@va.gov', '1OZ-G6I-G6T', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (354, 'Margarethe Tremmil', '+63 109 850 5711', 'mtremmil9t@nba.com', 'NJM-P62-J8J', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (355, 'Whitman Verey', '+351 530 841 7277', 'wverey9u@cargocollective.com', 'UU8-IDH-YAT', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (356, 'Marris Goor', '+381 688 874 1746', 'mgoor9v@meetup.com', '3NQ-IU4-462', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (357, 'Chaddie Grelak', '+86 267 646 4806', 'cgrelak9w@symantec.com', 'CYH-51C-A69', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (358, 'Annnora Niblett', '+86 656 159 2041', 'aniblett9x@hatena.ne.jp', 'G5K-LQ7-IVL', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (359, 'Jamison Pluthero', '+57 732 502 7644', 'jpluthero9y@miitbeian.gov.cn', 'T67-SSA-JF0', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (360, 'Alvis Lammie', '+81 646 711 3663', 'alammie9z@rambler.ru', 'N2R-PUS-QQO', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (361, 'Gaby Martynka', '+81 947 866 4072', 'gmartynkaa0@simplemachines.org', 'Q9E-77A-9PL', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (362, 'Clemente Aartsen', '+387 954 151 8684', 'caartsena1@example.com', 'EZS-4RM-CZM', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (363, 'Theadora Kubica', '+351 256 566 7345', 'tkubicaa2@businessinsider.com', '3YN-VTN-XXA', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (364, 'Elihu Schroter', '+55 735 741 9886', 'eschrotera3@gravatar.com', 'BHU-9O0-AAB', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (365, 'Zsa zsa Houltham', '+62 542 535 1263', 'zzsaa4@usnews.com', 'JXX-TJT-X6P', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (366, 'Anna Blacksell', '+1 336 643 5282', 'ablacksella5@liveinternet.ru', 'BFQ-354-96U', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (367, 'Rhonda Spottswood', '+48 781 489 2942', 'rspottswooda6@hibu.com', 'D5A-7KZ-L8Y', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (368, 'Heddie Boast', '+60 181 204 0390', 'hboasta7@barnesandnoble.com', 'FWL-OCL-M8X', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (369, 'Morganica Kreber', '+63 514 652 1676', 'mkrebera8@ustream.tv', '56O-WAM-AFU', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (370, 'Jasmine Phippen', '+380 247 128 3313', 'jphippena9@gov.uk', '4LN-WPP-CQE', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (371, 'Ambur De Anesy', '+7 466 942 7904', 'adeaa@npr.org', 'OOS-GXB-Y0A', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (372, 'Albertina Phin', '+380 463 285 5602', 'aphinab@networksolutions.com', 'MVT-OBJ-8M3', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (373, 'Edin Foxworthy', '+46 703 219 8330', 'efoxworthyac@deviantart.com', 'L9X-9AD-ZQ0', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (374, 'Neysa Pasfield', '+52 717 856 3939', 'npasfieldad@sogou.com', '9QQ-Q6X-D28', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (375, 'Kelcy Rawdall', '+381 584 247 7717', 'krawdallae@noaa.gov', 'TJF-YSW-EPD', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (376, 'Ned Reiach', '+86 263 549 3972', 'nreiachaf@simplemachines.org', 'SV0-TZB-M2D', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (377, 'Tessy Philippon', '+54 300 595 0010', 'tphilipponag@wikipedia.org', 'H1R-6LY-IUD', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (378, 'Marybeth von Nassau', '+86 521 581 0565', 'mvonah@360.cn', 'LM2-ONI-DUA', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (379, 'Steffie Giblin', '+972 732 754 5826', 'sgiblinai@mozilla.org', 'VRS-RLE-WUQ', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (380, 'Kimble Stovell', '+86 749 415 2360', 'kstovellaj@guardian.co.uk', 'KY6-BB7-6P7', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (381, 'Mikel Aldins', '+355 791 245 6862', 'maldinsak@ox.ac.uk', 'FBY-PUT-P1B', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (382, 'Ronda Itzig', '+33 993 462 6603', 'ritzigal@yelp.com', 'LVH-7YB-YRE', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (383, 'Nathanil Jeffers', '+48 198 160 3750', 'njeffersam@nasa.gov', 'OKA-CN6-XLG', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (384, 'Marianna Filby', '+62 603 174 2702', 'mfilbyan@google.es', 'SVG-DJG-57R', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (385, 'Velma Whitsey', '+48 286 177 9250', 'vwhitseyao@google.de', '72M-TIY-EY6', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (386, 'Marilee Bamell', '+86 665 844 4756', 'mbamellap@cdc.gov', 'MCL-7DB-TUK', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (387, 'Ferd Arboine', '+380 726 461 1534', 'farboineaq@plala.or.jp', '4BK-4DR-IIC', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (388, 'Jillie De Beauchamp', '+855 929 400 4514', 'jdear@odnoklassniki.ru', 'MYJ-M1W-WIH', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (389, 'Elena Studdert', '+86 842 733 8199', 'estuddertas@google.com', '6PW-V77-XNA', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (390, 'Hilde Kupisz', '+52 577 765 3408', 'hkupiszat@cnbc.com', 'ITC-5HF-X0U', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (391, 'Dilly Davidwitz', '+7 913 210 7134', 'ddavidwitzau@bizjournals.com', '3D6-AHH-MLK', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (392, 'Aurora Waliszek', '+48 765 673 6975', 'awaliszekav@tmall.com', '9JZ-3OX-FDW', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (393, 'Patti Murley', '+86 400 639 2560', 'pmurleyaw@privacy.gov.au', 'ZI4-1RD-S3N', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (394, 'Jard Mutter', '+82 761 250 4398', 'jmutterax@dedecms.com', '527-RTM-BQ2', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (395, 'Lucretia Durrad', '+86 635 894 0579', 'ldurraday@w3.org', 'EKO-38L-X1F', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (396, 'Francoise De Beauchemp', '+351 574 263 4208', 'fdeaz@boston.com', 'AON-FC4-EJE', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (397, 'Antonella Parkins', '+880 905 298 5236', 'aparkinsb0@princeton.edu', 'JKG-8LI-NUL', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (398, 'Kayle Wenn', '+7 888 269 4526', 'kwennb1@sourceforge.net', 'V74-PFN-X6T', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (399, 'Morty Hebbs', '+385 416 990 0675', 'mhebbsb2@aboutads.info', '6BQ-4YV-PA6', 31);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (400, 'Gwenneth Croneen', '+64 482 943 0522', 'gcroneenb3@fc2.com', 'BO5-ZZQ-RW5', 44);
commit;
prompt 400 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (401, 'Wash Laidlow', '+86 456 618 6268', 'wlaidlowb4@unc.edu', 'B2B-PQY-ZX4', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (402, 'Korie Top', '+84 290 752 2358', 'ktopb5@imdb.com', '6M1-G8C-KFU', 61);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (403, 'Silvio Hambrook', '+51 243 615 8583', 'shambrookb6@usgs.gov', 'KPT-W7J-OH5', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (404, 'Kenna Benedicto', '+7 537 836 8586', 'kbenedictob7@edublogs.org', 'UXE-TCX-B5Y', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (405, 'Cherri Mapam', '+86 699 616 0628', 'cmapamb8@yolasite.com', 'RFM-1QC-X4E', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (406, 'Bastian Davy', '+63 857 814 0088', 'bdavyb9@cocolog-nifty.com', 'ZT2-2W9-9XJ', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (407, 'Gamaliel Twiddell', '+1 718 198 2824', 'gtwiddellba@chronoengine.com', 'PSW-599-2KS', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (408, 'Basilio Baldin', '+86 766 753 2312', 'bbaldinbb@slideshare.net', 'VM1-LO9-UP8', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (409, 'Cecilius Meaddowcroft', '+54 847 921 4053', 'cmeaddowcroftbc@privacy.gov.au', 'H0Z-QRF-0YZ', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (410, 'Margarita Fahey', '+33 209 364 2258', 'mfaheybd@army.mil', '488-PNB-2EK', 31);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (411, 'Lorelei Sarfass', '+33 479 696 1273', 'lsarfassbe@alexa.com', 'EG7-DEQ-G48', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (412, 'Rheta Tutill', '+855 474 723 7971', 'rtutillbf@wisc.edu', 'F20-JTW-332', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (413, 'Clevey Genny', '+1 717 340 7279', 'cgennybg@pagesperso-orange.fr', 'L9L-7CI-0E7', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (414, 'Lebbie OCurrigan', '+355 485 263 0809', 'locurriganbh@cpanel.net', 'H41-QJA-75Q', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (415, 'Marilee Kirlin', '+63 649 771 4548', 'mkirlinbi@samsung.com', '8K5-FIK-0BR', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (416, 'Adelbert Purse', '+62 150 156 0554', 'apursebj@miibeian.gov.cn', 'SF8-XFG-DG2', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (417, 'Natalya Towl', '+880 190 857 5654', 'ntowlbk@last.fm', '695-XPX-W46', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (418, 'Gelya Di Carli', '+594 157 254 7599', 'gdibl@desdev.cn', '3PG-W40-8CE', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (419, 'Lethia Molder', '+53 617 814 2161', 'lmolderbm@reverbnation.com', '7LC-Z5B-SUC', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (420, 'Ephrem Carey', '+55 355 621 0576', 'ecareybn@eepurl.com', 'WG1-EXB-WHG', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (421, 'Bancroft Torrisi', '+45 346 404 2598', 'btorrisibo@t-online.de', 'UOB-FBI-XJG', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (422, 'Sibel Evason', '+1 871 645 3388', 'sevasonbp@usnews.com', 'F2X-YD5-TTD', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (423, 'Carolina De Cleyne', '+1 916 913 5321', 'cdebq@businessweek.com', '1PM-P32-5Z4', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (424, 'Nicolle McGahey', '+7 266 646 6861', 'nmcgaheybr@yahoo.com', 'PZB-PBB-YL5', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (425, 'Britt Calcutt', '+86 295 602 0456', 'bcalcuttbs@qq.com', 'RUE-SL5-WM2', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (426, 'Mercy Lodo', '+7 370 793 0861', 'mlodobt@digg.com', '9WN-3Z4-63D', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (427, 'Adena Toothill', '+850 659 884 6969', 'atoothillbu@microsoft.com', '5FE-0PU-ZWB', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (428, 'Fredrick Jouhning', '+62 688 805 3655', 'fjouhningbv@google.fr', '4IN-5VV-DMY', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (429, 'Felicdad Howsin', '+62 475 626 4620', 'fhowsinbw@gov.uk', '8E4-8T5-KYV', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (430, 'Ardyce McPaik', '+381 953 892 8391', 'amcpaikbx@twitpic.com', 'YM3-NJ7-MEL', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (431, 'Ivy Selwood', '+62 129 163 4235', 'iselwoodby@parallels.com', 'X9G-4BS-BTK', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (432, 'Phineas Athy', '+86 263 753 7379', 'pathybz@google.ca', '0KO-1ZW-XWN', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (433, 'Tallulah Rutgers', '+62 595 729 7391', 'trutgersc0@nsw.gov.au', 'JZU-ACT-NP8', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (434, 'Colin Thew', '+7 762 221 7120', 'cthewc1@youtu.be', 'T4O-B5Q-136', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (435, 'Maurizia Wafer', '+55 243 924 7682', 'mwaferc2@youtube.com', '48N-EXK-5JH', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (436, 'Trix Le Count', '+66 727 609 5088', 'tlec3@symantec.com', 'S1N-0YA-N6W', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (437, 'Kimberlee Heinicke', '+54 859 375 9193', 'kheinickec4@mtv.com', '7HE-DU1-NK5', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (438, 'Jemmie Philot', '+225 955 977 5325', 'jphilotc5@sakura.ne.jp', '08F-KF4-G9R', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (439, 'Catlaina Verson', '+504 135 561 7184', 'cversonc6@census.gov', '9LL-KC4-7RN', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (440, 'Moses Kernoghan', '+30 383 903 7064', 'mkernoghanc7@independent.co.uk', '9AB-TRG-T7Y', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (441, 'Vivienne Ferber', '+49 490 533 6506', 'vferberc8@amazon.com', '2E5-MLU-52T', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (442, 'Towney McKeney', '+381 957 690 2668', 'tmckeneyc9@prnewswire.com', 'MEO-3C5-NCN', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (443, 'Cyril Humphrys', '+86 562 397 4399', 'chumphrysca@arstechnica.com', 'W64-0ZF-KH3', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (444, 'Andris Ryrie', '+60 570 489 9446', 'aryriecb@usgs.gov', 'KD5-RII-K5J', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (445, 'Jessie Matfin', '+33 550 620 1760', 'jmatfincc@yahoo.co.jp', '4UH-MN6-6HP', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (446, 'Stephine Birkmyre', '+86 282 114 6249', 'sbirkmyrecd@ibm.com', 'R4X-4JY-3SQ', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (447, 'Kaine Stillwell', '+63 687 628 6041', 'kstillwellce@nhs.uk', '5OE-SN1-4MF', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (448, 'Brice Shaughnessy', '+94 249 958 7424', 'bshaughnessycf@patch.com', '3DR-01C-WN7', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (449, 'Rorie Frail', '+62 887 439 9903', 'rfrailcg@zdnet.com', 'J5H-HAW-700', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (450, 'Sylas Donat', '+49 280 844 5946', 'sdonatch@sfgate.com', 'Y0D-22Z-S7Z', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (451, 'Philip Hans', '+420 400 398 6099', 'phansci@ocn.ne.jp', '89S-UFU-DGM', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (452, 'Georgetta Kienl', '+7 218 274 8732', 'gkienlcj@gmpg.org', 'ED1-ET6-1NS', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (453, 'Blanch Glavias', '+48 148 163 2582', 'bglaviasck@uiuc.edu', 'PVW-D3J-KT0', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (454, 'Gregor Linck', '+86 566 380 9568', 'glinckcl@icq.com', 'W32-XTM-A6O', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (455, 'Ardenia Howlett', '+850 467 669 1225', 'ahowlettcm@vistaprint.com', 'VIR-URH-9NY', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (456, 'Valida Elias', '+93 921 504 7674', 'veliascn@shop-pro.jp', 'SO9-PFJ-M4P', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (457, 'Agosto Smeeton', '+233 579 294 4894', 'asmeetonco@globo.com', '1J8-IRN-UZM', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (458, 'Celka ORudden', '+86 205 602 5002', 'coruddencp@va.gov', 'KL4-1SE-U51', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (459, 'Clementina Bourgourd', '+7 326 502 0908', 'cbourgourdcq@people.com.cn', 'KXA-89K-WU6', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (460, 'Asa Trevear', '+92 550 219 0092', 'atrevearcr@4shared.com', 'UCM-JK7-LA4', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (461, 'Yetty Hillhouse', '+86 931 542 8723', 'yhillhousecs@foxnews.com', '18M-TZO-ZWH', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (462, 'Bernita McNaughton', '+98 581 481 3542', 'bmcnaughtonct@npr.org', 'FYV-QYL-3QD', 12);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (463, 'Currie Dorian', '+62 590 326 5987', 'cdoriancu@rambler.ru', '41N-FS2-WZA', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (464, 'Hirsch Palombi', '+86 652 925 7138', 'hpalombicv@sbwire.com', 'SLA-B45-9B5', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (465, 'Stafford Ghiraldi', '+54 304 609 4415', 'sghiraldicw@sitemeter.com', 'DCF-S54-MJC', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (466, 'Carleton Browncey', '+62 919 668 4122', 'cbrownceycx@slashdot.org', '618-YDU-CLR', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (467, 'Bibbie Creed', '+420 663 103 1626', 'bcreedcy@blogspot.com', 'EV8-UR1-8Q8', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (468, 'Corinne Conelly', '+47 784 164 8679', 'cconellycz@hexun.com', '0KE-NOK-1U9', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (469, 'Barnabe Strelitz', '+62 889 401 7512', 'bstrelitzd0@google.es', 'JJM-CLL-8LR', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (470, 'Fredric Dowzell', '+98 737 360 2663', 'fdowzelld1@jalbum.net', '5A2-CZX-SP4', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (471, 'Margit Picopp', '+420 958 371 8683', 'mpicoppd2@dropbox.com', 'L5T-WDU-WDF', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (472, 'Arnie Shovelton', '+98 578 399 1830', 'ashoveltond3@rediff.com', 'XA0-4TJ-GLQ', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (473, 'Ginny Semaine', '+86 459 726 5403', 'gsemained4@latimes.com', 'WVJ-2Z5-BY4', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (474, 'Brewer Niaves', '+55 184 983 2582', 'bniavesd5@linkedin.com', 'EQ1-QO6-7XG', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (475, 'Reina Attwoull', '+359 440 951 8853', 'rattwoulld6@list-manage.com', 'YNV-8QU-U9U', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (476, 'Tiff Lecount', '+591 567 941 9619', 'tlecountd7@discovery.com', 'ADT-TOY-9NP', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (477, 'Gale Cribbott', '+62 581 472 6405', 'gcribbottd8@epa.gov', 'P4V-GEO-M3Z', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (478, 'Legra Hunter', '+82 621 874 4041', 'lhunterd9@youtu.be', 'JHS-X93-6T7', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (479, 'Minna Christmas', '+46 865 618 7879', 'mchristmasda@constantcontact.com', '87L-ZZY-TSF', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (480, 'Beth Johnsey', '+63 653 118 5400', 'bjohnseydb@examiner.com', 'QNV-FOP-5PU', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (481, 'Cassius Ladell', '+976 875 895 5963', 'cladelldc@illinois.edu', 'T55-DC5-SXN', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (482, 'Car Baumford', '+30 609 523 1548', 'cbaumforddd@hostgator.com', '9S2-4F9-DCW', 31);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (483, 'Madelin McCurtin', '+964 178 160 5471', 'mmccurtinde@businessinsider.com', 'JKA-QO1-P8U', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (484, 'Elisabet Peregrine', '+62 674 932 9714', 'eperegrinedf@cmu.edu', 'ZS4-6YV-EZQ', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (485, 'Tabby Van Rembrandt', '+7 120 399 5238', 'tvandg@google.com.au', 'SB6-0BM-IEZ', 67);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (486, 'Clementia Stansbie', '+380 648 866 6445', 'cstansbiedh@infoseek.co.jp', 'Y1A-M16-84B', 61);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (487, 'Constancy Ceyssen', '+86 912 779 1444', 'cceyssendi@independent.co.uk', 'J3L-EG4-OTL', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (488, 'Delinda Taig', '+62 452 554 8263', 'dtaigdj@w3.org', 'TLR-SG4-YAB', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (489, 'Danyelle Jaouen', '+86 537 698 0459', 'djaouendk@studiopress.com', 'YOZ-3DO-TCR', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (490, 'Prissie Ewbanck', '+62 464 898 0637', 'pewbanckdl@netvibes.com', 'M3L-O2O-R6Q', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (491, 'Ignazio Pear', '+86 454 697 9529', 'ipeardm@w3.org', 'TH3-76X-NJ7', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (492, 'Ailis Maytum', '+230 358 957 6801', 'amaytumdn@reference.com', '8EE-F8Y-M3U', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (493, 'Immanuel Eburne', '+86 188 963 5859', 'ieburnedo@yellowpages.com', 'K7X-RY0-NJ6', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (494, 'Pip Stodhart', '+7 644 981 6463', 'pstodhartdp@chronoengine.com', 'F4Q-05T-ZVC', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (495, 'Linda Dennert', '+385 453 799 9237', 'ldennertdq@chicagotribune.com', 'P3S-5BK-DJH', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (496, 'Araldo Pickles', '+86 889 930 7605', 'apicklesdr@bing.com', '5ZB-K2N-JRP', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (497, 'Lucy McIlwreath', '+963 412 938 1213', 'lmcilwreathds@pinterest.com', 'Q58-ST4-YFH', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (498, 'Stella Bolt', '+93 618 743 3097', 'sboltdt@domainmarket.com', 'LWE-A57-U76', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (499, 'Ashia Maybery', '+52 691 656 8559', 'amayberydu@blog.com', 'O9U-739-ODZ', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (500, 'Marc Petrillo', '+504 607 110 5457', 'mpetrillodv@bluehost.com', 'WAR-TYV-G56', 14);
commit;
prompt 500 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (501, 'Trent Nares', '+55 694 864 8517', 'tnaresdw@oaic.gov.au', 'AVZ-GXD-69N', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (502, 'Rubie Mayworth', '+86 800 223 1151', 'rmayworthdx@patch.com', 'Z9X-ANI-LA0', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (503, 'Wit Eyckelberg', '+86 530 630 6935', 'weyckelbergdy@craigslist.org', 'H1U-FQX-YB1', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (504, 'Lissa Rotte', '+86 435 546 8486', 'lrottedz@accuweather.com', 'QOR-L42-2ZF', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (505, 'Joela Kaser', '+245 236 659 6034', 'jkasere0@bloomberg.com', 'HPF-GHR-SSN', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (506, 'Ralf Lampitt', '+970 900 107 7167', 'rlampitte1@storify.com', 'C0Q-CXK-QIJ', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (507, 'Farah Volk', '+62 432 467 7592', 'fvolke2@elpais.com', 'RRQ-XU8-9RX', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (508, 'Lek Luxton', '+84 616 863 6169', 'lluxtone3@163.com', '8C6-U8N-6CE', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (509, 'Fanni Klink', '+502 325 717 0426', 'fklinke4@google.com.hk', 'XRX-SSY-XE3', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (510, 'Ernesto Antao', '+225 542 416 0622', 'eantaoe5@taobao.com', 'HZD-7KA-HYE', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (511, 'Gregg Regardsoe', '+63 164 157 3243', 'gregardsoee6@slashdot.org', 'I1G-MZG-92I', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (512, 'Walden Haywood', '+62 405 258 7860', 'whaywoode7@blogs.com', 'JL4-UVU-IS7', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (513, 'Bertine Jeromson', '+46 645 978 0842', 'bjeromsone8@si.edu', 'YFB-DNF-8IL', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (514, 'Spencer Gawthorp', '+52 167 323 6751', 'sgawthorpe9@github.io', 'HMO-3ZH-D3V', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (515, 'Daryl Branchflower', '+63 352 373 0377', 'dbranchflowerea@house.gov', 'QSE-HGH-D6J', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (516, 'Audrey Matthisson', '+86 351 459 4028', 'amatthissoneb@biblegateway.com', 'BLY-TJ2-OCR', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (517, 'Lurleen Birtle', '+62 693 292 7480', 'lbirtleec@yahoo.com', 'XP8-ZS7-6RH', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (518, 'Steffie Rosewarne', '+86 842 122 1141', 'srosewarneed@unblog.fr', 'OWQ-2B0-XOZ', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (519, 'Clifford Leathe', '+86 986 249 2830', 'cleatheee@moonfruit.com', 'ED0-GLW-HPF', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (520, 'Melisenda Brauner', '+86 981 190 2586', 'mbrauneref@drupal.org', 'PSO-3XW-ULY', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (521, 'Bradly Arnet', '+55 548 410 8927', 'barneteg@squidoo.com', '9CP-SSJ-QQT', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (522, 'Herschel Willmore', '+62 631 749 9175', 'hwillmoreeh@simplemachines.org', '50L-SXA-I7F', 20);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (523, 'Evonne Filippi', '+252 578 999 6772', 'efilippiei@census.gov', 'ZJR-J60-43K', 20);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (524, 'Phaidra Ogan', '+7 174 828 5166', 'poganej@bizjournals.com', 'TRT-EA1-R4E', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (525, 'Sosanna Curtayne', '+86 108 612 1765', 'scurtayneek@1und1.de', '4FY-8EI-R5G', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (526, 'Fanchon Stiff', '+86 909 768 2288', 'fstiffel@pagesperso-orange.fr', '887-KCV-UCG', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (527, 'Kelila Stefi', '+57 684 434 1592', 'kstefiem@engadget.com', 'RG3-T4E-XF5', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (528, 'Brigida Iwanicki', '+57 300 372 0027', 'biwanickien@naver.com', '0YI-471-V7I', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (529, 'Gifford Bertenshaw', '+593 448 402 7740', 'gbertenshaweo@springer.com', 'D8I-5DE-YJN', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (530, 'Susanne Stainbridge', '+51 416 921 4451', 'sstainbridgeep@bravesites.com', '8J5-DG8-06O', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (531, 'Kris Thebe', '+7 834 363 0703', 'kthebeeq@baidu.com', 'KCT-6CO-NXE', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (532, 'Anjela Gilhoolie', '+216 202 823 7411', 'agilhoolieer@elpais.com', '0BC-H8Y-1AQ', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (533, 'Dale Westcar', '+351 893 546 7655', 'dwestcares@indiegogo.com', 'OLK-NR3-N1H', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (534, 'Robinson Etock', '+86 136 193 3195', 'retocket@tamu.edu', 'FTU-Z85-1R7', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (535, 'Jessi Stanwix', '+352 921 434 6766', 'jstanwixeu@bloglines.com', 'BH9-3AL-XPK', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (536, 'Janice McRuvie', '+504 936 267 9365', 'jmcruvieev@china.com.cn', 'R50-V32-T4J', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (537, 'Aguistin Borkett', '+46 938 441 9230', 'aborkettew@newsvine.com', 'DPR-O70-9HI', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (538, 'Diane-marie Dent', '+86 519 960 7881', 'ddentex@ameblo.jp', 'A7J-LAV-V9S', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (539, 'Arch Yakutin', '+62 115 542 5279', 'ayakutiney@clickbank.net', 'HWG-HCX-XXA', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (540, 'Ravid Weekland', '+63 400 816 0172', 'rweeklandez@twitter.com', 'AFO-9EF-0BH', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (541, 'Dominique Dart', '+251 392 953 7695', 'ddartf0@abc.net.au', 'H0X-8WN-Z3W', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (542, 'Etti Greensmith', '+218 300 518 6348', 'egreensmithf1@netscape.com', 'KYO-Y5H-K7A', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (543, 'Meier Ondra', '+46 627 392 2080', 'mondraf2@sourceforge.net', 'R0N-A84-C3X', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (544, 'Lorain Lidgely', '+62 702 186 1049', 'llidgelyf3@chron.com', 'FON-Z22-10Q', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (545, 'Melly Alexandersen', '+86 624 121 2174', 'malexandersenf4@blogs.com', 'SLK-WSM-6AR', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (546, 'Doyle Meachem', '+98 818 929 0259', 'dmeachemf5@hhs.gov', 'WNC-93B-HQG', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (547, 'Dianne Ascrofte', '+33 819 897 1613', 'dascroftef6@uiuc.edu', 'CCM-2CZ-QMY', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (548, 'Madison Wandless', '+7 156 802 8914', 'mwandlessf7@ycombinator.com', 'Z1N-L2Z-RQ3', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (549, 'West Munkley', '+33 363 405 9765', 'wmunkleyf8@netscape.com', 'E92-Z8X-XYV', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (550, 'Shelagh Bartelet', '+55 786 330 2624', 'sbarteletf9@dell.com', 'NOB-KEW-Y5L', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (551, 'Collete Tarrant', '+7 182 660 4173', 'ctarrantfa@topsy.com', '1T1-FZ7-2JX', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (552, 'Reeba Merrydew', '+1 414 279 0501', 'rmerrydewfb@csmonitor.com', '8PG-ATH-E66', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (553, 'Korella Al Hirsi', '+57 634 472 9697', 'kalfc@examiner.com', 'JWG-6QI-CFB', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (554, 'Paule Beverley', '+234 653 874 7571', 'pbeverleyfd@myspace.com', '15Z-0UK-UKL', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (555, 'John Garnam', '+48 302 504 0800', 'jgarnamfe@netscape.com', 'XKL-01M-YON', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (556, 'Michael Ingrey', '+86 958 943 1933', 'mingreyff@g.co', 'AS2-21G-OV4', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (557, 'Arabele Belfitt', '+46 143 930 9548', 'abelfittfg@feedburner.com', 'Q2M-8N7-OW5', 11);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (558, 'Cirilo Bail', '+994 741 849 8024', 'cbailfh@example.com', 'GRW-PY7-6KC', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (559, 'Ada Klainer', '+47 988 732 4839', 'aklainerfi@noaa.gov', 'MFU-5HQ-O3F', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (560, 'Dion Ridewood', '+61 612 837 1677', 'dridewoodfj@google.pl', 'QK7-M7M-QJ5', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (561, 'Morganica Finnemore', '+62 222 268 9835', 'mfinnemorefk@theguardian.com', 'M2W-EHS-YP3', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (562, 'Claire Bleazard', '+358 941 810 2642', 'cbleazardfl@wix.com', 'LPB-5PF-P1C', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (563, 'Josi Dunsleve', '+86 776 144 7959', 'jdunslevefm@accuweather.com', '15K-BQ5-4EZ', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (564, 'Clyde Chastang', '+86 319 509 8617', 'cchastangfn@oakley.com', 'C7M-205-85L', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (565, 'Noell Clappison', '+48 137 934 5686', 'nclappisonfo@seattletimes.com', 'H3B-JNK-6GE', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (566, 'Elsy Davydoch', '+55 683 339 9250', 'edavydochfp@businessinsider.com', 'QLA-4VY-KLY', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (567, 'Waverley Taffurelli', '+55 901 351 3567', 'wtaffurellifq@wufoo.com', '03H-KG6-63X', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (568, 'Thedrick Currm', '+7 923 796 3359', 'tcurrmfr@howstuffworks.com', 'GNW-2TJ-D24', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (569, 'Rollins Blindermann', '+66 912 349 4290', 'rblindermannfs@cnet.com', 'OJ2-VNE-UNK', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (570, 'Shelby Crinage', '+86 972 290 5340', 'scrinageft@globo.com', 'Y8C-WTN-R27', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (571, 'Dolly Heistermann', '+351 982 954 5242', 'dheistermannfu@netlog.com', 'YQS-YCS-EE6', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (572, 'Marti Emblow', '+234 518 179 1564', 'memblowfv@slashdot.org', 'MG0-NZY-3JB', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (573, 'Chlo Brookson', '+86 776 883 5860', 'cbrooksonfw@answers.com', 'GL9-KIQ-YDN', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (574, 'Almire Gorling', '+86 108 579 9411', 'agorlingfx@businessweek.com', 'T5R-KE6-0TV', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (575, 'Meggy Foley', '+7 918 251 5287', 'mfoleyfy@sphinn.com', 'MKS-LJ8-Y3U', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (576, 'Lindsey Daniau', '+505 521 792 9663', 'ldaniaufz@mapquest.com', '7UJ-EB9-3HD', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (577, 'Thaddus Fittes', '+63 814 435 7664', 'tfittesg0@craigslist.org', '85D-BRN-IGH', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (578, 'Basilio Thewlis', '+62 278 463 5554', 'bthewlisg1@salon.com', 'XLJ-GNS-FKF', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (579, 'Piotr McKeevers', '+381 627 249 6038', 'pmckeeversg2@cloudflare.com', 'J9W-YF6-6VQ', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (580, 'Madge Willetts', '+880 214 584 3772', 'mwillettsg3@ucsd.edu', '2EU-BYQ-Q72', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (581, 'Thom Robers', '+351 693 627 5674', 'trobersg4@noaa.gov', 'V1U-E07-4NI', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (582, 'Helen Tappor', '+7 884 180 7040', 'htapporg5@aol.com', 'ZFM-AIL-AQN', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (583, 'Seth Thomasset', '+7 715 861 4867', 'sthomassetg6@ycombinator.com', 'LKE-X1T-4EM', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (584, 'Robinet Dunlap', '+33 658 173 1085', 'rdunlapg7@sohu.com', 'H5B-3DZ-UBQ', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (585, 'Betteann McClinton', '+48 503 293 4610', 'bmcclintong8@360.cn', 'NZY-SO4-9SN', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (586, 'Fae Curro', '+234 167 991 8869', 'fcurrog9@bloomberg.com', 'YO9-1FO-KPM', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (587, 'Sansone Murphy', '+389 557 574 1265', 'smurphyga@berkeley.edu', 'KUP-XG4-HVB', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (588, 'Tessy Byne', '+86 494 694 1605', 'tbynegb@ucsd.edu', 'YSA-NKO-SGX', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (589, 'Kayley Yegorovnin', '+54 879 711 8244', 'kyegorovningc@yandex.ru', 'YP4-9HG-H5B', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (590, 'Honor Rudyard', '+86 214 858 5848', 'hrudyardgd@angelfire.com', 'G59-424-5YR', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (591, 'Jarrid Lissaman', '+420 721 406 6061', 'jlissamange@youtu.be', 'RFW-FGX-LPM', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (592, 'Brenn Marusic', '+86 366 840 2292', 'bmarusicgf@ustream.tv', 'A44-29W-SWR', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (593, 'Elinor Whawell', '+48 296 891 3766', 'ewhawellgg@ihg.com', 'GJ1-LVO-ZVL', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (594, 'Wynn Grollmann', '+86 697 992 6286', 'wgrollmanngh@blogger.com', '9LM-4IY-8NA', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (595, 'Mickie Poulney', '+62 525 888 5399', 'mpoulneygi@army.mil', 'W9N-GF1-CKX', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (596, 'Garv Jumeau', '+33 675 872 8503', 'gjumeaugj@icq.com', '7IU-6HZ-44V', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (597, 'Violet Di Giorgio', '+63 920 957 2411', 'vdigk@fc2.com', 'FI5-416-3SJ', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (598, 'Bertine Ryle', '+970 917 505 5345', 'brylegl@php.net', 'L1S-V3N-548', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (599, 'Buddy Lyall', '+237 122 471 5445', 'blyallgm@blogspot.com', 'HCS-ECE-14A', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (600, 'Nanette Spolton', '+86 594 108 9509', 'nspoltongn@seesaa.net', 'ZMU-5RS-7RD', 33);
commit;
prompt 600 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (601, 'Daveta Kneal', '+86 369 648 0719', 'dknealgo@cnbc.com', 'T4W-TBK-6BO', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (602, 'Jack Henrie', '+62 469 937 0790', 'jhenriegp@eventbrite.com', 'R0E-8ER-FOS', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (603, 'Zebedee Heinsen', '+223 726 307 0696', 'zheinsengq@indiegogo.com', '3JM-YTQ-F0O', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (604, 'Gris Aizlewood', '+81 579 808 4958', 'gaizlewoodgr@constantcontact.com', 'PPT-G4X-1ZR', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (605, 'Ailina Brouard', '+258 868 225 1297', 'abrouardgs@jigsy.com', 'XNC-LZS-ICN', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (606, 'Torre Hull', '+62 731 291 8952', 'thullgt@hp.com', 'HL3-IDI-BRS', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (607, 'Aidan Mohring', '+1 356 417 9430', 'amohringgu@abc.net.au', 'DN9-Z2T-1N4', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (608, 'Reynolds Mustoe', '+62 239 845 8327', 'rmustoegv@who.int', 'W9R-JFX-E99', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (609, 'Elysia Nellen', '+86 665 189 4619', 'enellengw@chron.com', 'TPF-F1J-M2G', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (610, 'Cynthie Llopis', '+86 759 969 5152', 'cllopisgx@bloglovin.com', 'MFU-EQK-C1W', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (611, 'Donnie Rosini', '+380 512 293 7973', 'drosinigy@blogtalkradio.com', 'CGN-1VG-RQE', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (612, 'Bentlee Bineham', '+62 891 510 4457', 'bbinehamgz@patch.com', 'LRD-4R4-A5K', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (613, 'Lindsay Mc Caughen', '+504 549 490 4146', 'lmch0@parallels.com', '3KF-2U0-82H', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (614, 'Jessee Schuelcke', '+86 733 942 6066', 'jschuelckeh1@answers.com', 'SHV-4NQ-DGJ', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (615, 'Vinnie Petrus', '+34 766 959 0247', 'vpetrush2@columbia.edu', 'DAZ-ZCN-Q6W', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (616, 'Ginni Callendar', '+62 539 427 4417', 'gcallendarh3@spotify.com', 'ZJS-RH9-Z0M', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (617, 'Linn Dunckley', '+48 983 829 5574', 'ldunckleyh4@cbslocal.com', '2CK-3AP-47V', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (618, 'Adolph Astlett', '+966 543 696 3939', 'aastletth5@nba.com', 'EZ4-7I5-EF8', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (619, 'Beilul Knoble', '+62 643 847 1691', 'bknobleh6@joomla.org', '9F0-OZT-4XE', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (620, 'Dalt Drever', '+86 855 765 4081', 'ddreverh7@cargocollective.com', 'C00-SKK-PHT', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (621, 'Giacinta Lowde', '+598 241 911 0173', 'glowdeh8@friendfeed.com', 'RX2-KGT-7CV', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (622, 'My Threadgill', '+51 538 923 7622', 'mthreadgillh9@stumbleupon.com', 'GEH-6R9-BOO', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (623, 'Jedidiah Barkaway', '+223 786 377 7639', 'jbarkawayha@disqus.com', 'IJ3-1QJ-B0G', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (624, 'Petronella Fisbburne', '+420 805 412 4593', 'pfisbburnehb@fastcompany.com', '6YP-868-HY0', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (625, 'Florenza Vigietti', '+86 328 306 1759', 'fvigiettihc@edublogs.org', 'EM4-KGM-6V6', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (626, 'Jordain Slade', '+86 115 565 1565', 'jsladehd@nps.gov', '003-D5A-FGA', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (627, 'Paula Twinborne', '+86 773 180 6339', 'ptwinbornehe@edublogs.org', 'MK4-EGK-K5W', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (628, 'Jody Kitchingman', '+58 210 831 7606', 'jkitchingmanhf@posterous.com', 'YUW-XPL-5UI', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (629, 'Hanson Lyptrade', '+86 592 455 7604', 'hlyptradehg@springer.com', 'M8C-E6D-SKW', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (630, 'Walt McNair', '+351 194 634 6571', 'wmcnairhh@wikipedia.org', '8R2-9D3-8ZX', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (631, 'Malissia Eshmade', '+251 895 685 7802', 'meshmadehi@samsung.com', 'GNY-2SI-57G', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (632, 'Sybilla DEnrico', '+86 353 179 3650', 'sdenricohj@phoca.cz', 'JJ5-VGW-TPV', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (633, 'Leona Schinetti', '+30 571 514 0170', 'lschinettihk@sbwire.com', '8KK-H10-FPN', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (634, 'Corbin Hoovart', '+7 713 873 6043', 'choovarthl@netscape.com', 'HI2-XM0-YW0', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (635, 'Aurilia Haulkham', '+82 716 984 6759', 'ahaulkhamhm@wikimedia.org', '3FA-MW2-OA7', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (636, 'Ingaborg Blemen', '+86 947 169 4876', 'iblemenhn@google.it', 'QBZ-ICO-IKH', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (637, 'Wendel Walhedd', '+1 648 225 8229', 'wwalheddho@nationalgeographic.com', '8I2-67S-5A0', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (638, 'Sebastiano Stiff', '+81 773 481 0275', 'sstiffhp@plala.or.jp', 'H6R-9O4-6R3', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (639, 'Urban Roads', '+374 135 618 0352', 'uroadshq@arizona.edu', '339-RMC-YLF', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (640, 'Dev Currey', '+1 183 613 7374', 'dcurreyhr@intel.com', '90U-E4I-E2I', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (641, 'Pandora Veale', '+33 620 349 1618', 'pvealehs@deliciousdays.com', 'CHH-UCM-8P3', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (642, 'Francyne O Bee', '+420 516 387 6608', 'foht@skype.com', 'NFO-HT7-8TI', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (643, 'Lise Lunk', '+7 366 492 7795', 'llunkhu@washingtonpost.com', '1LK-3VH-P5Q', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (644, 'Ysabel Cuddehay', '+374 741 797 3738', 'ycuddehayhv@cisco.com', '18Y-3AY-P4X', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (645, 'Lionel Chard', '+420 834 743 2101', 'lchardhw@fotki.com', '1SK-P47-QTC', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (646, 'Rudy Tewnion', '+54 531 251 2782', 'rtewnionhx@cpanel.net', 'F7E-6R1-MFC', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (647, 'Lynn Demageard', '+62 696 533 0581', 'ldemageardhy@comcast.net', 'J3M-R6N-BUB', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (648, 'Amaleta Rickett', '+1 318 745 9817', 'aricketthz@bing.com', '6MV-4OX-2GD', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (649, 'Lorenzo Howorth', '+86 551 362 2178', 'lhoworthi0@joomla.org', 'KS4-2V1-DH8', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (650, 'Regine Gruczka', '+86 321 345 6704', 'rgruczkai1@scientificamerican.com', '8IB-CXN-NR2', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (651, 'Rachelle Feldon', '+81 691 215 5664', 'rfeldoni2@ucoz.com', 'Q0Y-WG2-E54', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (652, 'Melosa Elmhirst', '+52 947 128 4893', 'melmhirsti3@xrea.com', 'VMG-GYF-WOG', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (653, 'Dal Castillon', '+63 480 749 3038', 'dcastilloni4@gizmodo.com', '11U-31H-2RU', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (654, 'Renard Wilce', '+46 798 326 9153', 'rwilcei5@icq.com', 'TOP-L8A-AO7', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (655, 'Patton Jacomb', '+52 697 880 1510', 'pjacombi6@issuu.com', '8SM-YQE-7C6', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (656, 'Florette Licas', '+351 300 788 4931', 'flicasi7@guardian.co.uk', '5Y3-NMS-0D0', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (657, 'Dina Kemston', '+86 404 186 9397', 'dkemstoni8@addtoany.com', 'VC1-OZK-Z2W', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (658, 'Claus Bownas', '+86 631 323 7841', 'cbownasi9@biblegateway.com', '4ZX-QWN-5ZE', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (659, 'Christie Whines', '+57 819 756 2772', 'cwhinesia@foxnews.com', 'GSO-8OF-VGL', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (660, 'Joey Syer', '+1 665 660 4847', 'jsyerib@unblog.fr', '6JF-TM9-4DM', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (661, 'Ingeberg Cockshot', '+1 162 455 2878', 'icockshotic@clickbank.net', 'GFA-RJ5-X9X', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (662, 'Aguie Tiffany', '+52 807 206 2126', 'atiffanyid@a8.net', 'KO2-WIU-B2G', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (663, 'Drona Wyett', '+1 542 428 4253', 'dwyettie@creativecommons.org', 'P4W-3GZ-GF9', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (664, 'Lethia Mallock', '+86 660 845 8280', 'lmallockif@blogtalkradio.com', 'L2P-S6X-N6Y', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (665, 'Durant Danby', '+48 141 807 5826', 'ddanbyig@census.gov', '345-O12-BMT', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (666, 'Reid Loveless', '+420 372 525 8008', 'rlovelessih@over-blog.com', 'N03-W10-PNI', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (667, 'Karlens Goford', '+86 927 877 0962', 'kgofordii@archive.org', 'U6T-M5M-P3R', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (668, 'Shaylah Heinsius', '+86 694 187 1243', 'sheinsiusij@bluehost.com', 'HVK-VN3-VQN', 53);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (669, 'Lutero Cackett', '+507 590 676 6882', 'lcackettik@booking.com', 'USP-D3S-LC9', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (670, 'Patsy Scamaden', '+86 922 721 9993', 'pscamadenil@geocities.com', '9VU-06R-70A', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (671, 'Jarrett Buchan', '+51 623 751 8668', 'jbuchanim@flickr.com', 'KIV-L8D-B5N', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (672, 'Smith Jurczak', '+374 179 432 2879', 'sjurczakin@tuttocitta.it', '404-PEH-84B', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (673, 'Tirrell Really', '+7 203 260 2931', 'treallyio@hhs.gov', '94O-5G8-VN8', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (674, 'Jeniffer Pingston', '+351 537 872 8054', 'jpingstonip@rambler.ru', 'WIJ-3LG-GZ6', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (675, 'Cindelyn Moulden', '+86 372 861 6431', 'cmouldeniq@businessweek.com', 'NQU-H7H-7L8', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (676, 'Grissel Devil', '+62 873 330 6961', 'gdevilir@weibo.com', 'XU7-F45-YG8', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (677, 'Jacquie Cluely', '+62 736 842 7255', 'jcluelyis@si.edu', 'E66-IJ7-XCV', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (678, 'Frankie Feilden', '+86 561 949 0486', 'ffeildenit@ucsd.edu', '62Z-TV6-I8I', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (679, 'Alfredo Capaldo', '+86 356 848 7808', 'acapaldoiu@virginia.edu', 'EW5-THS-24X', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (680, 'Valentina Manchester', '+86 387 374 1100', 'vmanchesteriv@comcast.net', '1GV-OCU-YUW', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (681, 'Gordon Connechie', '+62 171 974 6209', 'gconnechieiw@miitbeian.gov.cn', 'GVC-431-GJI', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (682, 'Bunni Rewcastle', '+86 969 556 4660', 'brewcastleix@flavors.me', 'OEE-4PG-W6S', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (683, 'Arlene Ramelet', '+53 249 725 4717', 'arameletiy@ihg.com', '4GB-KW9-CVE', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (684, 'Merill Rens', '+86 575 793 8596', 'mrensiz@is.gd', 'LRE-07X-RDV', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (685, 'Aldis Alphege', '+7 775 670 9373', 'aalphegej0@adobe.com', 'XGU-KAR-DGU', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (686, 'Dyann Fleis', '+381 775 163 3761', 'dfleisj1@jugem.jp', 'IMI-UUI-AL1', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (687, 'Adara Larby', '+1 256 119 2507', 'alarbyj2@simplemachines.org', 'KWP-GBW-HKW', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (688, 'Estrella Baulk', '+62 762 990 9114', 'ebaulkj3@house.gov', 'DIK-ZRZ-WHI', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (689, 'Pattin Sivills', '+380 157 819 8285', 'psivillsj4@chron.com', 'GV7-117-A1H', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (690, 'Benyamin Humbie', '+7 686 561 9625', 'bhumbiej5@purevolume.com', 'A1Y-RVR-45J', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (691, 'Sheffield Mouser', '+420 821 821 6404', 'smouserj6@businesswire.com', 'HCO-IMA-OT1', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (692, 'Padriac Hansen', '+1 679 528 6074', 'phansenj7@sphinn.com', 'NZ4-4X7-WMS', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (693, 'Agata Cockshott', '+52 359 848 1972', 'acockshottj8@bluehost.com', 'ZZ6-6YG-QLW', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (694, 'Clerkclaude Janway', '+55 495 450 5562', 'cjanwayj9@nytimes.com', 'F2H-Q7Q-8N2', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (695, 'Anna-diane Lowten', '+33 617 548 9871', 'alowtenja@indiatimes.com', 'YGJ-TJO-YXC', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (696, 'Marion Elintune', '+237 852 911 6687', 'melintunejb@mit.edu', 'R3G-06K-0FZ', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (697, 'Terencio Dran', '+7 572 367 7773', 'tdranjc@chronoengine.com', 'EUE-M1T-7KU', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (698, 'Yolane Stirgess', '+63 145 489 8819', 'ystirgessjd@yandex.ru', '1FJ-1T0-Q2R', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (699, 'Lethia Agent', '+86 784 454 1101', 'lagentje@delicious.com', 'HUN-FET-DEX', 5);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (700, 'Lorie Gotobed', '+48 407 910 5718', 'lgotobedjf@comcast.net', 'UPT-30Z-VS5', 19);
commit;
prompt 700 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (701, 'Waylon Delacour', '+36 818 454 5325', 'wdelacourjg@nps.gov', '7DK-MR2-QE6', 11);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (702, 'Virginia Albarez', '+86 662 157 1953', 'valbarezjh@skype.com', '0D0-3C8-YUU', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (703, 'Gare Seelbach', '+7 829 637 4984', 'gseelbachji@sitemeter.com', 'WLA-O1W-938', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (704, 'Junia Topham', '+58 133 886 7964', 'jtophamjj@un.org', 'NF5-6UQ-QYK', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (705, 'Doria Lexa', '+242 118 741 5521', 'dlexajk@networksolutions.com', 'WMI-8PU-IRH', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (706, 'Gerry Sutter', '+504 631 553 7889', 'gsutterjl@nbcnews.com', '7YC-PZQ-7DV', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (707, 'Maribel Chateau', '+57 237 757 7912', 'mchateaujm@dailymotion.com', '8TU-MUT-ZPI', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (708, 'Lexy Valett', '+93 242 679 1152', 'lvalettjn@arstechnica.com', 'U0N-USZ-D64', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (709, 'Jobi Harmer', '+504 583 311 9841', 'jharmerjo@nationalgeographic.com', 'YQ7-8V2-Q6L', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (710, 'Tobie Mounsey', '+996 617 471 9572', 'tmounseyjp@upenn.edu', 'OYO-0OE-TK8', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (711, 'Cloe Gillford', '+380 100 975 1027', 'cgillfordjq@hexun.com', 'NA8-RGI-OHU', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (712, 'Harriett Ales0', '+264 312 907 5556', 'halesjr@japanpost.jp', 'YEX-NBG-1WT', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (713, 'Giorgia Bernadon', '+86 349 673 7911', 'gbernadonjs@timesonline.co.uk', '9K2-3S9-EO9', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (714, 'Sigvard Cristofolini', '+86 424 928 5666', 'scristofolinijt@drupal.org', 'H1O-2WC-CH7', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (715, 'Gwen Cross', '+389 369 147 5368', 'gcrossju@oaic.gov.au', '6XF-4IO-1PG', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (716, 'Donni Sebrook', '+52 727 822 5205', 'dsebrookjv@wired.com', 'BYH-ARX-DGH', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (717, 'Loreen Wackley', '+357 145 618 3834', 'lwackleyjw@disqus.com', 'M71-EO2-MJ4', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (718, 'Moira Veltman', '+692 663 259 1964', 'mveltmanjx@surveymonkey.com', '0DK-XQO-9CA', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (719, 'Jany Stonier', '+420 352 245 1257', 'jstonierjy@china.com.cn', 'L11-A7F-RLE', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (720, 'Fransisco Duffus', '+98 383 349 3101', 'fduffusjz@domainmarket.com', 'G2Y-9X0-2WK', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (721, 'Damon Trobe', '+86 571 242 2034', 'dtrobek0@barnesandnoble.com', 'NZ0-6ZR-QXD', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (722, 'Dean Tryme', '+86 177 915 2024', 'dtrymek1@blogger.com', '9EX-EAC-MS3', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (723, 'Savina Mudie', '+62 762 814 7702', 'smudiek2@usgs.gov', '9ZO-BAK-K4Y', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (724, 'Base Veysey', '+62 801 338 4439', 'bveyseyk3@umn.edu', 'PO3-1HR-3DJ', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (725, 'Roxana Rainsbury', '+351 548 487 6648', 'rrainsburyk4@ning.com', 'FIE-4V3-5D5', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (726, 'Dannel Fanshaw', '+385 522 859 7033', 'dfanshawk5@is.gd', '9OT-C7W-W73', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (727, 'Haskel Quaife', '+55 310 387 1151', 'hquaifek6@studiopress.com', 'XWO-W9K-V8C', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (728, 'Vasili Detloff', '+62 327 920 2315', 'vdetloffk7@t.co', 'RH5-6I2-M5R', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (729, 'Cherin Batchley', '+86 170 721 3263', 'cbatchleyk8@dedecms.com', 'O4K-W2R-KN8', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (730, 'Joann Alelsandrowicz', '+86 198 427 6505', 'jalelsandrowiczk9@dmoz.org', 'BQ8-GT6-MGJ', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (731, 'Wyn Slaght', '+353 130 243 0299', 'wslaghtka@bloglovin.com', '6FR-0VP-5A9', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (732, 'Jo Wickham', '+371 209 620 7331', 'jwickhamkb@npr.org', '2TD-CIR-WL1', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (733, 'Antonius Mazonowicz', '+81 666 137 1039', 'amazonowiczkc@dropbox.com', '54L-U3G-0FE', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (734, 'Roxi Mebes', '+62 511 528 9508', 'rmebeskd@ihg.com', 'FLA-IAX-BYV', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (735, 'Jaquith Rickardes', '+54 124 913 4336', 'jrickardeske@dmoz.org', 'R23-W2B-OQA', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (736, 'Emmet Davydenko', '+86 959 496 1175', 'edavydenkokf@about.me', 'AER-9Y4-GJE', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (737, 'Nate Andretti', '+374 786 452 9373', 'nandrettikg@google.com.br', 'MA5-P62-XMG', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (738, 'Hilary Isley', '+46 211 776 6641', 'hisleykh@guardian.co.uk', '87L-9CQ-E8P', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (739, 'Edita Cann', '+48 288 792 4688', 'ecannki@ow.ly', 'SG3-VLM-25R', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (740, 'Hussein Benner', '+387 770 202 6772', 'hbennerkj@seesaa.net', 'AAU-462-CLE', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (741, 'Hal Hazley', '+63 993 600 8857', 'hhazleykk@uiuc.edu', 'NW2-1OI-R9J', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (742, 'Jule Grimes', '+63 716 522 3480', 'jgrimeskl@state.gov', 'PMM-UUB-VZ2', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (743, 'George Ellesworthe', '+62 633 783 9042', 'gellesworthekm@chicagotribune.com', '0UI-XQC-1EK', 31);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (744, 'Yetty Bernette', '+61 691 225 4634', 'ybernettekn@webeden.co.uk', 'IGD-SST-MS1', 25);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (745, 'Dania Caplen', '+86 932 989 1837', 'dcaplenko@irs.gov', 'ODK-3WU-33Q', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (746, 'Katinka Elcox', '+692 512 272 1925', 'kelcoxkp@seattletimes.com', '2KX-F58-NQN', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (747, 'Madlin Buntain', '+389 793 151 4527', 'mbuntainkq@over-blog.com', 'ROR-RFP-6IH', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (748, 'Liam Merrgen', '+30 934 861 9029', 'lmerrgenkr@scientificamerican.com', '09L-TWL-RHH', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (749, 'Becky Dow', '+48 568 510 7683', 'bdowks@intel.com', '28X-RWI-X27', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (750, 'Cam Gergler', '+92 332 261 8447', 'cgerglerkt@soundcloud.com', 'IVR-7BH-59H', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (751, 'Husein Rodriguez', '+63 660 666 4341', 'hrodriguezku@usgs.gov', 'BTT-WBA-RZC', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (752, 'Debee Rouse', '+63 506 318 4256', 'drousekv@theatlantic.com', 'R1R-P8Q-QKG', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (753, 'Feliza Tenbrug', '+420 420 635 3260', 'ftenbrugkw@smh.com.au', 'PG4-JBL-QQN', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (754, 'Nancee Campanelli', '+57 730 340 0750', 'ncampanellikx@state.gov', 'YRW-XQM-58E', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (755, 'Carrie Robarts', '+7 406 761 2494', 'crobartsky@sitemeter.com', '7PD-KX5-0V9', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (756, 'Kandace Dinnis', '+86 692 167 9615', 'kdinniskz@rakuten.co.jp', 'RXB-5EU-2F9', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (757, 'Karee Gilbert', '+62 115 359 5203', 'kgilbertl0@europa.eu', '08I-VOG-0XJ', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (758, 'Elayne Baise', '+86 276 819 8200', 'ebaisel1@yellowbook.com', 'D5G-ZFR-LNH', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (759, 'Philbert Leftbridge', '+49 514 354 2282', 'pleftbridgel2@parallels.com', 'UD0-X71-153', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (760, 'Sayers Dalmon', '+225 448 725 2169', 'sdalmonl3@simplemachines.org', '8JO-BM8-7AT', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (761, 'Chip Curless', '+255 898 849 0841', 'ccurlessl4@discuz.net', 'SQJ-CM4-DSB', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (762, 'Sacha Nottingham', '+86 343 165 8134', 'snottinghaml5@aol.com', 'UH9-2D5-2YJ', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (763, 'Gunter Hindshaw', '+33 169 544 2513', 'ghindshawl6@upenn.edu', '6MB-BRB-2L1', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (764, 'Beth Henworth', '+257 182 263 7805', 'bhenworthl7@cafepress.com', 'MCP-UOH-10O', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (765, 'Thacher Cockerton', '+234 372 956 5867', 'tcockertonl8@cdc.gov', 'QHL-SOZ-U9V', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (766, 'Ernest Rubanenko', '+63 783 304 6442', 'erubanenkol9@nba.com', 'RMB-FAV-EFY', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (767, 'Gideon Bastard', '+66 956 328 1330', 'gbastardla@nationalgeographic.com', 'T60-798-RN3', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (768, 'Bjorn Ilyasov', '+62 760 169 4602', 'bilyasovlb@spotify.com', '2C5-6M1-UBR', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (769, 'Seumas Kingsnorth', '+55 915 186 2359', 'skingsnorthlc@bbc.co.uk', 'K8F-HQS-8FF', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (770, 'Lotti Lavin', '+591 295 283 9634', 'llavinld@acquirethisname.com', 'SLW-BKU-7D9', 16);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (771, 'Carol Sheldrake', '+62 685 618 4520', 'csheldrakele@princeton.edu', 'IRU-87B-75D', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (772, 'Eddie Coldrick', '+7 940 665 3875', 'ecoldricklf@skype.com', 'QRR-DF7-12F', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (773, 'Eldridge Cicconettii', '+86 296 547 9732', 'ecicconettiilg@youku.com', '8UD-OLK-27U', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (774, 'Angelita Archbald', '+86 157 842 6930', 'aarchbaldlh@dedecms.com', 'HEI-4J3-S4E', 47);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (775, 'Hieronymus Loseby', '+31 437 870 1490', 'hlosebyli@ameblo.jp', 'ZEY-JLI-J6L', 59);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (776, 'Nadia Lunny', '+27 233 899 7301', 'nlunnylj@sciencedirect.com', '9T6-SA9-00A', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (777, 'Malchy Farnfield', '+86 537 277 0150', 'mfarnfieldlk@ucla.edu', 'VBU-PUZ-OFP', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (778, 'Myron Tellenbach', '+86 131 532 7884', 'mtellenbachll@1und1.de', 'HC1-6P1-7JL', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (779, 'Shel Chappell', '+86 893 554 4634', 'schappelllm@xrea.com', '76K-OI2-XYE', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (780, 'Waldo Beneze', '+505 830 381 3614', 'wbenezeln@businesswire.com', 'CU1-5UR-UXV', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (781, 'Ines Poppleton', '+30 434 954 7945', 'ipoppletonlo@dmoz.org', 'VMY-4XA-TQT', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (782, 'Gerianne Toplis', '+48 305 524 2652', 'gtoplislp@networkadvertising.org', 'K8M-LS8-89L', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (783, 'Clementine Clampe', '+55 706 800 8947', 'cclampelq@delicious.com', 'J2T-442-D4C', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (784, 'Jessi Kamall', '+60 549 947 4155', 'jkamalllr@desdev.cn', '9ZW-L0R-4JK', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (785, 'Dehlia Valentine', '+962 504 964 2077', 'dvalentinels@delicious.com', 'CLE-IZ9-78Z', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (786, 'Mohandis Borthwick', '+46 423 519 0669', 'mborthwicklt@scientificamerican.com', 'GIM-5N9-4BA', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (787, 'Hildegarde Axe', '+84 265 184 2368', 'haxelu@comsenz.com', '0LJ-LBE-NUC', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (788, 'Cindra Paridge', '+86 931 280 9408', 'cparidgelv@mtv.com', '9PN-U17-3YY', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (789, 'Lindon Nesfield', '+63 603 312 0103', 'lnesfieldlw@imdb.com', 'TZT-4D0-RUY', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (790, 'Hedi Phizackarley', '+52 386 375 1221', 'hphizackarleylx@vinaora.com', 'PJS-O6K-W4P', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (791, 'Ruprecht Cardall', '+7 827 245 0992', 'rcardallly@answers.com', 'JWS-J57-KL5', 20);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (792, 'Adrian Hennemann', '+852 658 695 4120', 'ahennemannlz@blog.com', 'Y2S-XFL-DW5', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (793, 'Hakim Westerman', '+55 513 433 4080', 'hwestermanm0@4shared.com', 'LVV-V7O-BTO', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (794, 'Rycca Henzley', '+46 987 643 2069', 'rhenzleym1@about.me', 'ATJ-92Y-7L0', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (795, 'Florrie Fabler', '+86 148 239 9749', 'ffablerm2@51.la', 'DCU-IPM-HDV', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (796, 'Merralee Scott', '+7 505 686 1872', 'mscottm3@disqus.com', 'BQ0-KBM-SR9', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (797, 'Harriot Petschel', '+51 338 128 2881', 'hpetschelm4@geocities.jp', '5W5-AGE-F8F', 49);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (798, 'Frayda Hutchinges', '+62 360 702 3366', 'fhutchingesm5@exblog.jp', 'NC6-D6O-ZHR', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (799, 'Silvano Groom', '+81 899 450 1839', 'sgroomm6@forbes.com', 'FM3-6NM-B07', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (800, 'Gertrudis Britt', '+86 451 689 8981', 'gbrittm7@tinyurl.com', 'VNT-C27-OGT', 1);
commit;
prompt 800 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (801, 'Angel Duer', '+234 376 412 6239', 'aduerm8@oaic.gov.au', 'AJT-9SG-EYE', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (802, 'Claudell Ashleigh', '+222 226 639 3042', 'cashleighm9@jimdo.com', 'C8E-E7G-782', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (803, 'Lurette Axleby', '+62 316 976 2952', 'laxlebyma@acquirethisname.com', 'ALE-CV4-TUE', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (804, 'Andeee Fleckness', '+234 806 380 9888', 'aflecknessmb@adobe.com', '4C2-TNF-YLE', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (805, 'Harold Freezor', '+235 903 737 4515', 'hfreezormc@abc.net.au', 'SY4-8OX-UIE', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (806, 'Rori Ebrall', '+86 395 948 6961', 'rebrallmd@moonfruit.com', 'JGM-T6S-MD4', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (807, 'Barby Tomasz', '+62 134 545 7230', 'btomaszme@about.me', '0YM-IB9-GU5', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (808, 'Bev Guerola', '+355 593 836 7232', 'bguerolamf@facebook.com', 'WQI-QXX-EPT', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (809, 'Clive Caneo', '+7 654 742 2569', 'ccaneomg@google.de', 'D0R-IM8-O0G', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (810, 'Nance Earengey', '+33 932 901 4285', 'nearengeymh@washington.edu', 'J3X-87R-7X8', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (811, 'Samuel Chaudron', '+33 527 472 0117', 'schaudronmi@wikispaces.com', 'UC3-0Z2-T3C', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (812, 'Di Filyaev', '+58 893 334 2207', 'dfilyaevmj@samsung.com', 'J2Y-C5R-2PT', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (813, 'Wesley Callender', '+86 924 757 0592', 'wcallendermk@github.io', '11S-A8I-CYT', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (814, 'Whitaker De Mitris', '+86 637 993 4703', 'wdeml@prnewswire.com', 'H7W-P88-8I4', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (815, 'Fionnula Beament', '+86 597 446 0383', 'fbeamentmm@1688.com', 'AGC-JBI-2CH', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (816, 'Mikael Klamp', '+62 174 728 6099', 'mklampmn@mail.ru', 'SZ8-XWS-Y1A', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (817, 'Tildi McIlwrick', '+380 489 838 7273', 'tmcilwrickmo@barnesandnoble.com', 'TD9-55P-YZS', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (818, 'Miguel Ixer', '+7 258 334 0039', 'mixermp@altervista.org', '51U-38U-KNJ', 45);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (819, 'Syd Aireton', '+48 431 147 1041', 'sairetonmq@parallels.com', 'QCT-1CT-B0D', 29);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (820, 'Rand Habbert', '+82 157 502 5430', 'rhabbertmr@amazon.de', 'KPK-T8L-8UU', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (821, 'Randolph Iorio', '+86 717 515 9259', 'riorioms@meetup.com', '0VF-RPH-Z4Q', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (822, 'Tim Championnet', '+234 838 179 5285', 'tchampionnetmt@auda.org.au', 'U71-PEQ-I8S', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (823, 'Jany Edinburough', '+55 608 123 0990', 'jedinburoughmu@irs.gov', 'BIA-1OT-HDZ', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (824, 'Athene Pattrick', '+62 141 951 5417', 'apattrickmv@nydailynews.com', 'G99-HWY-FN9', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (825, 'Venus Hengoed', '+265 690 982 5676', 'vhengoedmw@aboutads.info', '7HM-WVT-LPW', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (826, 'Richart OLogan', '+235 337 941 6001', 'rologanmx@usgs.gov', 'L2D-S0S-OFW', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (827, 'Michaeline Antcliffe', '+62 654 474 2720', 'mantcliffemy@cocolog-nifty.com', 'QIQ-2FI-0QZ', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (828, 'Bobbee Hanmore', '+62 775 322 9295', 'bhanmoremz@creativecommons.org', 'L3K-DF5-QFZ', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (829, 'Tracy Wyburn', '+86 538 401 1911', 'twyburnn0@ucoz.ru', 'F32-2KY-5P9', 63);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (830, 'Baxy Szepe', '+1 904 445 0808', 'bszepen1@pagesperso-orange.fr', 'QIJ-400-828', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (831, 'Clarice Petrulis', '+998 515 233 5089', 'cpetrulisn2@blogspot.com', 'NF6-25P-D53', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (832, 'Celene Samwaye', '+63 873 552 7934', 'csamwayen3@msn.com', 'P8C-AX3-RDJ', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (833, 'Redd Summerson', '+86 308 784 1868', 'rsummersonn4@go.com', 'FXU-KAG-ZH4', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (834, 'Casey Roddan', '+86 627 750 8565', 'croddann5@blog.com', '45R-MY8-3EM', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (835, 'Leese Denniss', '+62 664 510 9781', 'ldennissn6@barnesandnoble.com', 'NLB-DD6-VA0', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (836, 'Zolly McKeand', '+86 732 207 6458', 'zmckeandn7@statcounter.com', '9YX-57R-HLV', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (837, 'Lucina Mayhow', '+996 378 495 9398', 'lmayhown8@bluehost.com', '6PQ-S9U-UH9', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (838, 'Windy Grigoryev', '+95 262 235 4201', 'wgrigoryevn9@youtube.com', 'J42-RNY-KH3', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (839, 'Mela Quested', '+63 368 779 9492', 'mquestedna@myspace.com', 'UEI-A8N-H1H', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (840, 'Alonso Mundell', '+352 110 433 3329', 'amundellnb@vistaprint.com', 'LQ5-ELM-7D4', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (841, 'Katee Abelevitz', '+92 906 960 1385', 'kabelevitznc@globo.com', 'SOV-0S4-7D2', 32);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (842, 'Lorine Flaune', '+86 844 695 8767', 'lflaunend@paypal.com', '3YE-1MM-F97', 31);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (843, 'Evonne Figiovanni', '+86 202 793 9655', 'efigiovannine@jugem.jp', '6E1-72W-PAZ', 43);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (844, 'Ros Tankin', '+1 935 566 0310', 'rtankinnf@marketwatch.com', '6JC-BBM-1ZT', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (845, 'Ranique Hancke', '+1 303 414 7431', 'rhanckeng@meetup.com', 'OZF-31W-K3F', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (846, 'Micah Hindenburg', '+966 334 678 8525', 'mhindenburgnh@hp.com', '1IW-4QW-SBM', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (847, 'Chiquia Fraschetti', '+351 547 326 3732', 'cfraschettini@cbslocal.com', 'HG3-C4L-52U', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (848, 'Brita Clute', '+86 146 632 3351', 'bclutenj@purevolume.com', 'HE6-JMJ-0AF', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (849, 'Franciska Slemmonds', '+62 883 955 3194', 'fslemmondsnk@mtv.com', 'H8G-HV5-W4S', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (850, 'Rutherford Burdass', '+33 156 208 3607', 'rburdassnl@ca.gov', '1KT-690-5AE', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (851, 'Rollins Steinor', '+230 417 419 6947', 'rsteinornm@gmpg.org', 'HX0-4WN-ATX', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (852, 'Margery McCrillis', '+86 508 151 0680', 'mmccrillisnn@xing.com', 'UCA-049-P23', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (853, 'Kim Gainfort', '+63 770 676 5321', 'kgainfortno@godaddy.com', '1UX-JO8-J6D', 52);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (854, 'Melly Garlant', '+33 259 286 3126', 'mgarlantnp@elpais.com', '8RN-GOG-82N', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (855, 'Inga Titterington', '+502 813 753 7835', 'ititteringtonnq@about.me', 'GYL-V8L-0L1', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (856, 'Ewan Crowthe', '+92 740 938 3497', 'ecrowthenr@blogspot.com', 'YG8-XER-VSQ', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (857, 'Athene Hawarden', '+7 431 518 1177', 'ahawardenns@ihg.com', '7XK-K1R-PUN', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (858, 'Shaylah Feares', '+358 713 274 6774', 'sfearesnt@nature.com', '8SV-ORT-6CY', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (859, 'Benjie Ping', '+30 574 569 6194', 'bpingnu@lulu.com', 'SBW-3RZ-XJD', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (860, 'Nola Le Noury', '+46 634 635 2265', 'nlenv@free.fr', 'H5G-E5Y-YWV', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (861, 'Natasha Entres', '+234 554 747 6392', 'nentresnw@google.com.au', 'VCM-ALK-JID', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (862, 'Klement Lewzey', '+62 328 974 2525', 'klewzeynx@trellian.com', 'NAR-KC5-WQ8', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (863, 'Myrtie Tytherton', '+62 414 695 8370', 'mtythertonny@fc2.com', 'IJD-EFJ-EY5', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (864, 'Ettie Callen', '+358 177 996 1232', 'ecallennz@geocities.com', 'K7X-NM8-60U', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (865, 'Trevor Trowsdall', '+234 556 703 3221', 'ttrowsdallo0@surveymonkey.com', 'FNC-HNA-IOQ', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (866, 'Stafani Sherbourne', '+81 513 218 5841', 'ssherbourneo1@howstuffworks.com', 'BR8-J6C-CLU', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (867, 'Essy Damper', '+504 865 129 5447', 'edampero2@amazon.com', 'HOX-JR8-UN0', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (868, 'Karalynn Kolczynski', '+7 435 484 8598', 'kkolczynskio3@skype.com', 'VIP-JAS-WCM', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (869, 'Krystal Andrys', '+86 144 936 5543', 'kandryso4@bandcamp.com', 'II7-0O8-ZG6', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (870, 'Neala Kraft', '+86 193 127 0642', 'nkrafto5@imageshack.us', 'EN5-VIA-AAA', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (871, 'Donella Marioneau', '+358 966 179 5086', 'dmarioneauo6@intel.com', 'BVY-CQA-O4F', 65);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (872, 'Bobby Necolds', '+86 844 455 6822', 'bnecoldso7@earthlink.net', 'KDA-WI9-ZW6', 11);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (873, 'Elinore Sarjent', '+86 956 307 8493', 'esarjento8@nsw.gov.au', 'RUS-DIW-R7N', 62);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (874, 'Martin McKenney', '+56 598 355 5784', 'mmckenneyo9@t-online.de', 'GZM-JOY-ZRS', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (875, 'Kimberley Gidden', '+62 419 345 8251', 'kgiddenoa@t-online.de', '4W8-GNP-0SY', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (876, 'Camala Volcker', '+66 262 894 8412', 'cvolckerob@gov.uk', 'HG6-GT2-2E5', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (877, 'Benoit Quesne', '+232 215 220 3348', 'bquesneoc@thetimes.co.uk', 'JHK-OXI-KIB', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (878, 'Avictor Kurdani', '+33 160 602 1563', 'akurdaniod@jimdo.com', 'ZNA-CJ8-PYR', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (879, 'Udall Tunn', '+48 486 113 9702', 'utunnoe@flavors.me', '7NK-6ER-BXM', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (880, 'Garv La Batie', '+63 408 401 0345', 'glaof@smugmug.com', 'Q5Z-6WB-Q7Y', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (881, 'Jonathan St. Quintin', '+62 754 656 7947', 'jstog@sitemeter.com', '13F-HS6-4F1', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (882, 'Killian Wimsett', '+81 319 367 8914', 'kwimsettoh@cdbaby.com', 'QBH-XEJ-VBF', 40);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (883, 'Guido Berthon', '+86 103 186 0947', 'gberthonoi@globo.com', 'YCS-J4N-Y10', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (884, 'Kitty Wensley', '+86 957 593 2396', 'kwensleyoj@skyrock.com', 'FK1-0SO-G1Q', 27);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (885, 'Annetta Weddup', '+93 305 463 1596', 'aweddupok@simplemachines.org', 'R7V-3Z8-RYK', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (886, 'Brodie Casa', '+593 665 149 0537', 'bcasaol@lulu.com', 'QT4-KXQ-LEL', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (887, 'Ronna Riping', '+62 148 923 4275', 'rripingom@rambler.ru', 'U0Y-OGL-RPY', 9);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (888, 'Benoit Andrzejczak', '+55 546 553 6239', 'bandrzejczakon@weather.com', 'LSK-IJ5-0VN', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (889, 'Abigale Thorp', '+84 923 602 1517', 'athorpoo@state.gov', 'D4M-H2S-YRH', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (890, 'Worden Leng', '+358 956 465 0694', 'wlengop@msn.com', 'P28-AU9-AEC', 12);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (891, 'Cindee Chapelhow', '+971 155 812 2232', 'cchapelhowoq@domainmarket.com', 'COL-XHB-9ZL', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (892, 'Selby Tomlett', '+998 849 589 4865', 'stomlettor@clickbank.net', 'GRA-87X-E1C', 78);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (893, 'Carlin Tirte', '+381 911 145 2090', 'ctirteos@linkedin.com', 'JPU-KX7-7HG', 2);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (894, 'Kelly Chawner', '+86 875 621 3928', 'kchawnerot@tiny.cc', 'HIP-33I-6UA', 41);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (895, 'Diego Gainor', '+48 534 148 2214', 'dgainorou@vistaprint.com', '51K-KJ8-YDY', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (896, 'Giacopo Quadrio', '+351 481 399 1378', 'gquadrioov@elegantthemes.com', '5GP-1QT-EEQ', 12);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (897, 'Andrus Rossi', '+63 875 700 6191', 'arossiow@cornell.edu', '6KW-XH9-MYR', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (898, 'Chev Lambarth', '+62 147 810 1369', 'clambarthox@spotify.com', 'ZRL-SST-1CW', 22);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (899, 'Margeaux Fleming', '+1 714 750 3576', 'mflemingoy@blinklist.com', 'HMX-3J2-U1H', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (900, 'Aldon Bownes', '+225 909 697 1192', 'abownesoz@unesco.org', 'HXK-NQ6-IKL', 74);
commit;
prompt 900 records committed...
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (901, 'Ora Boston', '+63 694 269 7132', 'obostonp0@about.com', 'GDV-G96-31E', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (902, 'Vanna Memory', '+7 270 626 8274', 'vmemoryp1@springer.com', 'X6Q-DRZ-CSU', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (903, 'Dominic Wallhead', '+33 378 245 9776', 'dwallheadp2@odnoklassniki.ru', 'HFA-RV4-JDB', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (904, 'Correna Maddox', '+51 726 551 0009', 'cmaddoxp3@jugem.jp', 'HKC-BTB-9TH', 60);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (905, 'Tamar Hann', '+7 404 865 4221', 'thannp4@craigslist.org', 'MWK-EBI-5OH', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (906, 'Bill Rumens', '+51 181 853 8730', 'brumensp5@wikipedia.org', 'ZOM-IBB-SWZ', 61);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (907, 'Janelle Kneafsey', '+66 667 465 3666', 'jkneafseyp6@time.com', '7DV-W4L-TGR', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (908, 'Lincoln O Lone', '+977 242 762 4105', 'lop7@npr.org', 'K2X-0W0-2XE', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (909, 'Dore Redwin', '+223 308 302 2571', 'dredwinp8@home.pl', 'EFW-1C6-CJZ', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (910, 'Lek Fain', '+86 769 742 4202', 'lfainp9@ucoz.ru', 'Q98-ORQ-BFK', 20);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (911, 'Booth Keaveney', '+7 446 620 1114', 'bkeaveneypa@unblog.fr', '2AT-K1E-T8W', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (912, 'Bram Bernardeschi', '+30 591 298 3191', 'bbernardeschipb@noaa.gov', 'T9B-W3M-SJ4', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (913, 'Wilma Ballister', '+86 379 384 1534', 'wballisterpc@tinypic.com', 'BEW-I5W-PCI', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (914, 'Baxter Farlamb', '+691 941 685 0492', 'bfarlambpd@wordpress.com', 'WWD-3H0-6G8', 30);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (915, 'Darleen St Ange', '+266 501 343 9611', 'dstpe@patch.com', '77O-SHV-O6V', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (916, 'Morry Marrow', '+7 668 466 4889', 'mmarrowpf@twitter.com', 'QT4-V7X-17G', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (917, 'Elvyn Poel', '+46 922 666 6316', 'epoelpg@vkontakte.ru', '9EK-799-D4L', 57);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (918, 'Rafa Kiraly', '+86 751 749 4359', 'rkiralyph@imdb.com', 'ZVV-II0-QSF', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (919, 'Darbee Freeburn', '+967 557 492 4039', 'dfreeburnpi@seattletimes.com', 'T8D-FNV-TBX', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (920, 'Gaspar Fenners', '+252 215 197 0625', 'gfennerspj@freewebs.com', 'B93-NCO-SQB', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (921, 'Juieta Matskevich', '+212 290 298 5596', 'jmatskevichpk@reverbnation.com', '0XM-4B4-HSA', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (922, 'Frederique Abrahamowitcz', '+86 261 318 3819', 'fabrahamowitczpl@friendfeed.com', 'D5N-W9W-1TR', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (923, 'Andrus Knagges', '+48 186 746 0748', 'aknaggespm@cpanel.net', 'DB6-Q9W-2IY', 18);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (924, 'Clementine Grace', '+86 605 395 6353', 'cgracepn@accuweather.com', 'IX0-KSH-37D', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (925, 'Rosalinda Outright', '+41 150 395 4235', 'routrightpo@seesaa.net', 'E8Z-ZJW-JD1', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (926, 'Kiley Margarson', '+507 462 962 9129', 'kmargarsonpp@google.it', 'JP6-PHJ-HWQ', 76);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (927, 'Dulcine Farfoot', '+359 851 663 0948', 'dfarfootpq@unicef.org', 'CF4-XX6-QSY', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (928, 'Kelley Leppo', '+82 179 471 4481', 'kleppopr@shutterfly.com', 'GG4-3ZT-B3J', 61);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (929, 'Sascha Hatje', '+63 567 889 0737', 'shatjeps@usnews.com', 'IQC-7ZE-6RQ', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (930, 'Ichabod Clutten', '+48 182 237 7390', 'icluttenpt@tripod.com', 'OOT-ZDM-E7R', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (931, 'Kial Lethbrig', '+351 560 961 6224', 'klethbrigpu@indiegogo.com', 'YZC-OWC-W36', 10);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (932, 'Clare Cluitt', '+86 103 143 3433', 'ccluittpv@dion.ne.jp', 'LL5-O69-3I5', 35);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (933, 'Kippie Napoleon', '+33 760 331 2687', 'knapoleonpw@goo.gl', 'LXW-QBC-0D5', 79);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (934, 'Nathan Thorley', '+66 926 538 3949', 'nthorleypx@japanpost.jp', 'AXH-SHA-RXT', 80);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (935, 'Lillian Beswetherick', '+7 382 390 1466', 'lbeswetherickpy@desdev.cn', 'B4B-QEO-VS7', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (936, 'Jessamine Fulker', '+62 201 657 2170', 'jfulkerpz@youtu.be', 'WPL-VP0-K1C', 42);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (937, 'Benyamin Yglesia', '+86 194 659 4965', 'byglesiaq0@sina.com.cn', '8JP-TRH-UIY', 13);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (938, 'Lilias MacVay', '+63 186 543 2782', 'lmacvayq1@hhs.gov', '7WL-9HG-E0U', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (939, 'Maximilien Arnet', '+57 933 501 6012', 'marnetq2@trellian.com', 'UKD-W13-UD7', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (940, 'Geoffry Coon', '+62 584 413 4427', 'gcoonq3@cornell.edu', 'D94-6FO-J4W', 50);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (941, 'Alisa Klais', '+230 794 945 1196', 'aklaisq4@eepurl.com', '0DS-CSO-ENY', 54);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (942, 'Theda Dukesbury', '+66 197 448 0544', 'tdukesburyq5@apple.com', 'HZF-I60-EI5', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (943, 'Noah Beidebeke', '+86 148 846 6393', 'nbeidebekeq6@google.ru', 'HEG-M6Z-GCW', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (944, 'Cayla Sirrell', '+420 964 545 0299', 'csirrellq7@1und1.de', 'VS6-A13-9N0', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (945, 'Aeriel Labes', '+63 409 458 7778', 'alabesq8@a8.net', 'SL2-54Q-O2W', 72);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (946, 'Madlen Paolo', '+55 763 228 0244', 'mpaoloq9@hugedomains.com', 'COZ-2MS-PE8', 7);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (947, 'Devina Iseton', '+998 476 776 6496', 'disetonqa@disqus.com', '1BQ-711-QZ6', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (948, 'Albrecht Duignan', '+381 624 541 9002', 'aduignanqb@ehow.com', 'HGH-JA0-BID', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (949, 'Wilfred Yate', '+63 529 130 3461', 'wyateqc@sogou.com', '7S4-OLR-NAE', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (950, 'Celine Stainton', '+55 322 767 0929', 'cstaintonqd@amazonaws.com', 'S3Z-U65-4PG', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (951, 'Keri Houten', '+63 763 587 6930', 'khoutenqe@uol.com.br', '341-G3R-FQO', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (952, 'Riccardo Sidon', '+351 890 529 6225', 'rsidonqf@shinystat.com', 'CRF-GFU-ILQ', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (953, 'Stafani Chazelle', '+66 875 867 4116', 'schazelleqg@arizona.edu', 'YN2-NGP-NHC', 28);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (954, 'Wait Martensen', '+62 472 637 6570', 'wmartensenqh@xrea.com', 'KAW-SLG-QU5', 24);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (955, 'Lisle Capelin', '+86 682 371 3437', 'lcapelinqi@ox.ac.uk', 'MKB-GHZ-LKI', 55);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (956, 'Bertie Noone', '+48 825 406 4538', 'bnooneqj@slate.com', '4F6-DXQ-AHY', 6);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (957, 'Gene Grabban', '+63 592 331 6317', 'ggrabbanqk@scientificamerican.com', 'HJD-2QA-W2C', 46);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (958, 'Kris Watkiss', '+62 262 106 8595', 'kwatkissql@yale.edu', '77M-7Y4-5LA', 14);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (959, 'Percy Rushforth', '+63 332 957 2855', 'prushforthqm@apple.com', '23F-VZG-FT6', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (960, 'Gregor Salle', '+963 666 934 5371', 'gsalleqn@china.com.cn', '5SE-DYL-7RO', 15);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (961, 'Mathe Murrock', '+502 896 683 2380', 'mmurrockqo@irs.gov', '2D0-DTP-B44', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (962, 'Cornelia Callaway', '+269 294 428 8832', 'ccallawayqp@japanpost.jp', '5U3-PFL-KD8', 64);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (963, 'Durward Speare', '+86 259 167 1748', 'dspeareqq@whitehouse.gov', 'R29-GF0-JFF', 68);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (964, 'Micki Tadd', '+7 621 162 8132', 'mtaddqr@google.ca', '79I-QAE-5GV', 71);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (965, 'Stephen Akred', '+1 865 169 1495', 'sakredqs@goo.gl', 'VQF-ZM8-UPN', 39);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (966, 'Sigismundo Charopen', '+58 228 200 5465', 'scharopenqt@ow.ly', 'K0M-E2H-PZN', 38);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (967, 'Kelci Scedall', '+30 436 539 1165', 'kscedallqu@about.com', 'ZJQ-EBD-B1R', 44);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (968, 'Harp Cheasman', '+353 839 985 7525', 'hcheasmanqv@paypal.com', '836-DXW-6JF', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (969, 'Sibelle Husthwaite', '+86 619 746 9814', 'shusthwaiteqw@dailymail.co.uk', 'PL4-XP2-7GN', 66);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (970, 'Amory Bofield', '+374 904 798 5378', 'abofieldqx@flickr.com', 'L6M-C4W-XXD', 73);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (971, 'Laurie Saggs', '+86 846 354 3722', 'lsaggsqy@bloglovin.com', '52G-BSX-7LF', 70);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (972, 'Willdon Heinert', '+267 869 198 9031', 'wheinertqz@feedburner.com', 'KBM-4FW-P7V', 3);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (973, 'Nahum Caveney', '+86 820 503 1718', 'ncaveneyr0@smugmug.com', 'WPM-497-Z7K', 17);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (974, 'Noelle Broadhead', '+86 166 707 6674', 'nbroadheadr1@spotify.com', 'Q5P-71O-M8I', 26);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (975, 'Eugen Stanner', '+49 962 535 8676', 'estannerr2@forbes.com', 'FPQ-QXV-UT2', 33);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (976, 'Aggy Wyd', '+501 562 100 1906', 'awydr3@etsy.com', 'NBE-2VO-JQ3', 19);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (977, 'Zebadiah Martinello', '+86 531 345 5683', 'zmartinellor4@psu.edu', 'X7L-Y1A-G80', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (978, 'Junina Belton', '+375 427 311 3584', 'jbeltonr5@mediafire.com', 'X2X-7VE-PL1', 58);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (979, 'Brewer Tringham', '+967 864 596 1136', 'btringhamr6@taobao.com', 'SFX-ZC3-Z87', 69);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (980, 'Octavia Darte', '+86 499 446 7814', 'odarter7@mtv.com', 'RBB-Y72-MB2', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (981, 'Newton McColley', '+62 801 814 5244', 'nmccolleyr8@google.ru', '7M5-PGE-NBR', 4);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (982, 'Perkin Grisbrook', '+55 678 107 2332', 'pgrisbrookr9@spotify.com', 'P9L-2LH-4RO', 74);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (983, 'Isadora Emanuelov', '+86 635 968 6524', 'iemanuelovra@earthlink.net', 'PYC-FAQ-HKU', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (984, 'Domeniga Craft', '+351 809 286 6491', 'dcraftrb@cafepress.com', 'JQ3-YE1-IDD', 34);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (985, 'Marna Trevaskiss', '+57 400 472 3281', 'mtrevaskissrc@51.la', '10T-GU4-YYD', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (986, 'Marin Cristofalo', '+62 211 299 6406', 'mcristofalord@google.fr', '4IN-PMO-TPH', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (987, 'Francklyn Wonham', '+86 771 851 4819', 'fwonhamre@devhub.com', '9AO-FWP-6D3', 77);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (988, 'Elke Jochen', '+86 712 195 3260', 'ejochenrf@reuters.com', 'EQK-A5A-THI', 37);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (989, 'Madge Biset', '+46 901 562 6264', 'mbisetrg@spotify.com', 'L5D-X9O-FFO', 23);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (990, 'Guntar Dods', '+7 317 657 7630', 'gdodsrh@furl.net', 'MID-7W8-7RX', 51);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (991, 'Trey Matic', '+33 616 255 6712', 'tmaticri@admin.ch', '9Z1-1QW-4IF', 48);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (992, 'Chevalier Kull', '+234 577 182 3362', 'ckullrj@mail.ru', 'CXA-FD9-LMD', 8);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (993, 'Brenden Jouannin', '+62 904 605 0502', 'bjouanninrk@ca.gov', '5AQ-S97-S3Y', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (994, 'Powell Tolliday', '+33 653 769 1821', 'ptollidayrl@twitter.com', 'RN7-YO0-V9W', 75);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (995, 'Coleen O Driscoll', '+48 617 358 1042', 'corm@1und1.de', 'UZ6-9IV-7KV', 21);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (996, 'Toiboid Stell', '+374 387 529 9610', 'tstellrn@columbia.edu', 'RD8-FGL-6DV', 20);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (997, 'Joyce Kassel', '+30 164 416 0800', 'jkasselro@berkeley.edu', 'VKN-KJH-O89', 56);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (998, 'Shaughn Stallan', '+86 499 609 1943', 'sstallanrp@nba.com', 'ON1-XAB-9OT', 1);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (999, 'Marcille Furnell', '+86 496 928 0193', 'mfurnellrq@1688.com', 'YJC-F2G-3MQ', 36);
insert into PASSENGERS (passenger_id, passenger_name, passenger_phone, passenger_email, passport_number, passenger_age)
values (1000, 'Stevie Ianne', '+62 927 221 0280', 'siannerr@tinypic.com', 'PBA-POD-7SH', 1);
commit;
prompt 1000 records loaded
prompt Loading BOOKINGS...
prompt Table is empty
prompt Loading CREWMEMBERS...
prompt Table is empty
prompt Enabling foreign key constraints for FLIGHTS...
alter table FLIGHTS enable constraint SYS_C008496;
alter table FLIGHTS enable constraint SYS_C008497;
alter table FLIGHTS enable constraint SYS_C008498;
alter table FLIGHTS enable constraint SYS_C008499;
prompt Enabling foreign key constraints for BOOKINGS...
alter table BOOKINGS enable constraint SYS_C008506;
alter table BOOKINGS enable constraint SYS_C008507;
prompt Enabling foreign key constraints for CREWMEMBERS...
alter table CREWMEMBERS enable constraint SYS_C008513;
prompt Enabling triggers for AIRCRAFT...
alter table AIRCRAFT enable all triggers;
prompt Enabling triggers for AIRLINES...
alter table AIRLINES enable all triggers;
prompt Enabling triggers for AIRPORTS...
alter table AIRPORTS enable all triggers;
prompt Enabling triggers for FLIGHTS...
alter table FLIGHTS enable all triggers;
prompt Enabling triggers for PASSENGERS...
alter table PASSENGERS enable all triggers;
prompt Enabling triggers for BOOKINGS...
alter table BOOKINGS enable all triggers;
prompt Enabling triggers for CREWMEMBERS...
alter table CREWMEMBERS enable all triggers;

set feedback on
set define on
prompt Done
