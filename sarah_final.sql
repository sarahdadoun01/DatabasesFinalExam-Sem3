-----------------------------------
--              Q2
-----------------------------------



connect sys/sys as sysdba;

spool c:\Sarah\sem.3\databases2\exams\final_exam\final_exam_sarah.txt;

DROP PACKAGE calculate_area_package;
DROP PACKAGE BODY calculate_area_package;

CREATE OR REPLACE PACKAGE calculate_area_package IS
    FUNCTION get_area (side NUMBER, perimeter OUT NUMBER, shape OUT VARCHAR2) RETURN NUMBER;
    FUNCTION get_area (width NUMBER, height NUMBER, perimeter OUT NUMBER, shape OUT VARCHAR2) RETURN NUMBER;
    PROCEDURE area_perimeter(width NUMBER, height NUMBER);
END;
/

DROP PACKAGE BODY calculate_area_package;
CREATE OR REPLACE PACKAGE BODY calculate_area_package IS 

    -- Square
    FUNCTION get_area(side NUMBER, perimeter OUT NUMBER, shape OUT VARCHAR2) 
    RETURN NUMBER IS
        v_area NUMBER;
    BEGIN
        shape := 'square';
        perimeter := side*4;
        v_area := side * side;
        RETURN v_area;
    END get_area;


    -- Rectangle
    FUNCTION get_area(width NUMBER, height NUMBER, perimeter OUT NUMBER, shape OUT VARCHAR2) 
    RETURN NUMBER IS
        v_area NUMBER;
    BEGIN
        shape := 'rectangle';
        perimeter := (width*2) + (height*2);
        v_area := width * height;
        RETURN v_area;
    END get_area;

    PROCEDURE area_perimeter(width NUMBER, height NUMBER) AS
        v_perimeter NUMBER;
        v_shape     VARCHAR2(10);
        v_area      NUMBER;
    BEGIN
        if width < 0 then
            DBMS_OUTPUT.PUT_LINE('ERROR : Width cannot be a negative number.');
        elsif height < 0 then
            DBMS_OUTPUT.PUT_LINE('ERROR : Height cannot be a negative number.');
        else
            if width = height then
                v_area := get_area(width, v_perimeter, v_shape);
                DBMS_OUTPUT.PUT_LINE('Where ' || v_shape || ' is the shape, ' || width || ' is the width ' || height || ' is the height,' || v_area || ' is the area,' || v_perimeter || ' is the perimeter.');
            else
                v_area := get_area(width, height, v_perimeter, v_shape);
                DBMS_OUTPUT.PUT_LINE('Where ' || v_shape || ' is the shape, ' || width || ' is the width, ' || height || ' is the height,' || v_area || ' is the area,' || v_perimeter || ' is the perimeter.');
            end if;
        end if;

    END area_perimeter;
END;
/

SET SERVEROUTPUT ON
exec calculate_area_package.area_perimeter(2,3);

spool off;