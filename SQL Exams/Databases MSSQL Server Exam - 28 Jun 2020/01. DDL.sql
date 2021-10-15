CREATE TABLE [Planets]
(
  [Id] INT PRIMARY KEY IDENTITY,
  [Name] VARCHAR(30) NOT NULL
)

CREATE TABLE [Spaceports]
(
  [Id] INT PRIMARY KEY IDENTITY, 
  [Name] VARCHAR(50) NOT NULL,
  [PlanetId] INT FOREIGN KEY REFERENCES [Planets](Id) NOT NULL
)

CREATE TABLE [Spaceships]
(
  [Id] INT PRIMARY KEY IDENTITY, 
  [Name] VARCHAR(50) NOT NULL,
  [Manufacturer] VARCHAR(30) NOT NULL,
  [LightSpeedRate] INT DEFAULT(0)
)

CREATE TABLE [Colonists]
(
  [Id] INT PRIMARY KEY IDENTITY, 
  [FirstName] VARCHAR(20) NOT NULL,
  [LastName] VARCHAR(20) NOT NULL,
  [Ucn] VARCHAR(20) UNIQUE NOT NULL,
  [BirthDate] DATETIME2 NOT NULL
)

CREATE TABLE [Journeys]
(
  [Id] INT PRIMARY KEY IDENTITY, 
  [JourneyStart] DATETIME2 NOT NULL,
  [JourneyEnd] DATETIME2 NOT NULL,
  [Purpose] VARCHAR(11) NOT NULL,
  CHECK ([Purpose] IN ('Medical', 'Technical', 'Educational', 'Military')),
  [DestinationSpaceportId] INT FOREIGN KEY REFERENCES [Spaceports](Id) NOT NULL,
  [SpaceshipId] INT FOREIGN KEY REFERENCES [Spaceships](Id) NOT NULL
)

CREATE TABLE [TravelCards]
( 
  [Id] INT PRIMARY KEY IDENTITY, 
  [CardNumber] VARCHAR(10) NOT NULL UNIQUE,
  CHECK (LEN([CardNumber])<=10),
  [JobDuringJourney] VARCHAR(8) NOT NULL,
  CHECK ([JobDuringJourney] IN ('Pilot', 'Engineer', 'Trooper', 'Cleaner','Cook')),
  [ColonistId] INT FOREIGN KEY REFERENCES [Colonists](Id) NOT NULL,
  [JourneyId] INT FOREIGN KEY REFERENCES [Journeys](Id) NOT NULL
)