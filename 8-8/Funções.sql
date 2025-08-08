----------------------------------------
-- Preparação do ambiente
----------------------------------------

-- Apagar a tabela EMPR, se existir
DROP TABLE EMPR PURGE;

-- Criar e popular a tabela EMPR
CREATE TABLE EMPR (
  cd_empr  NUMBER(5) PRIMARY KEY,
  nm_empr  VARCHAR2(30),
  vl_sal   NUMBER(9,2),
  vl_comis NUMBER(9,2),
  cd_dept  NUMBER(3)
);

-- Inserindo registros
INSERT INTO EMPR VALUES (100, 'Pulquéria', 12728.47, NULL, 10);
INSERT INTO EMPR VALUES (110, 'Alarico',    890.00,   3000, 20);
INSERT INTO EMPR VALUES (130, 'Absolon',   1200.00,   7000, 30);
INSERT INTO EMPR VALUES (200, 'Kitty',     9870.22,   NULL, 20);
COMMIT;

----------------------------------------
-- Função: pega_sal
----------------------------------------
CREATE OR REPLACE FUNCTION pega_sal (
  p_id EMPR.cd_empr%TYPE
) RETURN NUMBER IS
  v_sal EMPR.vl_sal%TYPE := 0;
BEGIN
  SELECT vl_sal INTO v_sal
  FROM EMPR
  WHERE cd_empr = p_id;

  RETURN v_sal;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END pega_sal;
/
SELECT pega_sal(&Funcionario) FROM DUAL;-- VER O SALARIO DO FUNCIONARIO


-- Testando a função
SET SERVEROUTPUT ON
EXECUTE dbms_output.put_line(pega_sal(100));

VARIABLE b_vl_sal NUMBER
EXECUTE :b_vl_sal := pega_sal(100);
PRINT b_vl_sal;

-- Usando variável local
DECLARE
  sal EMPR.vl_sal%TYPE;
BEGIN
  sal := pega_sal(100);
  DBMS_OUTPUT.PUT_LINE('O salário é: ' || sal);
END;
/

-- Consulta com função
SELECT cd_empr, pega_sal(cd_empr) AS salario
FROM EMPR;

----------------------------------------
-- Função: taxa
----------------------------------------
CREATE OR REPLACE FUNCTION taxa (
  p_value IN NUMBER
) RETURN NUMBER IS
BEGIN
  RETURN (p_value * 0.08);
END taxa;
/

-- Consulta com taxa
SELECT cd_empr, nm_empr, vl_sal, taxa(vl_sal) AS imposto
FROM EMPR
WHERE cd_dept = 10;

----------------------------------------
-- Função com parâmetros default
----------------------------------------
CREATE OR REPLACE FUNCTION f (
  p_parameter_1 IN NUMBER DEFAULT 1,
  p_parameter_5 IN NUMBER DEFAULT 5
) RETURN NUMBER IS
  v_var NUMBER;
BEGIN
  v_var := p_parameter_1 + (p_parameter_5 * 2);
  RETURN v_var;
END f;
/

-- Chamando com notação nomeada
SELECT f(p_parameter_5 => 10) AS resultado FROM DUAL;
