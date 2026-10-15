CREATE DATABASE techmarket;
USE techmarket;

CREATE TABLE contas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100),
    numero_conta VARCHAR(20),
    saldo DECIMAL(10, 2) DEFAULT 0
);

CREATE TABLE transacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    conta_id INT,
    tipo ENUM('CREDITO', 'DEBITO'),
    valor DECIMAL(10, 2),
    data_transacao DATETIME,
    FOREIGN KEY (conta_id) REFERENCES contas(id)
);

DELIMITER //

CREATE PROCEDURE sp_extrato_e_saldo (
    IN p_conta_id INT,
    IN p_data_inicio DATE,
    IN p_data_fim DATE
)
BEGIN
    -- Calcular saldo total
    SELECT
        c.nome_cliente,
        c.numero_conta,
        SUM(
            CASE
                WHEN t.tipo = 'CREDITO' THEN t.valor
                WHEN t.tipo = 'DEBITO' THEN -t.valor
                ELSE 0
            END
        ) AS saldo_atual
    FROM contas c
    LEFT JOIN transacoes t ON t.conta_id = c.id
    WHERE c.id = p_conta_id
      AND t.data_transacao BETWEEN p_data_inicio AND p_data_fim;

    -- Listar as 10 últimas transações dentro do período
    SELECT
        t.id,
        t.tipo,
        t.valor,
        t.data_transacao
    FROM transacoes t
    WHERE t.conta_id = p_conta_id
      AND t.data_transacao BETWEEN p_data_inicio AND p_data_fim
    ORDER BY t.data_transacao DESC
    LIMIT 10;
END //

DELIMITER ;

INSERT INTO contas (nome_cliente, numero_conta) VALUES ('João Silva', '12345-6');

INSERT INTO transacoes (conta_id, tipo, valor, data_transacao) VALUES
(1, 'CREDITO', 10000.00, '2025-10-01 10:00:00'),
(1, 'DEBITO', 1500.00, '2025-10-05 14:30:00'),
(1, 'DEBITO', 2000.00, '2025-10-10 09:15:00'),
(1, 'CREDITO', 3000.00, '2025-10-12 11:00:00'),
(1, 'DEBITO', 500.00, '2025-10-15 16:00:00');

INSERT INTO transacoes (conta_id, tipo, valor, data_transacao) VALUES
(1, 'DEBITO', 300.00, '2025-10-08 08:00:00'),
(1, 'CREDITO', 450.00, '2025-10-09 10:30:00'),
(1, 'DEBITO', 600.00, '2025-10-11 15:20:00'),
(1, 'CREDITO', 750.00, '2025-10-13 12:45:00'),
(1, 'DEBITO', 350.00, '2025-10-14 17:00:00');

CALL sp_extrato_e_saldo(1, '2025-10-01', '2025-10-17');
