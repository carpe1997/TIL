-- 7-3 Ʈ����� ó�� 
CREATE TABLE emp_tran AS
SELECT *
FROM emp1;


SELECT *
  FROM emp_tran;


DELETE emp_tran 
WHERE dept_id = 90;

COMMIT;

SELECT * FROM emp_tran;

UPDATE emp_tran
   SET emp_name = 'HAHA'
 WHERE dept_id = 60;

ROLLBACK;

SELECT * FROM emp_tran;

  
-- Merge
CREATE TABLE dept_mgr AS
SELECT *
FROM departments;

ALTER TABLE dept_mgr
ADD CONSTRAINTS dept_mgr_pk PRIMARY KEY (department_id);

SELECT *
  FROM dept_mgr;


MERGE INTO dept_mgr a
USING ( SELECT 280 dept_id, '������(Merge)' dept_name
          FROM dual
         UNION ALL
        SELECT 285 dept_id, '�渮��(Merge)' dept_name
          FROM dual
      ) b
  ON ( a.department_id = b.dept_id )
WHEN MATCHED THEN  -- ON ���ǿ� �����ϴ� ���� ������
UPDATE SET a.department_name = b.dept_name
WHEN NOT MATCHED THEN  --��ġ�ϴ� ���� ������
INSERT (a.department_id, a.department_name)
VALUES (b.dept_id, b.dept_name);


SELECT *
  FROM dept_mgr;



MERGE INTO dept_mgr a
USING ( SELECT 280 dept_id, '������(Merge)2' dept_name
          FROM dual
        UNION ALL
        SELECT 285 dept_id, '�渮��(Merge)2' dept_name
          FROM dual
      ) b
  ON ( a.department_id = b.dept_id)
WHEN MATCHED THEN      -- ��ġ�ϴ� ���� ������
UPDATE SET a.department_name = b.dept_name
WHEN NOT MATCHED THEN  --��ġ�ϴ� ���� ������
INSERT (a.department_id, a.department_name)
VALUES (b.dept_id, b.dept_name);

SELECT *
  FROM dept_mgr;



MERGE INTO dept_mgr a
USING ( SELECT 280 dept_id, '������(Merge)3' dept_name
          FROM dual
        UNION ALL
        SELECT 290 dept_id, '������(Merge)' dept_name
          FROM dual
      ) b
  ON ( a.department_id = b.dept_id)
WHEN MATCHED THEN     -- ��ġ�ϴ� ���� ������
UPDATE SET a.department_name = b.dept_name
WHEN NOT MATCHED THEN --��ġ�ϴ� ���� ������
INSERT (a.department_id, a.department_name)
VALUES (b.dept_id, b.dept_name);

SELECT *
  FROM dept_mgr;

-- View
SELECT a.employee_id, a.first_name || ' ' || a.last_name emp_names, 
       b.department_id ,b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 ORDER BY 1; 
 
 
CREATE OR REPLACE VIEW emp_dept_v AS
SELECT a.employee_id, 
       a.first_name || ' ' || a.last_name emp_names, 
       b.department_id ,b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 ORDER BY 1; 
 
SELECT *
  FROM emp_dept_v;
  
CREATE OR REPLACE VIEW emp_dept_v AS
SELECT a.employee_id, 
       a.first_name || ' ' || a.last_name emp_names, 
       a.salary,
       b.department_id ,b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 ORDER BY 1;   
 
-- hr2 ����� ����  
CREATE USER hr2 IDENTIFIED BY hr2;
 
-- hr2 ���� ���� �ο� 
GRANT CREATE SESSION TO hr2;

CREATE OR REPLACE VIEW emp_dept_v2 AS
SELECT a.employee_id, 
       a.first_name || ' ' || a.last_name emp_names, 
       b.department_id ,b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
 ORDER BY 1; 

GRANT SELECT ON emp_dept_v2 TO hr2;

-- hr2 ����ڷ� �α���
SELECT *
  FROM emp_dept_v2;
  

SELECT *
  FROM hr.emp_dept_v2;
  
  
SELECT *
  FROM hr.employees;
  
  
  
-- ������ ��ųʸ�
SELECT *
  FROM user_objects;

SELECT *
  FROM user_tables
 ORDER BY 1;
 
SELECT *
  FROM user_indexes;
  
SELECT *
  FROM user_constraints;    
  
SELECT *
  FROM user_tab_cols
 ORDER BY table_name, column_id ;
 
SELECT ',a.' || column_name
  FROM user_tab_cols
 WHERE table_name = 'EMPLOYEES' 
 ORDER BY column_id ; 