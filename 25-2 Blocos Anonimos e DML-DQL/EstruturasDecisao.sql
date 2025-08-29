--Tomada de Decis�o

set serveroutput on;

DECLARE
    genero CHAR(1) := '&digite';
BEGIN
    IF upper(genero) = 'F' THEN
        dbms_output.put_line('O g�nero informado � Feminino');
    ELSIF upper(genero) = 'M' THEN
        dbms_output.put_line('O g�nero informado � Masculino');
    ELSE
        dbms_output.put_line('Outros');
    END IF;
END;

/----------------------------------------------------------------/
--Exerc�cios

-- 1) CRIAR UM BLOCO AN�NIMO PARA INFORMAR SE O N�MERO INFORMADO � PAR OU �MPAR.
set serveroutput on; 

DECLARE
    numero NUMBER := &digite;
BEGIN
    IF mod(numero, 2) = 0 THEN
        dbms_output.put_line('O n�mero � Par');
    ELSE
        dbms_output.put_line('O n�mero � �mpar');
    END IF;
END;


-- 2) CRIAR UM BLOCO AN�NIMO PARA INFORMAR O USU�RIO SE A NOTA EST� ACIMA DA M�DIA, NA M�DIA OU ABAIXO
/*
- ACIMA DE 8 E MENOR QUE 10 = NOTA ACIMA DA M�DIA!
- ENTRE 6 E 7 = NA M�DIA
- MENOR QUE 6 = REPROVADO
*/

set serveroutput on; 

DECLARE
    nota NUMBER := &digite;
BEGIN
    IF
        nota >= 8
        AND nota <= 10
    THEN
        dbms_output.put_line('SUA NOTA EST� ACIMA DA M�DIA');
    ELSIF nota BETWEEN 6 AND 7 THEN
        dbms_output.put_line('SUA NOTA EST� NA M�DIA');
    ELSE
        dbms_output.put_line('VOC� EST� REPROVADO');
    END IF;
END;


