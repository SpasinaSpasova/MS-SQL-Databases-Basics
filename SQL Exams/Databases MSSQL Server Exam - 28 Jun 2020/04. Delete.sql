SELECT * FROM [Journeys]
WHERE Id BETWEEN 1 AND 3

SELECT * FROM TravelCards
WHERE JourneyId BETWEEN 1 AND 3

DELETE TravelCards
WHERE JourneyId BETWEEN 1 AND 3

DELETE Journeys
WHERE Id BETWEEN 1 AND 3