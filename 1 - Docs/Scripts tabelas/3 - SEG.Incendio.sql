USE [SmartHouse]
CREATE TABLE SEG.Incendio
	(
	Codigo int NOT NULL IDENTITY (1, 1),
	Valor decimal(10, 2) NOT NULL,
	Data datetime NOT NULL,
	Excluido bit NOT NULL
	)  ON [PRIMARY];

ALTER TABLE SEG.Incendio ADD CONSTRAINT
	PK_Incendio PRIMARY KEY CLUSTERED 
	(
	Codigo
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

ALTER TABLE SEG.Incendio SET (LOCK_ESCALATION = TABLE);