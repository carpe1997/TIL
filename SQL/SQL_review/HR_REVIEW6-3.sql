--6-3 로우와 컬럼 간 변환

--로우를 컬럼으로
--PIVOT(~ FOR)
SELECT *
FROM SCORE_TABLE; 

SELECT *
FROM (SELECT  YEARS,GUBUN,SUBJECTS,SCORE FROM SCORE_TABLE)
PIVOT(SUM(SCORE)
    FOR SUBJECTS IN  ('국어','영어','수학','과학','지리','독일어'));
    
--컬럼을 로우로
--UNPIVOT ( ~ FOR )

SELECT *
FROM SCORE_COL_TABLE;

SELECT *
FROM SCORE_COL_TABLE
UNPIVOT (SCORE FOR SUBJECT IN (KOREAN AS '국어', ENGLISH  AS '영어', MATH AS '수학',  SCIENCE  AS '과학', GEOLOGY  AS '지리',GERMAN   AS '독일어'));




