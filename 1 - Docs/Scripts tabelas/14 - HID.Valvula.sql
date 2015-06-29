USE [SmartHouse]
CREATE TABLE HID.Valvula
	(
	Codigo int NOT NULL IDENTITY (1, 1),
	Nome nvarchar(80) NOT NULL,
	Descricao nvarchar(MAX) NOT NULL,
	Ativo bit NOT NULL,
	Excluido bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY];

ALTER TABLE HID.Valvula ADD CONSTRAINT
	PK_Valvula PRIMARY KEY CLUSTERED 
	(
	Codigo
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

ALTER TABLE HID.Valvula SET (LOCK_ESCALATION = TABLE);
