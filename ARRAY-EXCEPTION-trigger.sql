--------------------------------ARRAY----------------------------------

--1--

DECLARE 
type V_ARR is VARRAY(4) OF VARCHAR2(40);
V_COLOR V_ARR := V_ARR(NULL,NULL,NULL,NULL);

BEGIN
  V_COLOR(1):='RED';
  V_COLOR(2):='ROSE';
  V_COLOR(3):='YELLOW';
  V_COLOR(4):='GREEN';
  
  FOR I IN 1..V_COLOR.COUNT
    LOOP
      DBMS_OUTPUT.put_line(V_COLOR(I));
      END LOOP;
      END;
      
--EXCEPTION---

--USER DEFINED---
SELECT * FROM CUSTOMERS;

DECLARE

CREDIT_LIMIT_EXCEED EXCEPTION;
PRAGMA EXCEPTION_INIT(CREDIT_LIMIT_EXCEED,-20111);

I_CUSTOMER_ID CUSTOMERS.CUSTOMER_ID%TYPE :=&CUSTOMER_ID;
I_CREDIT_LIMIT CUSTOMERS.CREDIT_LIMIT%TYPE :=&CREDIT_LIMIT;
I_CUSTOMER_CREDIT CUSTOMERS.CREDIT_LIMIT%TYPE;

BEGIN
  --GET CUSTOMER CREDIT LIMIT--
  SELECT CREDIT_LIMIT INTO I_CUSTOMER_CREDIT FROM CUSTOMERS WHERE CUSTOMER_ID=I_CUSTOMER_ID;
  
  --RAISE AN EXCEPTION IF THE CREDIT KIMIT IS EXCEEDED--
  IF I_CUSTOMER_CREDIT>I_CREDIT_LIMIT THEN
    RAISE APPLICATION_ERROR(-20111,'CREDIT LIMIT EXCEEDED');
    END IF;
    DBMS_OUTPUT.PUT_LINE('CREDIT LIMIT IS CHECKED AND PASSED');
    
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('CUSTOMER WITH ID'||I_CUSTOMER_ID||'DOES NOT EXIST');
        END;
        
------------------TRIGGER------------------
SELECT * FROM EMP;

CREATE OR REPLACE TRIGGER TGR_DML1
BEFORE INSERT
ON EMP 
FOR EACH ROW
  BEGIN
    DBMS_OUTPUT.PUT_LINE('INSERTING RECORD......TRIGGER MSG');
    END;
    
    INSERT INTO EMP VALUES(101,'AAA','AAAA',900,'05-JAN-2001',2000,2000,10);
    
CREATE OR REPLACE TRIGGER TGR_DML2
AFTER INSERT
ON EMP 
FOR EACH ROW
  BEGIN
    DBMS_OUTPUT.PUT_LINE(' RECORD INSERTING......TRIGGER MSG');
    END;
    
INSERT INTO EMP VALUES('9000','ABCD','AAAA','900','05-04-2001',2000,'1000.00',10);  
--------------------------------------- 

CREATE OR REPLACE TRIGGER TGR_DELETE
BEFORE DELETE
ON EMP 
FOR EACH ROW
  BEGIN
    RAISE_APPLICATION_ERROR(-2000,'DELETION NOT SUPPORTED ON THIS TABLE')
    END;
    
    DELETE FROM EMP WHERE EMPNO=101;
    
 -----------------------------------------
 
 CREATE TABLE EMP_HIST AS SELECT * FROM EMP;
     
    SELECT * FROM EMP_HIST;
    
DELETE FROM EMP_HIST;

CREATE OR REPLACE TRIGGER TGR_DELEMP
BEFORE DELETE ON EMP
FOR EACH ROW
  BEGIN
    INSERT INTO EMP_HIST VALUES
    (:OLD.EMPNO,:OLD.ENAME,:OLD.JOB,:OLD.MGR,:OLD.HIREDATE,:OLD.SAL,:OLD.COMM,:OLD.DEPTNO);
    DBMS_OUTPUT.put_line('TOOK BACKUP');
    END;
    
    ALTER TRIGGER TGR_DELETE DISABLE;
   
    DELETE FROM EMP WHERE EMPNO=90;
    
    SELECT * FROM EMP;
   ------------------------view-----------------------
   
   create or replace view com_emp_vw1 as
   select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno,d.dname,d.loc from emp e,dept d where e.deptno=d.deptno;
   
   
   
   create or replace trigger trgempdep_vw
   instead of insert on com_emp_vw1
   declare
   check_exists number;
   begin
     select count(*)into check_exists from dept d where d.deptno=:new.deptno;
     if check_exists=0 then
       insert into dept(deptno,dname,loc)values(:new.deptno,:new.dname,:new.loc);
       end if;
       
       insert into emp(empno,ename,job,hiredate,sal,comm,deptno)values(:new.empno,:new.ename,;new.job,:new.hiredate,
       :new.sal,:new.comm,:new.deptno);
       end;
       
        insert into com_emp_vw1(empno,ename,job,hiredate,sal,comm,deptno,dname,loc)
   values(1222,'bbb','sales','09-may-2000',89999,7889,89,'marketing','jhrgh');
 ----------------------------------------------------
 
 -- Step 1: Create or replace the view
CREATE OR REPLACE VIEW com_emp_vw1 AS
SELECT 
    e.empno,
    e.ename,
    e.job,
    e.mgr,
    e.hiredate,
    e.sal,
    e.comm,
    e.deptno,
    d.dname,
    d.loc
FROM emp e
JOIN dept d ON e.deptno = d.deptno;

-- Step 2: Create or replace the trigger
CREATE OR REPLACE TRIGGER trgempdep_vw
INSTEAD OF INSERT ON com_emp_vw1
FOR EACH ROW
DECLARE
    check_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO check_exists 
    FROM dept 
    WHERE deptno = :NEW.deptno;

    IF check_exists = 0 THEN
        INSERT INTO dept(deptno, dname, loc)
        VALUES (:NEW.deptno, :NEW.dname, :NEW.loc);
    END IF;

    INSERT INTO emp(empno, ename, job, hiredate, sal, comm, deptno)
    VALUES (:NEW.empno, :NEW.ename, :NEW.job, :NEW.hiredate, :NEW.sal, :NEW.comm, :NEW.deptno);
END;
/

-- Step 3: Insert data into the view (this will trigger the INSTEAD OF INSERT trigger)
INSERT INTO com_emp_vw1(empno, ename, job, hiredate, sal, comm, deptno, dname, loc)
VALUES (1222, 'bbb', 'sales', TO_DATE('09-may-2000','DD-MON-YYYY'), 89999, 7889, 89, 'marketing', 'jhrgh');

select * from emp;
select * from dept where deptno=89;
