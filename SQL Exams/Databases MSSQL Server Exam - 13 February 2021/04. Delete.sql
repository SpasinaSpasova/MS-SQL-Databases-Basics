SELECT * FROM [Repositories]
WHERE [Name]='Softuni-Teamwork' --3
DELETE [Issues]
WHERE [RepositoryId]=3

DELETE [RepositoriesContributors]
WHERE [RepositoryId]=3