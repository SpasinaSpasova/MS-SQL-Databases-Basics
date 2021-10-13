CREATE TABLE [Students]
(
  [Id] INT PRIMARY KEY IDENTITY,
  [FirstName] NVARCHAR(30) NOT NULL,
  [MiddleName] NVARCHAR(25),
  [LastName] NVARCHAR(30) NOT NULL,
  [Age] INT,
  CHECK ([Age]>0 AND ([Age]>=5 AND [Age]<=100)),
  [Address] NVARCHAR(50),
  [Phone] NVARCHAR(10),
  CHECK (LEN([Phone])<=10)
)

CREATE TABLE [Subjects]
(
  [Id] INT PRIMARY KEY IDENTITY,
  [Name] NVARCHAR(20) NOT NULL,
  [Lessons] INT NOT NULL,
  CHECK ([Lessons]>0)
)

CREATE TABLE [StudentsSubjects]
(
   [Id] INT PRIMARY KEY IDENTITY,
   [StudentId] INT FOREIGN KEY REFERENCES [Students](Id) NOT NULL,
   [SubjectId] INT FOREIGN KEY REFERENCES [Subjects](Id) NOT NULL,
   [Grade] DECIMAL(18,2) NOT NULL,
   CHECK ([Grade] BETWEEN 2 AND 6)
)

CREATE TABLE [Exams]
(
   [Id] INT PRIMARY KEY IDENTITY,
   [Date] DATETIME2,
   [SubjectId] INT FOREIGN KEY REFERENCES [Subjects](Id) NOT NULL
)

CREATE TABLE [StudentsExams]
(
  [StudentId] INT FOREIGN KEY REFERENCES [Students](Id) NOT NULL,
  [ExamId] INT FOREIGN KEY REFERENCES [Exams](Id) NOT NULL,
  PRIMARY KEY ([StudentId],[ExamId]),
  [Grade] DECIMAL(18,2) NOT NULL,
   CHECK ([Grade] BETWEEN 2 AND 6)
)

CREATE TABLE [Teachers]
( 
   [Id] INT PRIMARY KEY IDENTITY,
   [FirstName] NVARCHAR(20) NOT NULL,
   [LastName] NVARCHAR(20) NOT NULL,
   [Address] NVARCHAR(20) NOT NULL,
   [Phone] CHAR(10),
   CHECK (LEN([Phone])<=10),
   [SubjectId] INT FOREIGN KEY REFERENCES [Subjects](Id) NOT NULL
)

CREATE TABLE [StudentsTeachers]
(
   [StudentId] INT FOREIGN KEY REFERENCES [Students](Id) NOT NULL,
   [TeacherId] INT FOREIGN KEY REFERENCES [Teachers](Id) NOT NULL,
   PRIMARY KEY ([StudentId],[TeacherId])
)