--6-1 QUIZ
--1��
SELECT A.EMPLOYEE_ID,A.FIRST_NAME||''||A.LAST_NAME EMP_NAME, A.JOB_ID, A.SALARY, (SELECT AVG(SALARY) FROM EMPLOYEES B WHERE A.JOB_ID=B.JOB_ID GROUP BY JOB_ID) AVG_SALARY
FROM EMPLOYEES A;

--2��
SELECT A.EMPLOYEE_ID,A.FIRST_NAME||''||A.LAST_NAME EMP_NAME, A.JOB_ID, A.SALARY, B.AVG_SALARY
FROM EMPLOYEES A, LATERAL(SELECT AVG(SALARY) AVG_SALARY FROM EMPLOYEES B WHERE A.JOB_ID=B.JOB_ID GROUP BY JOB_ID) B;

--3��
SELECT EMPLOYEE_ID,JOB_ID,SALARY FROM EMPLOYEES WHERE (JOB_ID,SALARY) IN (SELECT JOB_ID,MIN_SALARY FROM JOBS);

SELECT EMPLOYEE_ID,JOB_ID,SALARY FROM EMPLOYEES A WHERE EXISTS (SELECT JOB_ID,MIN_SALARY FROM JOBS B WHERE A.JOB_ID=B.JOB_ID AND A.SALARY <= B.MIN_SALARY);

--4��
SELECT *
FROM COVID19_TEST;


SELECT A.MONTHS, A.CONTINENT, A.COUNTRY, A.NEW_CASES, B.CONTINENT_CASES, DECODE(B.CONTINENT_CASES,0,0,ROUND(A.NEW_CASES/B.CONTINENT_CASES*100,2)) RATES 
FROM (SELECT TO_CHAR(DATES,'YYYY-MM') MONTHS, COUNTRY,CONTINENT,  SUM(NEW_CASES) NEW_CASES 
        FROM COVID19_TEST  GROUP BY TO_CHAR(DATES,'YYYY-MM'),COUNTRY,CONTINENT) A, 
        (SELECT TO_CHAR(DATES,'YYYY-MM') MONTHS,CONTINENT,  SUM(NEW_CASES) CONTINENT_CASES 
        FROM COVID19_TEST  GROUP BY TO_CHAR(DATES,'YYYY-MM'),CONTINENT)B
WHERE A.MONTHS=B.MONTHS
AND A.CONTINENT=B.CONTINENT
AND A.NEW_CASES>0
ORDER BY 1,2,4 DESC;


--5��

SELECT TO_CHAR(DATES,'YYYY-MM') MONTHS, NVL(SUM(NEW_TESTS),0) �˻��, NVL(SUM(NEW_CASES),0) Ȯ���ڼ�, ROUND(NVL(SUM(NEW_CASES),0)/NVL(SUM(NEW_TESTS),0),4)*100
FROM COVID19_TEST A
WHERE country='South Korea'
AND TO_CHAR(DATES,'YYYY')='2020'
GROUP BY TO_CHAR(DATES,'YYYY-MM')
order by 1;