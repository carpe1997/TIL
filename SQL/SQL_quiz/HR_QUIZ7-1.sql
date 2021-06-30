--7-2 QUiz

--1번
INSERT INTO departments
SELECT 500, 'IT2', manager_id, location_id
FROM departments
WHERE department_name = 'IT';

--2번
UPDATE departments
SET manager_id = CASE WHEN manager_id IS NULL THEN 100
ELSE 110
END
WHERE department_id >= 280;

--3번
DELETE departments
WHERE department_id >= 280;

--4번
CREATE TABLE covid19_kor AS
SELECT *
FROM covid19_test
WHERE iso_code = 'KOR'
AND dates BETWEEN TO_DATE('20200501','YYYYMMDD')
AND TO_DATE('20201031','YYYYMMDD');





