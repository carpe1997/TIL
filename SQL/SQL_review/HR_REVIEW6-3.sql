--6-3 �ο�� �÷� �� ��ȯ

--�ο츦 �÷�����
--PIVOT(~ FOR)
SELECT *
FROM SCORE_TABLE; 

SELECT *
FROM (SELECT  YEARS,GUBUN,SUBJECTS,SCORE FROM SCORE_TABLE)
PIVOT(SUM(SCORE)
    FOR SUBJECTS IN  ('����','����','����','����','����','���Ͼ�'));
    
--�÷��� �ο��
--UNPIVOT ( ~ FOR )

SELECT *
FROM SCORE_COL_TABLE;

SELECT *
FROM SCORE_COL_TABLE
UNPIVOT (SCORE FOR SUBJECT IN (KOREAN AS '����', ENGLISH  AS '����', MATH AS '����',  SCIENCE  AS '����', GEOLOGY  AS '����',GERMAN   AS '���Ͼ�'));




