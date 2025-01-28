-----------------------------------
--              Q2
-----------------------------------


connect sys/sys as sysdba;

spool c:\Sarah\sem.3\databases2\exams\final_exam\final_exam_sarah_q4.txt;

connect des04/des04;
DROP TABLE audit_project_consultant;
DROP SEQUENCE audit_id_sequence;
DROP TRIGGER project_consultant_trigger;
REVOKE SELECT, UPDATE ON project_consultant TO sarah;

-- Table
CREATE TABLE audit_project_consultant(audit_id NUMBER, project_id NUMBER, consultant_id NUMBER, roll_on_date DATE, roll_off_date DATE, date_updated DATE, updating_user VARCHAR2(20));

-- Sequence
CREATE SEQUENCE audit_id_sequence START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER project_consultant_trigger
    INSTEAD OF UPDATE ON project_consultant
    FOR EACH ROW
    BEGIN
        IF UPDATING THEN
            INSERT INTO audit_project_consultant
            VALUES(audit_id_sequence.NEXTVAL, p_id, c_id, :OLD.roll_on_date, :OLD.roll_off_date, sysdate, user);
        END IF;
    END;
/

-- Grant
GRANT SELECT, UPDATE ON project_consultant TO sarah;

SET SERVEROUTPUT ON

-- Test
connect sarah/123;
UPDATE des04.project_consultant SET roll_on_date = sysdate, roll_off_date = sysdate WHERE c_id = 101;

spool off;