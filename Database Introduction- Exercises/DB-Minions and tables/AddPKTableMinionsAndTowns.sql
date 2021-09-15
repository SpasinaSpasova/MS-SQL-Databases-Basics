ALTER TABLE [Towns] ADD CONSTRAINT PK_townId PRIMARY KEY ([Id])

ALTER TABLE [Towns] ALTER COLUMN [Name]  NVARCHAR(50) NOT NULL

ALTER TABLE [Minions] ALTER COLUMN [Name]  NVARCHAR(50) NOT NULL

ALTER TABLE [Minions] ADD [TownId]  INT NOT NULL

ALTER TABLE [Minions] ADD CONSTRAINT [FK_TownId]
FOREIGN KEY ([TownId]) REFERENCES [Towns](Id)