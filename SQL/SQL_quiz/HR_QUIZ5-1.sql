--5-2
--1��
select *
from jobs;

select *
from employees;

select a.employee_id,a.job_id,a.salary,b.min_salary,b.max_salary
from employees a, jobs b
where a.job_id=b.job_id
and a.salary>b.max_salary
or a.salary<b.min_salary
order by 1;

--2��
select *
from job_history;

select *
from employees;
--b���̺��� ���������ʴ°͵鵵 ��ȸ�Ѵ�. null���� ���⶧����, ���������� �ص� �Ȱ���.

--3��
steven king �� manager_id �� ���� ����

--4��
select a.employee_id,a.first_name||''||a.last_name employee_name ,a.manager_id,b.first_name||''||b.last_name manager_name
from employees a, employees b
where a.manager_id=b.employee_id
order by 1;

select a.employee_id,a.first_name||''||a.last_name employee_name, a.manager_id,b.first_name||''||b.last_name manager_name
from employees a, employees b
where a.manager_id=b.employee_id(+)
order by 1;

--5��
SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'David' AND SALARY>=6000;

SELECT * FROM DEPARTMENTS;

SELECT * FROM LOCATIONS;

select a.employee_id,a.first_name, a.salary,a.department_id,b.location_id,c.country_id
from employees a, departments b, locations c
where a.department_id=b.department_id
and b.location_id=c.location_id
and a.first_name='David'
and a.salary>=6000;

--6��
select *
from orders;

select *
from customers;

select *
from stores;

select *
from staffs;

select a.order_id,to_char(a.order_date,'YYYY-MM-DD HH24:MI:SS') order_date ,b.first_name||''||b.last_name customer_name,c.store_name,d.first_name||''||d.last_name staff_name
from orders a, customers b, stores c, staffs d
where a.customer_id=b.customer_id
and   a.store_id= c.store_id
and   a.staff_id=d.staff_id
and to_char(a.order_date,'YYYY-MM')='2018-01'
order by 2;

--7��
SELECT TO_CHAR(A.ORDER_DATE,'YYYY-MM') MONTHS, SUM(B.QUANTITY*B.LIST_PRICE) ORDER_AMT
FROM ORDERS A
JOIN ORDER_ITEMS B
ON A.ORDER_ID=B.ORDER_ID
WHERE TO_CHAR(A.ORDER_DATE,'YYYY')='2018'
GROUP BY TO_CHAR(A.ORDER_DATE,'YYYY-MM')
ORDER BY 1;

--8��
SELECT *
FROM ORDERS;
SELECT *
FROM ORDER_ITEMS;
SELECT *
FROM PRODUCTS;
SELECT *
FROM BRANDS;

SELECT TO_CHAR(A.ORDER_DATE,'YYYY-Q') QUARTER,  D.BRAND_NAME , SUM(B.QUANTITY*B.LIST_PRICE)
FROM ORDERS A
JOIN ORDER_ITEMS B
ON A.ORDER_ID=B.ORDER_ID
JOIN PRODUCTS C
ON B.PRODUCT_ID= C.PRODUCT_ID
JOIN BRANDS D
ON C.BRAND_ID=D.BRAND_ID
WHERE TO_CHAR(A.ORDER_DATE,'YYYY')='2018'
GROUP BY TO_CHAR(A.ORDER_DATE,'YYYY-Q'),D.BRAND_NAME
HAVING SUM(B.QUANTITY*B.LIST_PRICE)>=10000
ORDER BY 1,3 DESC;

--9��
SELECT *
FROM STORES;

SELECT TO_CHAR(A.ORDER_DATE,'YYYY') QUARTER, B.STORE_NAME, SUM(C.QUANTITY*C.LIST_PRICE) ORDER_AMT
FROM ORDERS A
JOIN STORES B
ON A.STORE_ID=B.STORE_ID
JOIN ORDER_ITEMS C
ON A.ORDER_ID=C.ORDER_ID
WHERE TO_CHAR(A.ORDER_DATE,'YYYY') BETWEEN '2016' AND '2018'
GROUP BY TO_CHAR(A.ORDER_DATE,'YYYY'),B.STORE_NAME
ORDER BY 1;