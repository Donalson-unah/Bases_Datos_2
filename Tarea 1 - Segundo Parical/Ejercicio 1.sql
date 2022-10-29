CREATE OR REPLACE TRIGGER TR1_JOBS
BEFORE DELETE ON Employees
FOR EACH ROW
BEGIN
    IF INSTR(:OLD.JOB_ID,'CLERK') >1 THEN
        RAISE_APPLICATION_ERROR(-20000,'No se puede borrar!');
    END IF;
END;

SELECT * FROM EMPLOYEES;
DELETE FROM Employees WHERE JOB_ID = 'PU_CLERK'; 