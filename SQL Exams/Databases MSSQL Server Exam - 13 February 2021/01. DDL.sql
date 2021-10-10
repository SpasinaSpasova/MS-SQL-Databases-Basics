--CREATE DATABASE [Bitbucket]
--USE [Bitbucket]


CREATE TABLE [Users]
( 
  [Id] INT PRIMARY KEY IDENTITY,
  [Username] VARCHAR(30) NOT NULL,
  [Password] VARCHAR(30) NOT NULL,
  [Email] VARCHAR(50) NOT NULL
)

CREATE TABLE [Repositories]
(
  [Id] INT PRIMARY KEY IDENTITY,
  [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE [RepositoriesContributors]
(
  [RepositoryId] INT FOREIGN KEY REFERENCES [Repositories](Id) NOT NULL,
  [ContributorId] INT FOREIGN KEY REFERENCES [Users](Id) NOT NULL,
  PRIMARY KEY([RepositoryId],[ContributorId]) 
)

CREATE TABLE [Issues]
(
  [Id] INT PRIMARY KEY IDENTITY,
  [Title] VARCHAR(255) NOT NULL,
  [IssueStatus] CHAR(6) NOT NULL,
  CHECK (LEN([IssueStatus])<=6),
  [RepositoryId] INT FOREIGN KEY REFERENCES [Repositories](Id) NOT NULL,
  [AssigneeId] INT FOREIGN KEY REFERENCES [Users](Id) NOT NULL
)

CREATE TABLE [Commits]
(
    [Id] INT PRIMARY KEY IDENTITY,
	[Message] VARCHAR(255) NOT NULL,
	[IssueId] INT FOREIGN KEY REFERENCES [Issues](Id),
	[RepositoryId] INT FOREIGN KEY REFERENCES [Repositories](Id) NOT NULL,
    [ContributorId] INT FOREIGN KEY REFERENCES [Users](Id) NOT NULL
)

CREATE TABLE [Files]
(
   [Id] INT PRIMARY KEY IDENTITY,
   [Name] VARCHAR(100) NOT NULL,
   [Size] DECIMAL(18,2) NOT NULL,
   [ParentId] INT FOREIGN KEY REFERENCES [Files](Id) ,
   [CommitId] INT FOREIGN KEY REFERENCES [Commits](Id) NOT NULL
) 
