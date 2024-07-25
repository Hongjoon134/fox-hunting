--CHAPTER 02. WHERE

-- WHERE�� �⺻ ��� ���
-- 3. SELECT ��ȸ�� �÷���1,....��ȸ�� �÷���N
-- 1. FROM  ��ȸ�� ���̺� ����
-- 2. WHERE ���ϴ� ���� �������� ���� ���ǽ� ;

-- �ǽ�1) ���� ���̺��� ����ID�� 105�� ������ FIRST_NAME, LAST_NAME�� ����ϱ�

SELECT *
  FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
-- �ǽ�1) �μ� ���̺��� �Ŵ��� ���̵� 100�� �μ� �̸��� �μ� ���̵� ����ϱ�
SELECT MANAGER_ID,DEPARTMENT_NAME,DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ;
 
 -- ���� ����Ű : ; ���� CTRL + ENTER / F9
 
 -- �ǽ�3) �������̺��� �޿��� 9000�� ������ ���� ID, �̸�(FIRST), �޿� ������ ����ϱ�
 SELECT *
   FROM EMPLOYEES ;
 
 SELECT  EMPLOYEE_ID, FIRST_NAME, SALARY
   FROM EMPLOYEES
  WHERE SALARY = 9000 ;
  
-- SQL���� ����ϴ� ������

-- ��� ������ ( +:���ϱ�, -:����, *:���ϱ�, /:������)
SELECT SALARY, SALARY*12 AS ����
 FROM EMPLOYEES ;
 
SELECT HIRE_DATE, HIRE_DATE+1 AS �Ի��ϴ�����
 FROM EMPLOYEES ;
 
-- �� ������(<(�ʰ�), <=(�̻�), >(�̸�), >=(����))

-- �ǽ�1) ���� ���̺��� �޿��� 5000������ ������ �̸��� �޿������� ����ϱ�!!

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000 
 ORDER BY SALARY ASC ;
 
--�ǽ�2) �������̺��� ������ 50000������ �������� �޿��� ������ ����ϱ�
-- ��, ������ AnnSal�̶�� ��Ī�� ����Ͽ� ���

SELECT FIRST_NAME,SALARY, SALARY*12 AS AnnSal
  FROM EMPLOYEES
 WHERE SALARY*12 <= 50000
 ORDER BY SALARY DESC ;
 
 -- ��� ������
 -- =: ����, 
 -- !=:���� �ʴ�, <>:���� �ʴ�, ^=:���� �ʴ�)
 -- NOT A=B : ���� �ʴ�.
 
 DESC EMPLOYEES ;
 
 -- ������ ���̿� ���ϱ� ���ؼ��� ����ǥ('')�� ������� �Ѵ�.
 -- ��¥ ��� ����,���� ���� ��쵵 ���������� ����ǥ('')�� ������� �Ѵ�.
 -- �빮�ڿ� �ҹ��� �� �����ؼ� �˻��ϱ�
 
 -- �ǽ�3)�������̺��� �������̵�(JOB_ID)�� IT_PROG�� �ƴ� ������ ������ ���
 --(FIRST_NAME, JOB_ID)�� ������ ����ϱ�
 
 SELECT FIRST_NAME, JOB_ID 
   FROM EMPLOYEES
  WHERE JOB_ID != 'IT_PROG' 
  ORDER BY FIRST_NAME DESC ;
  
-- ��Ī���� �ֵ���ǥ �����
-- �� �� �Ϲ� ���ڸ� ǥ���� ������ �ܵ���ǥ ���

-- �ǽ�) ���� ���̺��� �̸��� ������ SKING �� ������ ��� ������ ����ϱ�!
SELECT *
  FROM EMPLOYEES ;

SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;

-- �� ������ : ��(True)�̳� / ����(False)�̳�
-- AND(�׸���) : ������ ��� �����ϴ� ��� -> True
-- OR (�Ǵ�) : ���� �� �ϳ��� �����ϴ� ��� -> True

--�ǽ�) �������̺��� �μ� ���̵� 90�̰� �޿��� 5000�̻��� ������ ����
-- ���� ���̵�� ������ �̸��� ���

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000 ;
   
-- �ǽ�) �������̺��� �μ����̵� 100�̰ų� 
-- �Ի����� 06�� 02�� 02�� ���Ŀ� �Ի��� ������ ���� ����ϱ�
-- ������ �̸��� �Ի��� ���� ����ϱ�

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
    OR HIRE_DATE >= '06/02/02' 
ORDER BY HIRE_DATE ASC;

-- �ǽ�3) �μ� ID�� 100�̰ų� 90�� ���� �߿���
-- ���� ID�� 101�� ������ ���� ID, �̸�, ������ ��� (�� ����--> ANNSAL)

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "ANNSAL",EMPLOYEE_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE(DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90 )
    AND EMPLOYEE_ID = 101;    
