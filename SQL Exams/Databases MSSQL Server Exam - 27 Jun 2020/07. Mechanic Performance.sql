SELECT CONCAT(M.FirstName,' ',M.LastName) AS Mechanic,
       AVG(DATEDIFF(DAY,J.IssueDate,J.FinishDate)) AS [Average Days]
FROM Mechanics AS M
JOIN Jobs AS J ON M.MechanicId=J.MechanicId
GROUP BY M.MechanicId,M.FirstName,M.LastName
ORDER BY M.MechanicId