CREATE OR REPLACE TRIGGER TR2_DEPARTMENTS
BEFORE INSERT ON DEPARTMENTS
FOR EACH ROW
BEGIN
    IF :NEW.DEPARTMENT_ID = :OLD.DEPARTMENT_ID THEN
        RAISE_APPLICATION_ERROR(-20000,'ID Repetido');
    END IF;
    IF :NEW.LOCATION_ID IS NULL THEN
    :NEW.LOCATION_ID := 1700;
    END IF;
    IF :NEW.MANAGER_ID IS NULL THEN
    :NEW.MANAGER_ID := 200;
    END IF;
END;

INSERT INTO DEPARTMENTS VALUES(106,'PRUEBA',NULL,1800);
SELECT * FROM DEPARTMENTS ORDER BY DEPARTMENT_ID;
DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID = 1;