--Criando uma função armazenada para consultar e retornar valores específicos
--Exemplo: queremos retornar o nome de um cliente a partir do seu ID.

CREATE OR REPLACE FUNCTION get_cliente_nome(
    p_cliente_id IN NUMBER
) RETURN VARCHAR2
IS
    v_nome VARCHAR2(100);
BEGIN
    SELECT nome
    INTO v_nome
    FROM clientes
    WHERE cliente_id = p_cliente_id;

    RETURN v_nome;
END;
/
-- O que acontece aqui:
--A função recebe um parâmetro p_cliente_id
--Faz um SELECT ... INTO para pegar o valor
--Retorna o nome do cliente

-- Usando a função em uma instrução SQL
SELECT get_cliente_nome(101) AS nome_cliente
FROM dual;
No Oracle, dual é uma tabela fictícia usada para retornar valores únicos.

--Também é possível usar em um SELECT normal:

SELECT pedido_id, get_cliente_nome(cliente_id) AS nome_cliente
FROM pedidos;

-- Criando uma função para inserir uma nova linha
--Exemplo: inserir um novo cliente usando parâmetros e retornar o ID gerado.

CREATE OR REPLACE FUNCTION add_cliente(
    p_nome IN VARCHAR2,
    p_email IN VARCHAR2 DEFAULT 'sememail@dominio.com'
) RETURN NUMBER
IS
    v_id NUMBER;
BEGIN
    INSERT INTO clientes (cliente_id, nome, email)
    VALUES (clientes_seq.NEXTVAL, p_nome, p_email)
    RETURNING cliente_id INTO v_id;

    RETURN v_id;
END;
/
-- Aqui usamos parâmetro com valor default (p_email) e RETURNING para pegar o ID inserido.

-- Chamando a função dentro de um procedure
--Exemplo: procedure que cria um cliente e depois exibe seu nome.


CREATE OR REPLACE PROCEDURE cria_cliente_e_mostra(
    p_nome IN VARCHAR2,
    p_email IN VARCHAR2
)
IS
    v_id NUMBER;
    v_nome VARCHAR2(100);
BEGIN
    -- Chama a função para inserir
    v_id := add_cliente(p_nome, p_email);

    -- Chama a função para buscar o nome
    v_nome := get_cliente_nome(v_id);

    DBMS_OUTPUT.PUT_LINE('Cliente criado: ' || v_nome || ' (ID: ' || v_id || ')');
END;
/
-- Testando no SQL

-- Habilita saída
SET SERVEROUTPUT ON;

-- Chama o procedure
BEGIN
    cria_cliente_e_mostra('Carlos Silva', 'carlos@email.com');
END;
/
