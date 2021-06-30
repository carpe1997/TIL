--7-1 서브쿼리 복습 

-- (1) 사원의 급여를 회사 전체 평균 급여와 해당 사원이 속한 부서 평균 급여와 비교하라

-- 부서별 평균 급여
SELECT department_id, ROUND(AVG(salary),0) dept_avg_sal
  FROM employees
 GROUP BY department_id
 ORDER BY 1;

-- 사원 테이블과 부서별 평균 급여 쿼리를 조인 ? 서브쿼리 사용
SELECT a.employee_id, 
       a.first_name || ' ' || a.last_name emp_name, 
       a.department_id, 
       a.salary, b.dept_avg_sal
  FROM employees a,
       ( SELECT department_id,
                ROUND(AVG(salary),0) dept_avg_sal
           FROM employees
          GROUP BY department_id
       ) b   
 WHERE a.department_id = b.department_id
 ORDER BY 1;
 
-- 회사 전체 급여 평균도 서브쿼리로 추가 
SELECT a.employee_id, 
       a.first_name || ' ' || a.last_name emp_name, 
       a.department_id, 
       a.salary, b.dept_avg_sal,   c.all_avg_sal
  FROM employees a,
       ( SELECT department_id,
                        ROUND(AVG(salary),0) dept_avg_sal
           FROM employees
          GROUP BY department_id    ) b
      ,( SELECT ROUND(AVG(salary),0) all_avg_sal
           FROM employees   ) c    
 WHERE a.department_id = b.department_id
 ORDER BY 1  ;
 

-- 회사 전체 급여 평균 서브쿼리는 단일 값을 반환하므로 스칼라 서브쿼리 형태로 사용 가능 
SELECT a.employee_id, 
       a.first_name || ' ' || a.last_name emp_name, 
       a.department_id, 
       a.salary, b.dept_avg_sal, 
      ( SELECT ROUND(AVG(salary),0)
           FROM employees   ) all_avg_sal
FROM employees a,
       ( SELECT department_id,
                        ROUND(AVG(salary),0) dept_avg_sal
           FROM employees
          GROUP BY department_id    ) b
   WHERE a.department_id = b.department_id
 ORDER BY 1  ;
 
 
--(2) 가장 급여가 많은 사원과 가장 적은 사원 이름과 급여 구하기
 
SELECT MIN(salary) min_sal,
       MAX(salary) max_sal
  FROM employees;


SELECT a.employee_id,
       a.first_name || ' ' || a.last_name emp_name,
       a.salary
  FROM employees a
 WHERE a.salary IN ( SELECT MIN(salary) min_sal,
                            MAX(salary) max_sal
                     FROM employees
                   );


SELECT a.employee_id,
       a.first_name || ' ' || a.last_name emp_name,
       a.salary
  FROM employees a
 WHERE a.salary IN ( SELECT MIN(salary) min_sal                                                        
                     FROM employees
                   );


SELECT a.employee_id,
       a.first_name || ' ' || a.last_name emp_name,
       a.salary
  FROM employees a
 WHERE a.salary IN ( SELECT MIN(salary) min_sal
                     FROM employees
                   )
    OR a.salary IN ( SELECT MAX(salary) min_sal
                     FROM employees
                   );
                   
                   
SELECT a.employee_id,
       a.first_name || ' ' || a.last_name emp_name,
       a.salary
  FROM employees a
 INNER JOIN ( SELECT MIN(salary) min_sal,
                     MAX(salary) max_sal
              FROM employees
            ) b
 ON a.salary = b.min_sal
 OR a.salary = b.max_sal;
                   

-- (3) 사원에 할당되지 않은 부서 정보 조회
SELECT *
  FROM departments 
 WHERE department_id NOT IN ( SELECT a.department_id
                              FROM employees a
                            ) ;

SELECT *
  FROM departments a
 WHERE NOT EXISTS ( SELECT 1
                    FROM employees b
                    WHERE a.department_id = b.department_id
                   ) 
ORDER BY 1;


-- (4) 입사 년도별 사원들의 급여 총액과  전년 대비 증가율을 구하라
SELECT TO_CHAR(hire_date, 'YYYY') years, SUM(salary) sal
  FROM employees 
 GROUP BY TO_CHAR(hire_date, 'YYYY')
 ORDER BY 1;


SELECT ty.years, ty.sal, ly.years, ly.sal
  FROM ( SELECT TO_NUMBER(TO_CHAR(hire_date, 'YYYY')) years, 
                SUM(salary) sal
         FROM employees 
         GROUP BY TO_CHAR(hire_date, 'YYYY')
        ) ty
  LEFT JOIN ( SELECT TO_NUMBER(TO_CHAR(hire_date, 'YYYY')) years, 
                     SUM(salary) sal
                FROM employees 
               GROUP BY TO_CHAR(hire_date, 'YYYY')
            ) ly
    ON ty.years - 1 = ly.years
 ORDER BY 1; 


SELECT ty.years, ty.sal, NVL(ly.sal,0) pre_sal,
       CASE WHEN NVL(ly.sal,0) = 0 THEN 0
            ELSE ROUND((ty.sal - ly.sal) / ly.sal * 100,2)
       END rates
  FROM ( SELECT TO_NUMBER(TO_CHAR(hire_date, 'YYYY')) years, SUM(salary) sal
           FROM employees 
          GROUP BY TO_CHAR(hire_date, 'YYYY')
       ) ty
  LEFT JOIN 
       ( SELECT TO_NUMBER(TO_CHAR(hire_date, 'YYYY')) years, SUM(salary) sal
           FROM employees 
          GROUP BY TO_CHAR(hire_date, 'YYYY')
       ) ly
    ON ty.years - 1 = ly.years
 ORDER BY 1; 
 
 
 
WITH cte1 AS (
SELECT  TO_NUMBER(TO_CHAR(hire_date, 'YYYY')) years, SUM(salary) sal
  FROM employees 
  GROUP BY TO_CHAR(hire_date, 'YYYY')
),
cte2 AS (
SELECT a.years, a.sal, b.years y2, NVL(b.sal,0) pre_sal
  FROM cte1 a
 LEFT JOIN cte1 b 
   ON a.years - 1 = b.years
)
SELECT years, sal, pre_sal,
       CASE WHEN pre_sal = 0 THEN 0
            ELSE ROUND((sal - pre_sal) / pre_sal * 100,2)
       END rates
 FROM cte2
 ORDER BY 1;



