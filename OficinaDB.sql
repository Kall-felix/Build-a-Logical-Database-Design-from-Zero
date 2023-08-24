USE Oficina;

SELECT * FROM PessoaFisica;
INSERT INTO PessoaFisica VALUES (1, 'Rafael', 12345678910, 'Cristal, 456', '97973748992'),
								(2, 'João', 60282037004, 'Ilhabela, 5', '75983324796'),
                                (3, 'Eustácio', 83555680013, 'Cristo, 99', '97979473312'),
                                (4, 'Mateus', 99504436013, 'Luis de Camoes, 45', '96989181236'),
                                (5, 'Arlete', 57795781098, 'Maria Madalena, 21', '99973721754'),
                                (6, 'Julia', 85276921040, 'Bom Jesus, 7', '79993502122');

SELECT * FROM Veiculo;
INSERT INTO Veiculo VALUES 	(1, 1, 'HNN5808'),
							(2, 2, 'HZH2460'),
                            (3, 3, 'MYB8825'),
                            (4, 4, 'KLA0738'),
                            (5, 5, 'KAU9696'),
                            (6, 6, 'MNL4630');

SELECT * FROM Conserto;
INSERT INTO Conserto VALUES (1, 'Barulho estranho'),
							(2, 'Espelho quebrado'),
                            (3, 'Não liga'),
                            (4, 'Não funciona'),
                            (5, 'Pneu furado'),
                            (6, 'Quebrado');
                            
SELECT * FROM Mecanico;
INSERT INTO Mecanico VALUES	(1, 'José', 'Alheira', 'Eletricista'),
							(2, 'Alemão', 'Esquina com a primeira', 'Borracharia'),
                            (3, 'Amado', 'Virtude, 555', 'Vidros'),
                            (4, 'Luis', 'Rua dos espertos, 1', 'Pneus'),
                            (5, 'Amanda', 'Rua plenitude, 54', 'Qualquer tipo de reparo'),
                            (6, 'Caio', 'Av. Ambrosia', 'Funilaria');

SELECT * FROM OdServico;
INSERT INTO OdServico VALUES 	(1, '2023/08/08', '145.00', '25.00', '169.50', 'AGUARDANDO', NULL),
								(2, '2023/08/06', '199.99', '85.90', '208.99', 'CONCLUIDO', '2023/07/13'),
								(3, '2023/08/03', '934.99', '569.99', '959.99', 'CONCLUIDO', '2023/08/10'),
								(4, '2023/08/18', '299.99', '109.99', '354.99', 'EM ANDAMENTO', NULL),
								(5, '2023/08/22', '519.99', '9.99', '499.99', 'CANCELADO', NULL),
								(6, '2023/08/27', '779.99', '7.99', '639.99', 'EM ANDAMENTO', NULL);
                                
SELECT * FROM Autorizacao;
INSERT INTO Autorizacao VALUES 	(1, FALSE),
								(2, TRUE),
								(3, TRUE),
								(4, TRUE),
								(5, FALSE),
								(6, TRUE);
                                
SELECT * FROM Pecas;
INSERT INTO Pecas VALUES 	(1, 'Pneu', '19.99'),
							(2, 'Pistão', '79.99'),
							(3, 'Ar condicionado', '69.99'),
							(4, 'Caixa eletrica', '149.99'),
							(5, 'Volante', '29.99'),
							(6, 'Cambio', '569.99');
                                
SELECT * FROM Servicos;
INSERT INTO Servicos VALUES 	(1, 'Problemas Eletricos', '149.59'),
								(2, 'Caixa de cambio quebrado', '199.99'),
								(3, 'Problemas Eletricos', '729.99'),
								(4, 'Peça proxima a caixa de direção danificada', '349.99'),
								(5, 'Pneu Furado', '129.99'),
								(6, 'O sistema de ar condicionado danificada', '899.99');

SELECT Autorizacao.Autorizado, OdServico.idOdServico, Clientes.idClientes
	FROM Autorizacao
    CROSS JOIN OdServico, Clientes;