-- AND >> OR : AND�� �� �켱������.

-- NULL ���� ������
-- IS NULL : ������ ���� NULL�� ���� ��ȸ�� ��
-- IS NOT NULL : ������ ���� NULL�� �ƴ� ���� ��ȸ�� ��

-- �ǽ�) �������̺��� ���ʽ��� �ִ� ������ �̸��� ���ʽ� ������ ����ϱ�.

SELECT EMPLOYEE_ID, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ;
 
 -- SQL ������ : SQL������ ����� �� �ִ� ������
 -- IN, BETWEEN A AND B, LIKE ������
 
 -- IN : Ư�� �÷��� ���Ե� �����͸� ������ ��ȸ�� �� Ȱ����
 -- IN�� Ư¡ : ����� �����, NULL ���� �����ϴ� Ư���� ����
 -- = + OR �����ڸ� ��ģ ������� �����Ѵ�.
 -- NULL ���� OR �����ڿ��� 
 
 -- �μ� ���̵� 30 OR 50 OR 90 �� ������ ��� ������ ����ϱ�
 
 SELECT *
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 30
     OR DEPARTMENT_ID = 50
     OR DEPARTMENT_ID = 90 
     OR DEPARTMENT_ID = 10 ;

-- IN ������ ����
  SELECT *
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID IN (30,50,90, NULL) ;
  
-- �μ� ���̵� ���� ������ FIRST_NAME�� �����ϱ��?

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IS NULL ; 
 
-- �ǽ�) �������̺��� �Ŵ��� ���̵� 100, 102, 103�� ������ �̸��� �Ŵ��� ���̵� ���!

SELECT FIRST_NAME, LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN (100,102,103) ; 
 
 -- NOT IN : Ư�� ���ǿ� �ش����� ���� ����� ����� ��
 -- != + AND �� ������ ������� ����Ѵ�
 -- NOT IN �����ڿ� NULL���� ������ �ƹ��� ���� ��µ��� �ʴ´�.
 -- �������̺��� �Ŵ��� ���̵� 100, 120, 121 �� �ƴ� ������ �̸��� �Ŵ��� ���̵� ���!
 SELECT FIRST_NAME, MANAGER_ID
   FROM EMPLOYEES 
  WHERE MANAGER_ID NOT IN (100,120,121,NULL) ;
  
-- �������̺��� �������̵� AD_VP �̰ų� ST_MAN�� ������ �̸��� �������̵� ����ϱ�!
SELECT FIRST_NAME, LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_VP','ST_MAN');

-- �������̺��� �Ŵ��� ���̵� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ��� ���̵� ���!
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (145,146,147,148,149);
 
-- BETWEEN A AND B :���� ������ - ���� ���� ���� �����͸� ��ȸ�Ҷ� ����ϴ� ������.
--> BETWEEN '�ּҰ�' AND '�ִ밪'
--> Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��.
--> BETWEEN A �̻� B ������ ���� ���� ���� ��ȸ�� ( A,B���� ������ ���!)

-- �ǽ�) �������̺��� �޿��� 10000�̻� 20000������ ������ �̸��� �޿��� ����ϱ�!
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 10000
   AND SALARY <= 20000 ;
   
-- BETWEEN ������ Ȱ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ; 
 
 -- �������̺��� 05�⿡ �Ի��� ������ �̸��� �Ի糯¥ ������ ����ϱ�
 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31' ;
 
-- LIKE ������ : �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�� �� �����
-- &, _ ���� ���ϵ�ī�带 �̿��ؼ� ��Ī ������ �����Ѵ�.


-- ���ϵ� ī���� ����
 -- %(�ۼ�Ʈ) : ���̿� ������� ��� ���� �����͸� �ǹ�
 -- _(�����) : � ���̵� ������� �Ѱ��� ���ڵ����͸� �ǹ�
 
 -- �ǽ�) �޴�����ȣ�� 650���� �����ϴ� ������ �̸�, ���� ��ȣ ���!!
 
 SELECT FIRST_NAME, PHONE_NUMBER 
   FROM EMPLOYEES 
  WHERE PHONE_NUMBER LIKE '650.%' ;
  
-- ����1) �������̺��� FIRST_NAME�� S�� �����ϰ� n���� ������ ������ �̸��� ����ϱ�!
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%'
   AND FIRST_NAME LIKE '%n';

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
-- ����2) �������̺��� FIRST_NAME�� it���� ������ �� 4������ ������ �̸��� ����ϱ�
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '__it' ;
 
-- ����3) �������̺��� �̸� �ι�° ���ڰ� e�� ������ �̸��� ���
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%' ;
 
-- ����4) �������̺��� 01���� �Ի��� ������ �̸��� �Ի糯¥�� ��� 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '__/01/__' ;

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '__/01%' ;
 
 -- 