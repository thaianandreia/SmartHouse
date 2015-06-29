USE [SmartHouse]
ALTER TABLE SEG.Comodo SET (LOCK_ESCALATION = TABLE);

CREATE TABLE SEG.DetectorIncendio
	(
	Codigo int NOT NULL IDENTITY (1, 1),
	CodigoComodo int NOT NULL,
	Valor decimal(10, 2) NOT NULL,
	Data datetime NOT NULL,
	IndicadorIncendio bit NOT NULL,
	Excluido bit NOT NULL
	)  ON [PRIMARY];

ALTER TABLE SEG.DetectorIncendio ADD CONSTRAINT
	FK_DetectorIncendio_Comodo FOREIGN KEY
	(
	CodigoComodo
	) REFERENCES SEG.Comodo
	(
	Codigo
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION;

ALTER TABLE SEG.DetectorIncendio SET (LOCK_ESCALATION = TABLE);