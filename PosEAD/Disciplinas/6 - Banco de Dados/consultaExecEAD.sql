INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Santos","SP");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Corinthians","SP");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("São Paulo","SP");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Palmeiras","SP");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Vasco da Gama","RJ");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Internacional","RS");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Atlético-MG","MG");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Grêmio","RS");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Botafogo","RJ");
INSERT INTO TIME (nomeTime,siglaUF) VALUES ("Bahia","BA");

INSERT INTO ESTADIO (codEstadio, nomeEstadio,Cidade,siglaUF) VALUES (9, "Fonte Nova", "Salvador", "BA")

select * from UF
select * from time
select * from estadio
select * from jogos
select * from classificacao


SELECT t.nomeTime,placarTimeCasa,placarTimeVisitante


insert into jogos(rodada,diaJogo,codTimeVisitante,placarTimecasa,placarTimeVisitante,codTime,codEstadio)
				values(2,'2018-07-18',8,0,1,13,1)

insert into time(nomeTime,siglaUF) values ('Pirapora','SP')

insert into classificacao (pontos,jogos,vitorias,empates,derrotas,golsPro,golsContra,codTime)
						values (3,2,1,0,1,3,3,13)


update UF set nomeUF = "São Paulo" WHERE SIGLAUF = "SP"

update jogos set placarTimeCasa = 3 where numjogo = 5

insert into classificacao (pontos,jogos,vitorias,empates,derrotas,golsPro,golsContra,codTime)
				values (6,2,2,0,0,4,2,8)

 
SELECT	T1.NOMETIME AS TIMEVISITANTE,
			PLACARTIMEVISITANTE,
			PLACARTIMECASA,
			T2.NOMETIME AS TIMECASA,
			if (placartimevisitante > placartimecasa, "Derrota", "Vitoria") as RESULTADO_CASA
				FROM JOGOS J
				JOIN TIME T1 ON J.CODTIMEVISITANTE = T1.CODTIME
				JOIN TIME T2 ON J.CODTIME = T2.CODTIME		
				WHERE T2.NOMETIME = "PIRAPORA"

/* Exercicio 1 - Banco de Dados PósEAD */
SELECT T.NOMETIME AS NomeTIme, pontos, jogos, vitorias, empates, derrotas, golsPro, golsContra
	FROM classificacao c
	JOIN time t on t.codTime = c.codTime 
	ORDER BY pontos, vitorias, golsPro DESC
	
	
/* Exercicio 2 - Banco de Dados PósEAD */
SELECT	T.NOMETIME AS TIMECASA,			
			count(*) as QNT_DERROTAS
				FROM JOGOS J
				JOIN TIME T ON J.CODTIME = T.CODTIME		
						WHERE T.NOMETIME = "PIRAPORA" and placartimevisitante > placartimecasa	