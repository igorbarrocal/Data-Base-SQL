//--------Estruturas de Repeti��o----------
// -Loop:
set serveroutput on;
DECLARE
    v_contador NUMBER(2) := 1;
BEGIN
    LOOP
        dbms_output.put_line(v_contador);
        v_contador := v_contador + 1;
        EXIT WHEN v_contador > 20;
    END LOOP;
END;

// -While:
set serveroutput on;
DECLARE
    v_contador NUMBER(2) := 1;
BEGIN
    WHILE v_contador <= 20 LOOP
        dbms_output.put_line(v_contador);
        v_contador := v_contador + 1;
    END LOOP;
END;

// - For:
set serveroutput on;
BEGIN
    FOR v_contador IN 1..20 LOOP
        dbms_output.put_line(v_contador);
    END LOOP;
END;

// -For Reverse
set serveroutput on;
BEGIN
    FOR v_contador IN REVERSE 1..20 LOOP
        dbms_output.put_line(v_contador);
    END LOOP;
END;

/---------------------------------------------/

//Exerc�cios:
// 1. Montar um bloco de programa��o que realize o processamento de uma tabuada qualquer, por exemplo a tabuada do n�mero 150.
set serveroutput on;
BEGIN 
    FOR x IN 1..10 LOOP
        dbms_output.put_line(x * 150);
    END LOOP ; 
END;

// 2. Em um intervalo num�rico inteiro, informar quantos n�meros s�o pares e quantos s�o �mpares.
set serveroutput on;
DECLARE
    contador_par NUMBER :=0;
    contador_imp NUMBER :=0;
BEGIN
    FOR x IN 1..67 LOOP
        IF MOD(x, 2) = 0 THEN
            contador_par := contador_par + 1;
        ELSE
            contador_imp := contador_imp + 1;
        END IF;
    END LOOP;
    dbms_output.put_line('A QUANTIDADE DE N�MEROS PARES S�O: '||contador_par);
    dbms_output.put_line('A QUANTIDADE DE N�MEROS �MPARES S�O: '||contador_imp);
END;

// 3. Exibir e m�dia dos valores pares em um intervalo num�rico e soma dos �mpares. (N�o Terminou a Corre��o)
set serveroutput on;
DECLARE
    contador_par NUMBER := 0;
    contador_imp NUMBER := 0;
    soma_par NUMBER := 0;
    soma_imp NUMBER := 0;
BEGIN
    FOR x IN 1..150 LOOP
        IF MOD(x, 2) = 0 THEN
            contador_par := contador_par + 1;
            soma_par := soma_par + x;
        ELSE
            contador_imp := contador_imp + 1;
            soma_imp := soma_imp + x;
        END IF;
    END LOOP;
END;
            
        

    


