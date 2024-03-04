--Exercice1
SET SERVEROUTPUT ON 

DECLARE

v_id employees.employee_id%type:=&s_id;
v_lname employees.last_name%type;
v_fname employees.first_name%type;
v_manager employees.manager_id%type;
BEGIN 
select last_name, first_name, manager_id INTO v_lname, v_fname, v_manager
from employees
where employee_id=v_id;
if(v_manager IS NULL)
    then dbms_output.put_line(v_fname||' '||v_lname||' is the manager');
end if;
END;

-- effectuer la recherche selon le nom de l'employée
-- Si la variable de substitution est une chaine de caractères on la met entre cote ' '

SET SERVEROUTPUT ON 

DECLARE

v_id employees.employee_id%type;
v_lname employees.last_name%type:= '&s_name';
v_fname employees.first_name%type;
v_manager employees.manager_id%type;
BEGIN 
select last_name, first_name, manager_id INTO v_lname, v_fname, v_manager
from employees
where UPPER(last_name)=UPPER(v_lname);
if(v_manager IS NULL)
    then dbms_output.put_line(v_fname||' '||v_lname||' is the manager');
    else dbms_output.put_line(v_fname||' '||v_lname||' is not the manager');
end if;
END;
-- exp : kochhar

-- Exercice 2 :
-- 
SET SERVEROUTPUT ON 

DECLARE

v_id employees.employee_id%type:=&s_id;
v_dept employees.department_id%type;
v_comm employees.commission_pct%type;
BEGIN 
select department_id INTO v_dept
from employees
where employee_id=v_id;
if(v_dept=80)
    then v_comm:=0.2;
    else v_comm:= 0.12;
end if;
update employees set commission_pct=v_comm where employee_id=v_id;
END;

-- Ex 3:
-- Ecrire un bloc PL/SQL qui accorde à un employée donné une augmentation de salaire de :
-- 10% si son salaire entre 5000 et 8999
-- 12% si son salaire < 5000
-- 7% dans tous les autres cas

SET SERVEROUTPUT ON 

DECLARE

v_id employees.employee_id%type:=&s_id;
v_salary employees.salary%type;
v_percent NUMBER;
BEGIN 
select salary INTO v_salary from employees where employee_id=v_id;
if(v_salary <5000)
    then v_percent:=0.12;
    elsif (v_salary BETWEEN 5000 AND 8999)
    then v_percent:=0.1;
    else v_percent:=0.07;
end if;
update employees set salary=salary*(1+v_percent) where employee_id=v_id;
END;

