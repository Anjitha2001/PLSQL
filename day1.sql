DECLARE 

NUM1 NUMBER:=10;
NUM2 NUMBER:=20;
RESULT NUMBER;
BEGIN

RESULT :=NUM1+NUM2;
DBMS_OUTPUT.PUT_LINE('THE SUM IS '||RESULT);
END;

DECLARE 

NUM1 NUMBER:=10;
NUM2 NUMBER:=20;
BEGIN

DBMS_OUTPUT.PUT_LINE('THE SUM IS '||(NUM1+NUM2));
END;

--SUM,DIFF,PRO--
DECLARE 

NUM1 NUMBER:=&NUM1;
NUM2 NUMBER:=&NUM2;
RESULT NUMBER;
DIFFERENCE NUMBER;
PRO NUMBER;

BEGIN

RESULT :=NUM1+NUM2;
DBMS_OUTPUT.PUT_LINE('THE SUM IS '||RESULT);
DIFFERENCE :=NUM1-NUM2;
DBMS_OUTPUT.PUT_LINE('THE DIFF IS '||DIFFERENCE);
PRO :=NUM1*NUM2;
DBMS_OUTPUT.PUT_LINE('THE PRO IS '||PRO);
END;

--LARGEST--
DECLARE
NUM1 NUMBER :=&NUM1;
NUM2 NUMBER:=&NUM2;

BEGIN
  IF NUM1>NUM2 THEN
    DBMS_OUTPUT.PUT_LINE('NUM1 IS GREATER');
    ELSE
      DBMS_OUTPUT.PUT_LINE('NUM2 IS GREATER');
      END IF;
END;
--ACCEPT ONE NUMBER AND CHECK IT IS POSITIVE OR NEGATIVE

DECLARE
NUM1 NUMBER:=&NUM1;
BEGIN
  IF NUM1=0 THEN
    DBMS_OUTPUT.PUT_LINE('NUM1 IS ZERO');
  ELSIF NUM1>0 THEN
    DBMS_OUTPUT.PUT_LINE('NUM1 IS POSITIVE');
    ELSE
      DBMS_OUTPUT.PUT_LINE('NUM1 IS NEGATIVE');
      END IF;
END;      

--ACCEPT 3 NUMBERS AND CHECK HIGHEST

DECLARE

NUM1 NUMBER :=&NUM1;
NUM2 NUMBER:=&NUM2;
NUM3 NUMBER:=&NUM3;

BEGIN
  IF NUM1>NUM2 AND NUM1>NUM3 THEN
    DBMS_OUTPUT.PUT_LINE('NUM1 IS GREATER');
    ELSIF NUM2>NUM3 THEN
      DBMS_OUTPUT.PUT_LINE('NUM2 IS GREATER');
      ELSE
        DBMS_OUTPUT.PUT_LINE('NUM3 IS GREATER');
        END IF;
 END; 
 
 --vowels(case)--
 declare
 
 ch varchar2(2) := '&ch';
 begin
   case 
     when ch='A' or ch='a' then
       dbms_output.put_line('vowel');
       when ch='E' or ch='e' then
       dbms_output.put_line('vowel');
       when ch='I' or ch='i' then
       dbms_output.put_line('vowel');
       when ch='O' or ch='o' then
       dbms_output.put_line('vowel');
       when ch='U' or ch='u' then
       dbms_output.put_line('vowel');
       
       ELSE 
         DBMS_OUTPUT.put_line('NOT A VOWEL');
         END CASE;
   END;    
   
--basic loop--

DECLARE
CTR NUMBER :=1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('HELLO'||CTR);
    CTR:=CTR +1;
    EXIT WHEN CTR >5;
    END LOOP;
  END;  
  
  --WHILE LOOP--
  
  DECLARE
CTR NUMBER :=1;
BEGIN
  WHILE CTR<=5
  LOOP
    DBMS_OUTPUT.PUT_LINE('HELLO'||CTR);
    CTR:=CTR +1;
    END LOOP;
  END; 
  
 --FOR LOOP--
 DECLARE
CTR NUMBER;
BEGIN
  FOR CTR IN 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE('HELLO'||CTR);

    END LOOP;
  END; 
  
  -- REVERSE FOR LOOP--
   DECLARE
CTR NUMBER;
BEGIN
  FOR CTR IN  REVERSE 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE('HELLO'||CTR);

    END LOOP;
  END; 
  
  --odd or evem
  
 DECLARE
 NUM1 NUMBER :=&NUM1;
 BEGIN
   IF MOD(NUM1, 2) = 0 THEN
     DBMS_OUTPUT.PUT_LINE('THE NO: IS ODD');
     ELSE
        DBMS_OUTPUT.PUT_LINE('THE NO: IS EVEN');
        END IF;
      END;  
      
 -- PRIME OR NOT--
  DECLARE
 NUM1 NUMBER :=&NUM1;
 BEGIN
   IF MOD(NUM1, 2) = 0 THEN
     DBMS_OUTPUT.PUT_LINE('THE NO: IS ODD');
     ELSE
        DBMS_OUTPUT.PUT_LINE('THE NO: IS EVEN');
        END IF;
      END;  
      
 --PALINDROME--
DECLARE
  NUM1 NUMBER := &NUM1; 
  REVERSED_NUMBER NUMBER := 0;
  REMAINDER NUMBER;
  ORIGINAL_NUMBER NUMBER;
BEGIN
  ORIGINAL_NUMBER := NUM1;

  WHILE NUM1 > 0 LOOP
    REMAINDER := MOD(NUM1, 10);
    REVERSED_NUMBER := REVERSED_NUMBER * 10 + REMAINDER;
    NUM1 := TRUNC(NUM1 / 10);  
  END LOOP;

  IF ORIGINAL_NUMBER = REVERSED_NUMBER THEN
    DBMS_OUTPUT.PUT_LINE('The number ' || ORIGINAL_NUMBER || ' is a palindrome.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The number ' || ORIGINAL_NUMBER || ' is not a palindrome.');
  END IF;
END;
--prime or not--

DECLARE
  NUM1 NUMBER := &NUM1;  -- Input number
  I NUMBER;
  IS_PRIME NUMBER := 1;  -- 1 means prime, 0 means not prime
BEGIN
  IF NUM1 <= 1 THEN
    DBMS_OUTPUT.PUT_LINE('The number ' || NUM1 || ' is not prime.');
  ELSE
    FOR I IN 2..NUM1 - 1 LOOP
      IF MOD(NUM1, I) = 0 THEN
        IS_PRIME := 0;
        EXIT;
      END IF;
    END LOOP;

    IF IS_PRIME = 1 THEN
      DBMS_OUTPUT.PUT_LINE('The number ' || NUM1 || ' is prime.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('The number ' || NUM1 || ' is not prime.');
    END IF;
  END IF;
END;

--armstrong number--

DECLARE
  NUM1 NUMBER := &NUM1;        
  ORIGINAL NUMBER;
  REMAINDER NUMBER;
  RESULT NUMBER := 0;
BEGIN
  ORIGINAL := NUM1;

  WHILE NUM1 > 0 LOOP
    REMAINDER := MOD(NUM1, 10);
    RESULT := RESULT + REMAINDER * REMAINDER * REMAINDER;  
    NUM1 := TRUNC(NUM1 / 10);
  END LOOP;

  IF RESULT = ORIGINAL THEN
    DBMS_OUTPUT.PUT_LINE('The number ' || ORIGINAL || ' is an Armstrong number.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The number ' || ORIGINAL || ' is not an Armstrong number.');
  END IF;
END;






 
       
    

