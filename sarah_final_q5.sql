connect sys/sys as sysdba;

spool c:\Sarah\sem.3\databases2\exams\final_exam\final_exam_sarah_q5.txt;

connect des03/des03;

CREATE OR REPLACE PROCEDURE student_info(p_s_id NUMBER, p_cs_id NUMBER, p_grade enrollment.grade%TYPE) AS
    flag NUMBER;
    v_c_sec_id NUMBER;
    v_s_id NUMBER;
BEGIN
    flag := 0;
    SELECT c_sec_id INTO v_c_sec_id FROM course_section WHERE c_sec_id = p_cs_id;
    flag := 1;
    SELECT s_id INTO v_s_id FROM student WHERE s_id = p_s_id;
    flag := 2;
    SELECT s_id INTO v_s_id FROM enrollment WHERE s_id = p_s_id;
    flag := 3;

    if flag = 0 then
        DBMS_OUTPUT.PUT_LINE('Student ID and Course Section ID do not exist.');
    elsif flag = 1 then -- insert
        DBMS_OUTPUT.PUT_LINE('Student ID does not exist. Please insert a new student to update.');
    elsif flag = 2 then -- update
        UPDATE enrollment 
        SET c_sec_id = p_cs_id, grade = p_grade 
        WHERE s_id = p_s_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('------ UPDATED.');
    elsif flag = 3 then
        INSERT INTO enrollment(s_id, c_sec_id, grade) 
        VALUES (p_s_id, p_cs_id, p_grade);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('------ INSERTED.');
    end if;

END;
/

spool off 