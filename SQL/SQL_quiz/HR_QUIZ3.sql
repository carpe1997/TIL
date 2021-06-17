--3-1
--1��
SELECT UPPER('ȫ�浿')
FROM DUAL;

--2��
SELECT SUBSTR('IS THIS THE REAL LIFE? IS THIS JUST FANTASY?',-8,8)
FROM DUAL;

--3��
SELECT TRUNC(ADD_MONTHS(SYSDATE,1),'MM')
FROM DUAL;

--4��
SELECT *
FROM EMPLOYEES;

SELECT MONTHS_BETWEEN(SYSDATE,HIRE_DATE)
FROM EMPLOYEES
WHERE MANAGER_ID<110;

--5��
SELECT REPLACE(PHONE_NUMBER,'.','-')
FROM EMPLOYEES;

--6��
SELECT LOCATION_ID,STREET_ADDRESS
FROM LOCATIONS
WHERE LOCATION_ID <=2400;

SELECT  SUBSTR(STREET_ADDRESS,INSTR(STREET_ADDRESS,' ')) AS STREET_ADDRESS2
FROM LOCATIONS
WHERE LOCATION_ID <=2400;

--3-2
--1��
SELECT TO_CHAR(LAST_DAY(TO_DATE('2023-08-20')),'DAY')
FROM DUAL;

--2��
SELECT employee_id, FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT
    ,CASE WHEN COMMISSION_PCT IS NULL THEN SALARY
          ELSE SALARY+(SALARY*COMMISSION_PCT)
          END AS REAL_SALARY
FROM EMPLOYEES;

SELECT employee_id, FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT, NVL2(COMMISSION_PCT,SALARY+(SALARY*COMMISSION_PCT),SALARY) AS REAL_SALARY
FROM EMPLOYEES;

--3��

SELECT  employee_id, FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT, DECODE(COMMISSION_PCT,NULL,SALARY,SALARY+(SALARY*COMMISSION_PCT))
FROM EMPLOYEES;

--4��
SELECT ADD_MONTHS(SYSDATE,12)
FROM DUAL;

--5��
SELECT ADD_MONTHS(SYSDATE,36)
FROM DUAL;

--6��
SELECT (TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE),'YYYY'))-1)*365
FROM DUAL;

SELECT TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE),'DDD'))
FROM DUAL;

SELECT ((TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE),'YYYY'))-1)*365 )+ ( TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE),'DDD')))
FROM DUAL;