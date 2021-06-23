--4.1

--1��
SELECT COUNTRY_ID, COUNT(*)
FROM LOCATIONS
GROUP BY COUNTRY_ID;

--2��
SELECT *
FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE,'Q') �б⺰,COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'Q')
ORDER BY �б⺰;

--3��
SELECT JOB_ID,ROUND(AVG(SALARY),0) AVG_SALARY, SUM(SALARY)/COUNT(EMPLOYEE_ID) AVG_SALARY_1
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY 1;

--4��
SELECT *
FROM COVID19_TEST
WHERE ISO_CODE='KOR';

SELECT TO_CHAR(DATES,'YYYY-MM') ����,SUM(NEW_CASES) Ȯ���ڼ�
FROM COVID19_TEST
WHERE ISO_CODE='KOR'
GROUP BY TO_CHAR(DATES,'YYYY-MM')
ORDER BY 1;

--5��
SELECT TO_CHAR(DATES,'YYYY-MM') MONTHS,SUM(NEW_CASES) Ȯ���ڼ�, NVL(SUM(NEW_DEATHS),0) ����ڼ�, 
CASE WHEN NVL(SUM(NEW_DEATHS),0)=0 THEN 0
ELSE ROUND(NVL(SUM(NEW_DEATHS)/SUM(NEW_CASES),0),2)
END AS �����
FROM COVID19_TEST
WHERE ISO_CODE='KOR'
GROUP BY TO_CHAR(DATES,'YYYY-MM')
ORDER BY 1;

--6��
SELECT ISO_CODE ����, NVL(SUM(NEW_CASES),0) Ȯ���ڼ�
FROM COVID19_TEST
WHERE TO_CHAR(DATES,'YYYY-MM')='2020-10'
GROUP BY ISO_CODE
ORDER BY 2 DESC;

--4-2
--1��
SELECT JOB_ID, JOBS
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
UNION
SELECT JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=90
ORDER BY JOB_ID;
--SELECT ������ UNION�� ����ҽ� �����ϴ� �÷� ��, ������ Ÿ���� �����ϰ� �ؾߵȴ�.

--2��
SELECT EMPLOYEE_ID,HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY')='2001'
UNION
SELECT EMPLOYEE_ID,HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY')='2003';

SELECT JOB_ID,SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
UNION
SELECT '�հ�',SUM(SALARY)
FROM EMPLOYEES
ORDER BY 1;

--4��
SELECT *
FROM covid19_test;
----------------------------
SELECT COUNTRY,TO_CHAR(DATES,'YYYY-MM'),SUM(NEW_CASES)
FROM covid19_test
WHERE TO_CHAR(DATES,'YYYY-MM') BETWEEN '2020-01' AND '2020-06'
GROUP BY COUNTRY, TO_CHAR(DATES,'YYYY-MM')
HAVING NVL(SUM(NEW_CASES),0)>=10000;
----------------------------
SELECT COUNTRY,TO_CHAR(DATES,'YYYY-MM'),SUM(NEW_CASES)
FROM covid19_test
WHERE TO_CHAR(DATES,'YYYY-MM') BETWEEN '2020-07' AND '2020-10'
GROUP BY COUNTRY, TO_CHAR(DATES,'YYYY-MM')
HAVING NVL(SUM(NEW_CASES),0)<=1000;
---------------------------------
SELECT COUNTRY
FROM covid19_test
WHERE TO_CHAR(DATES,'YYYY-MM') BETWEEN '2020-01' AND '2020-06'
GROUP BY COUNTRY, TO_CHAR(DATES,'YYYY-MM')
HAVING NVL(SUM(NEW_CASES),0)>=10000
INTERSECT
SELECT COUNTRY
FROM covid19_test
WHERE TO_CHAR(DATES,'YYYY-MM') BETWEEN '2020-07' AND '2020-10'
GROUP BY COUNTRY, TO_CHAR(DATES,'YYYY-MM')
HAVING NVL(SUM(NEW_CASES),0)<=1000;

--SELECT����  TO_CHAR(DATES,'YYYY-MM'),SUM(NEW_CASES) ������ �� �ȵ���?
-- ����, ���� Ȯ����, Ȯ������ INTERSECT�� ����ϸ� �� ���� ���� ��ȸ�ϴµ� ���⶧����!