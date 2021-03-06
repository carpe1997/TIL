--SQL 함수1: 숫자형 함수

--ABS:절댓값 반환
SELECT ABS(-10)
FROM DUAL;

--SIGN: N>0이면 +1 , N<0이면 -1
SELECT SIGN(-20)
FROM DUAL;

--MOD(N1,N2);N1/N2로 나눈 나머지반환
SELECT MOD(17,3)
FROM DUAL;

--ROUND(N,I):N의 소수점 기준 I+1번째에서 반올림한 값
SELECT ROUND(3.545,2)
FROM DUAL;

--TRUNC(N1,N2): N1의 소수점 기준 N2자리에서 절사
SELECT TRUNC(3.545,2)
FROM DUAL;

--ININCAP(CHR): CHR의 첫번째 문자를 대문자로 변환
SELECT INITCAP('sql')
FROM DUAL;

--LOWER(CHR): CHR을 소문자로 변경
SELECT LOWER('SQL')
FROM DUAL;

--UPPER(CHR): CHR을 대문자로 변경
SELECT UPPER('sql')
FROM DUAL;

--SUBSTR(CHR,N1,N2): CHR에서 N1에서 시작해 N2만큼 잘라냄
SELECT SUBSTR('APPPLE',2,3)
FROM DUAL;

--TRIM(CHR): CHR의 양쪽 끝 공백을 제거
SELECT TRIM('APPLE')
FROM DUAL;

--LENGTH(CHR): CHR의 글자수를 반환
SELECT LENGTH('APPLE')
FROM DUAL;

--REPLACE(CHR,'A','B'): CHR에서 A를 찾아 B로 대체
SELECT REPLACE('APPLE','P','C')
FROM DUAL;

--INSTR(CHR1,CHR2,N1,N2): CHR1을 CHR2문자를 찾아 반환, N1은 생략시 1, N2는 CHR2문자가 몇번째 위치를 반환)
SELECT INSTR('APPLE','P',2,2)
FROM DUAL;

--SYSDATE: 현재일자와 시간을 반환
SELECT SYSDATE
FROM DUAL;

--ADD_MONTHS(DATE,N): DATE날짜에 N개월을 더한 날짜를 반환
SELECT ADD_MONTHS(SYSDATE,1)
FROM DUAL;

--LAST_DATE(DATE): DATE가 속한 월의 마지막 일자

--SQL함수2: 형변환 및 기타 함수

--TO_NUMBER(CHR)
SELECT TO_NUMBER('123')
FROM DUAL;

--TO_CHAR(N,NUMBERFORMAT
SELECT TO_CHAR(12345,'99,999')
FROM DUAL;

--TO_CHAR(DATE,DATE_FORMAT)
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

--TO_DATE(CHAR,DATE_FORMAT)
SELECT TO_DATE('2020-06-15 23:52:02','YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

--NULL 값 처리를 위한 함수
--NVL(NULL,A) => NULL이면 'A'
--NVL2(NULL,'A','B') => NULL 이면 'B'
--COALESCE(NULL,NULL,NULL,'A')=> 'A'
--NULLIF('A','B')=>'A','B'가 같으면 NULL

--DECODE(EXPR,VAR1,RESULT1,VAL2,RESULT2,,,,,DEFAULT_VALUE)