SELECT * FROM [Ingredients]
WHERE [Name] IN ('Bay Leaf', 'Paprika','Poppy' )

SELECT * FROM Ingredients
WHERE  OriginCountryId=8

UPDATE Ingredients
SET DistributorId=35
WHERE [Name] IN ('Bay Leaf', 'Paprika','Poppy' )


UPDATE Ingredients
SET OriginCountryId=14
WHERE OriginCountryId=8