-----------------------------------
--              Q2
-----------------------------------

connect sys/sys as sysdba;

spool c:\Sarah\sem.3\databases2\exams\final_exam\final_exam_sarah_q3.txt;

connect des04/des04;

CREATE OR REPLACE PROCEDURE display_consultant_projects AS
    --v_p_name project.project_name%TYPE;
    --v_c_name consultant.c_last%TYPE;

    CURSOR proj_cons_id IS
        select mgr_id, p_id
        --into v_mgr_id, v_p_id
        from project;
        --v_p_name project.project_name%TYPE;
        --v_c_name consultant.c_last%TYPE;

    CURSOR curr1(v_p_id NUMBER, v_mgr_id NUMBER) IS
        select distinct c_first, c_last, roll_on_date, roll_off_date, project_name
        from consultant c, project_consultant pc, project p
        where p.p_id = v_p_id AND
        c.c_id = v_mgr_id AND pc.c_id = v_mgr_id AND pc.p_id = v_p_id
BEGIN
    FOR id IN proj_cons_id LOOP
        DBMS_OUTPUT.PUT_LINE('-------------------------';)
        FOR project IN curr1(id.p_id, id.mgr_id) LOOP

            DBMS_OUTPUT.PUT_LINE('Project Name : ' || project.project_name || ', ' || project.c_last);
            DBMS_OUTPUT.PUT_LINE('Consultant Name : ' || project.c_first || ' ' || project.c_last);
            DBMS_OUTPUT.PUT_LINE('Start : ' || project.roll_on_date);
            DBMS_OUTPUT.PUT_LINE('End : ' || project.roll_off_date);
            DBMS_OUTPUT.PUT_LINE(' ');

        END LOOP;
    END LOOP;
END;
/


select c_first, c_last, roll_on_date, roll_off_date, project_name
from consultant c, project_consultant pc, project p
where p.p_id = v_p_id AND
c.c_id = v_mgr_id AND pc.c_id = v_mgr_id AND pc.p_id = v_p_id

select mgr_id, p_id
into v_mgr_id, v_p_id
from project;