
[General]
Version=1

[Preferences]
Username=
Password=2911
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=AIRCRAFT
Count=10..20

[Record]
Name=AIRCRAFT_ID
Type=NUMBER
Size=
Data=Sequence(1, 1, 20)
Master=

[Record]
Name=AIRCRAFT_TYPE
Type=VARCHAR2
Size=100
Data=List(Boeing 737 ,Boeing 747 ,Boeing 777 ,Boeing 787 Dreamliner ,Airbus A320 ,Airbus A330 ,Airbus A350 ,Airbus A380 ,Embraer E190 ,Embraer E195 ,Bombardier CRJ200 ,Bombardier CRJ700 ,Bombardier CRJ900 ,Bombardier CS100 ,Bombardier CS300 ,Cessna 172 ,Cessna 182 ,Cessna Citation X ,Gulfstream G650 ,Gulfstream G550 ,Gulfstream G280 ,Dassault Falcon 7X ,Dassault Falcon 2000 ,Beechcraft King Air 350 ,Beechcraft King Air 250 ,Pilatus PC-12 ,Pilatus PC-24 ,Sukhoi Superjet 100 ,Mitsubishi Regional Jet ,Antonov An-148 ,Antonov An-158 ,Tupolev Tu-204 ,Tupolev Tu-214 ,Ilyushin Il-96 ,Comac C919 ,Comac ARJ21 ,Bombardier Q400 ,Embraer E175 ,Airbus A220 ,Airbus A321 ,Boeing 757 ,Boeing 767 ,Boeing 717 ,Airbus A340 ,Boeing 720 ,Boeing 727 ,Lockheed L-1011 ,McDonnell Douglas DC-10 ,McDonnell Douglas MD-11 ,Airbus A310)
Master=

[Record]
Name=CAPACITY
Type=NUMBER
Size=
Data=List(100, 140, 150, 170, 190, 200, 215, 230, 242, 260, 280, 300, 320, 350, 400, 420, 460, 500)
Master=

